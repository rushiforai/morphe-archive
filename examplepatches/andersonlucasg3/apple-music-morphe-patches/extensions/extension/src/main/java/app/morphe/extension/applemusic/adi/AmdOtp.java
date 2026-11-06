package app.morphe.extension.applemusic.adi;

import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * Android ADI (platform 4) OTP generator — direct port of apple-auth (MIT):
 * src/adi/android.cpp (secondary decode, key mixing, android_hash, OTP),
 * src/adi/otp.cpp (expand_arithmetic_digest, store_counter_message, otp MAC),
 * src/adi/state.cpp (seed decryption), src/crypto/crypto.cpp (recover_aes128_key).
 *
 * Everything uses only javax.crypto (AES/ECB/NoPadding), which exists on API 29.
 */
public final class AmdOtp {

    private AmdOtp() {}

    // ---------------------------------------------------------------- AES

    static byte[] aesBlock(byte[] key, byte[] block, int offset, boolean encrypt) {
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/NoPadding");
            cipher.init(encrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE,
                    new SecretKeySpec(key, "AES"));
            return cipher.doFinal(block, offset, 16);
        } catch (Exception error) {
            throw new IllegalStateException("AES failure", error);
        }
    }

    // ---------------------------------------------------- key recovery

    /** apple-auth src/crypto/crypto.cpp:80-99 */
    static byte[] recoverAes128Key(byte[] finalRoundKey) {
        final int[] roundConstants = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1B, 0x36};
        byte[] current = finalRoundKey.clone();
        for (int round = roundConstants.length; round != 0; --round) {
            byte[] previous = new byte[16];
            for (int index = 4; index < 16; ++index) {
                previous[index] = (byte) (current[index] ^ current[index - 4]);
            }
            int[] transformed = {
                (Tables.AES_SBOX[previous[13] & 0xFF] ^ roundConstants[round - 1]) & 0xFF,
                Tables.AES_SBOX[previous[14] & 0xFF] & 0xFF,
                Tables.AES_SBOX[previous[15] & 0xFF] & 0xFF,
                Tables.AES_SBOX[previous[12] & 0xFF] & 0xFF,
            };
            for (int index = 0; index < 4; ++index) {
                previous[index] = (byte) (current[index] ^ transformed[index]);
            }
            current = previous;
        }
        return current;
    }

    /** apple-auth src/adi/internal.hpp:195-207 (LinearByteMap) */
    static int linearMap(int[] basis, int value) {
        int result = 0;
        for (int bit = 0; bit < 8; ++bit) {
            if ((value & (1 << bit)) != 0) {
                result ^= basis[bit];
            }
        }
        return result & 0xFF;
    }

    // ------------------------------------------- secondary → device key

    /** apple-auth src/adi/otp.cpp:265-285 decode_gsa_secondary (Android parameters) */
    static byte[] decodeSecondary(byte[] ciphertext) {
        byte[] key = slice(Tables.SECONDARY_CIPHER, Tables.SECONDARY_KEY_OFF, 16);
        byte[] iv = slice(Tables.SECONDARY_CIPHER, Tables.SECONDARY_IV_OFF, 16);
        byte[] whitening = slice(Tables.SECONDARY_CIPHER, Tables.SECONDARY_WHITENING_OFF, 16);
        int[][] maps = new int[4][];
        for (int map = 0; map < 4; ++map) {
            maps[map] = byteToInt(Tables.SECONDARY_CIPHER,
                    Tables.SECONDARY_MAPS_OFF + map * 8, 8);
        }
        byte[] output = new byte[ciphertext.length];
        byte[] previous = iv.clone();
        for (int offset = 0; offset < ciphertext.length; offset += 16) {
            byte[] block = java.util.Arrays.copyOfRange(ciphertext, offset, offset + 16);
            byte[] plaintext = aesBlock(key, ciphertext, offset, false);
            for (int index = 0; index < 16; ++index) {
                int value = (plaintext[index] ^ previous[index] ^ whitening[index]) & 0xFF;
                output[offset + index] = (byte) linearMap(maps[index % 4], value);
            }
            previous = block;
        }
        return output;
    }

    /** apple-auth src/adi/android.cpp:19-47 mix_android_key_state */
    static byte[] mixAndroidKeyState(byte[] input) {
        byte[] state = new byte[384];
        for (int index = 0; index < state.length; ++index) {
            state[index] = (byte) (input[index] ^ 0x46);
        }
        int feedback = ((state[378] & 0xFF) + (state[286] & 0xFF) + (state[106] & 0xFF)
                + (state[93] & 0xFF)) & 0xFF;
        state[74] = (byte) ((state[74] & 0xFF) - feedback);
        for (int position : Tables.MIXING_POSITIONS) {
            int value = state[position] & 0xFF;
            switch (feedback & 3) {
                case 0:
                    value = (value + feedback) & 0xFF;
                    break;
                case 1:
                    value = (value - feedback) & 0xFF;
                    break;
                case 2:
                    value ^= feedback;
                    break;
                default:
                    break;
            }
            state[position] = (byte) value;
            feedback = ((feedback ^ value) + 0x1B) & 0xFF;
        }
        for (int index = 0; index < state.length; ++index) {
            state[index] = (byte) (state[index] ^ 0x46);
        }
        return state;
    }

    /** apple-auth src/adi/android.cpp:49-65 decode_android_device_key */
    public static byte[] decodeAndroidDeviceKey(byte[] secondary384) {
        if (secondary384.length != 384) {
            throw new IllegalArgumentException("Android secondary must be 384 bytes");
        }
        byte[] mixed = mixAndroidKeyState(decodeSecondary(secondary384));
        int[] map = Tables.KEY_MAP;
        byte[] round = new byte[16];
        for (int index = 0; index < 16; ++index) {
            int first = mixed[Tables.KEY_SOURCES[index * 3] & 0xFFFF] & 0xFF;
            int second = mixed[Tables.KEY_SOURCES[index * 3 + 1] & 0xFFFF] & 0xFF;
            int third = mixed[Tables.KEY_SOURCES[index * 3 + 2] & 0xFFFF] & 0xFF;
            round[index] = (byte) (Tables.KEY_OFFSETS[index] ^ first
                    ^ linearMap(map, second ^ third));
        }
        return recoverAes128Key(round);
    }

    // ------------------------------------------------------ android hash

    /** apple-auth src/adi/android.cpp:70-80 android_hash_round */
    static int[] hashRound(int[] state, int message, int constant) {
        int a = state[0], b = state[1], c = state[2], d = state[3];
        int e = state[4], f = state[5], g = state[6], h = state[7];
        int sigmaE = (Integer.rotateRight(e, 25) - Integer.rotateRight(e, 6)
                - Integer.rotateRight(e, 11));
        int mixedEfg = ((e + g) ^ (e + f) ^ g);
        int first = h + sigmaE + mixedEfg + message + constant;
        int sigmaA = ((Integer.rotateRight(a, 2) - Integer.rotateRight(a, 13))
                ^ Integer.rotateRight(a, 22));
        int mixedAbc = ((b ^ c) + ((a ^ b) ^ (a + c)));
        int second = sigmaA ^ mixedAbc;
        int head = first + second;
        return new int[] {head, a, b, c, d + first, e, f, g};
    }

    /** apple-auth src/adi/android.cpp:82-89 android_hash_schedule_word */
    static int scheduleWord(int oldest, int fifteen, int seven, int two) {
        int first = (Integer.rotateRight(fifteen, 7) ^ Integer.rotateRight(fifteen, 18))
                + (fifteen >>> 3);
        int second = (Integer.rotateRight(two, 17) - Integer.rotateRight(two, 19))
                ^ (two >>> 10);
        return (first ^ seven ^ second) - oldest;
    }

    /** apple-auth src/adi/android.cpp:91-115 android_hash_compress */
    static int[] hashCompress(int[] initial, byte[] block, int offset) {
        int[] words = new int[64];
        for (int index = 0; index < 16; ++index) {
            int base = offset + index * 4;
            words[index] = ((block[base] & 0xFF) << 24) | ((block[base + 1] & 0xFF) << 16)
                    | ((block[base + 2] & 0xFF) << 8) | (block[base + 3] & 0xFF);
        }
        for (int index = 16; index < 64; ++index) {
            words[index] = scheduleWord(words[index - 16], words[index - 15],
                    words[index - 7], words[index - 2]);
        }
        int[] state = initial.clone();
        for (int index = 0; index < 64; ++index) {
            state = hashRound(state, words[index], Tables.HASH_ROUND_CONSTANTS[index]);
        }
        return new int[] {
            state[0] - initial[0], state[1] + initial[1], state[2] + initial[2],
            state[3] + initial[3], state[4] ^ initial[4], state[5] - initial[5],
            state[6] + initial[6], state[7] ^ initial[7],
        };
    }

    /** apple-auth src/adi/android.cpp:117-144 android_hash */
    public static byte[] androidHash(byte[] message) {
        int[] state = Tables.HASH_INITIAL_STATE.clone();
        int complete = message.length - message.length % 64;
        for (int offset = 0; offset < complete; offset += 64) {
            state = hashCompress(state, message, offset);
        }
        byte[] tail = new byte[128];
        int remaining = message.length - complete;
        System.arraycopy(message, complete, tail, 0, remaining);
        tail[remaining] = (byte) 0x80;
        int padded = remaining < 56 ? 64 : 128;
        long bitLength = (long) message.length * 8;
        for (int index = 0; index < 8; ++index) {
            tail[padded - 1 - index] = (byte) (bitLength >>> (index * 8));
        }
        for (int offset = 0; offset < padded; offset += 64) {
            state = hashCompress(state, tail, offset);
        }
        byte[] digest = new byte[32];
        for (int index = 0; index < 8; ++index) {
            digest[index * 4] = (byte) (state[index] >>> 24);
            digest[index * 4 + 1] = (byte) (state[index] >>> 16);
            digest[index * 4 + 2] = (byte) (state[index] >>> 8);
            digest[index * 4 + 3] = (byte) state[index];
        }
        return digest;
    }

    // -------------------------------------------------- OTP composition

    /** apple-auth src/adi/otp.cpp:161-170 expand_arithmetic_digest */
    static byte[] expandArithmeticDigest(byte[] digest) {
        byte[] expanded = new byte[64];
        for (int index = 0; index < expanded.length; ++index) {
            int left = (5 * index + 7) % digest.length;
            int right = (5 * index * index + 9) % digest.length;
            int adjusted = ((digest[right] & 0xFF) + 42) & 0xFF;
            expanded[index] = (byte) ((digest[left] & 0xFF) ^ adjusted);
        }
        return expanded;
    }

    /** apple-auth src/adi/otp.cpp:172-192 store_counter_message */
    static byte[] counterMessage(byte[] seed, int counter) {
        byte[] message = new byte[55];
        long unsignedCounter = counter & 0xFFFFFFFFL;
        for (int index = 0; index < 4; ++index) {
            long modulus = Tables.COUNTER_MODULI[index] & 0xFFFFFFFFL;
            long remainder = unsignedCounter % modulus;
            message[index * 2] = (byte) (remainder >>> 8);
            message[index * 2 + 1] = (byte) remainder;
        }
        int rolling = 0x6B532D89;
        for (int index = 0; index < seed.length * 3; ++index) {
            int destination = (index + 7) % message.length;
            int mixed = (((rolling ^ 0x1A) & 0xFF) + (seed[(index * 2 + 1) % seed.length] & 0xFF))
                    & 0xFF;
            message[destination] ^= (byte) mixed;
            rolling ^= (message[destination] & 0xFF) * 0x5D809044;
        }
        return message;
    }

    /** apple-auth src/adi/otp.cpp:6-18 compute_otp_mac */
    static byte[] computeOtpMac(byte[][] hashes, byte[] deviceKey) {
        byte[] state = new byte[16];
        for (byte[] hash : hashes) {
            for (int offset = 0; offset < hash.length; offset += 16) {
                for (int index = 0; index < 16; ++index) {
                    state[index] ^= hash[offset + index];
                }
                state = aesBlock(deviceKey, state, 0, true);
            }
        }
        return state;
    }

    /** apple-auth src/adi/android.cpp:146-154 generate_android_otp */
    public static byte[] generateOtp(byte[] seed, int counter, byte[] deviceKey) {
        byte[] seedHash = androidHash(seed);
        byte[] expandedHash = androidHash(expandArithmeticDigest(seedHash));
        byte[] counterHash = androidHash(counterMessage(seed, counter));
        return computeOtpMac(new byte[][] {seedHash, expandedHash, counterHash}, deviceKey);
    }

    /** apple-auth src/adi/state.cpp:277-292 decode_state_seed */
    public static byte[] decodeSeed(byte[] encryptedSeed) {
        byte[] previous = clone(Tables.SEED_CIPHER_IV);
        byte[] seed = new byte[32];
        for (int offset = 0; offset < 32; offset += 16) {
            byte[] plaintext = aesBlock(clone(Tables.SEED_CIPHER_KEY), encryptedSeed, offset, false);
            for (int index = 0; index < 16; ++index) {
                seed[offset + index] = (byte) (plaintext[index] ^ previous[index]);
            }
            previous = java.util.Arrays.copyOfRange(encryptedSeed, offset, offset + 16);
        }
        return seed;
    }

    // ------------------------------------------------------------- utils

    static byte[] slice(int[] source, int offset, int length) {
        byte[] result = new byte[length];
        for (int index = 0; index < length; ++index) {
            result[index] = (byte) source[offset + index];
        }
        return result;
    }

    static int[] byteToInt(int[] source, int offset, int length) {
        int[] result = new int[length];
        for (int index = 0; index < length; ++index) {
            result[index] = source[offset + index] & 0xFF;
        }
        return result;
    }

    static byte[] clone(int[] source) {
        return slice(source, 0, source.length);
    }

    public static String hex(byte[] value) {
        StringBuilder text = new StringBuilder(value.length * 2);
        for (byte item : value) {
            text.append(String.format("%02x", item & 0xFF));
        }
        return text.toString();
    }

    static String jsonString(String json, String key) {
        Matcher matcher = Pattern.compile("\"" + key + "\"\\s*:\\s*\"([^\"]*)\"").matcher(json);
        if (!matcher.find()) {
            throw new IllegalArgumentException("missing key " + key);
        }
        return matcher.group(1);
    }

    static int jsonInt(String json, String key) {
        Matcher matcher = Pattern.compile("\"" + key + "\"\\s*:\\s*(-?\\d+)").matcher(json);
        if (!matcher.find()) {
            throw new IllegalArgumentException("missing key " + key);
        }
        return Integer.parseInt(matcher.group(1));
    }

    /** Convenience for the patched provider: decode the embedded profile and return the raw OTP. */
    public static byte[] computeOtp(byte[] secondary, byte[] encryptedSeed, int counter) {
        return generateOtp(decodeSeed(encryptedSeed), counter, decodeAndroidDeviceKey(secondary));
    }

}
