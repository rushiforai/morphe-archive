package app.morphe.extension.applemusic.adi;

import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Store ADI (profile -1, secondary 272 bytes) OTP generator — direct port of
 * apple-auth (MIT). This is the profile the Apple Music "android-music" Store
 * protocol uses (X-Apple-AMD / X-Apple-AMD-M).
 *
 * Sources:
 *   src/adi/otp.cpp:20-42   decode_store_secondary   (CBC + whitening + maps + i^3 swap)
 *   src/adi/otp.cpp:63-79   decode_store_device_key  (byte maps + inverse key schedule)
 *   src/adi/otp.cpp:44-61   decode_store_byte_maps
 *   src/adi/otp.cpp:81-159  arithmetic_hash (custom SHA-256 variant)
 *   src/adi/otp.cpp:161-192 expand_arithmetic_digest + store_counter_message
 *   src/adi/otp.cpp:6-18    compute_otp_mac
 *   src/adi/state.cpp:277   decode_state_seed (shared with the Android profile)
 */
public final class StoreOtp {

    private StoreOtp() {}

    // ------------------------------------------- secondary -> decoded 272 B

    /** apple-auth src/adi/otp.cpp:20-42 */
    static byte[] decodeSecondary(byte[] ciphertext) {
        if (ciphertext.length % 16 != 0) {
            throw new IllegalArgumentException("Store secondary must be whole AES blocks");
        }
        byte[] key = AmdOtp.slice(StoreTables.SECONDARY_CIPHER, StoreTables.SECONDARY_KEY_OFF, 16);
        byte[] iv = AmdOtp.slice(StoreTables.SECONDARY_CIPHER, StoreTables.SECONDARY_IV_OFF, 16);
        byte[] whitening =
                AmdOtp.slice(StoreTables.SECONDARY_CIPHER, StoreTables.SECONDARY_WHITENING_OFF, 16);
        int[][] maps = new int[4][];
        for (int map = 0; map < 4; ++map) {
            maps[map] = AmdOtp.byteToInt(StoreTables.SECONDARY_CIPHER,
                    StoreTables.SECONDARY_MAPS_OFF + map * 8, 8);
        }
        byte[] output = new byte[ciphertext.length];
        byte[] previous = iv.clone();
        for (int offset = 0; offset < ciphertext.length; offset += 16) {
            byte[] plaintext = AmdOtp.aesBlock(key, ciphertext, offset, false);
            for (int index = 0; index < 16; ++index) {
                int value = (plaintext[index] ^ previous[index] ^ whitening[index]) & 0xFF;
                // Note the index^3 byte swap: it is Store-only (otp.cpp:37).
                output[offset + (index ^ 3)] = (byte) AmdOtp.linearMap(maps[index % 4], value);
            }
            previous = java.util.Arrays.copyOfRange(ciphertext, offset, offset + 16);
        }
        return output;
    }

    /** apple-auth src/adi/otp.cpp:44-61 decode_store_byte_maps */
    static int[][] decodeByteMaps(byte[] parameters) {
        int[][] result = new int[8][];
        for (int map = 0; map < 8; ++map) {
            int[] basis = StoreTables.MATRIX_BASIS[map].clone();
            for (int column = 0; column < 8; ++column) {
                int image = AmdOtp.linearMap(StoreTables.MATRIX_COLUMN_MAP[map][column],
                        parameters[StoreTables.MATRIX_SOURCE[map][column]] & 0xFF);
                for (int bit = 0; bit < 8; ++bit) {
                    if ((StoreTables.MATRIX_MASK[map][column] & (1 << bit)) != 0) {
                        basis[bit] ^= image;
                    }
                }
            }
            result[map] = basis;
        }
        return result;
    }

    /** apple-auth src/adi/otp.cpp:63-79 decode_store_device_key */
    public static byte[] decodeDeviceKey(byte[] secondary272) {
        if (secondary272.length != 272) {
            throw new IllegalArgumentException("Store secondary must be 272 bytes");
        }
        byte[] decoded = decodeSecondary(secondary272);
        byte[] parameters = java.util.Arrays.copyOfRange(decoded, 208, 272);
        int[][] maps = decodeByteMaps(parameters);
        byte[] roundKey = new byte[16];
        for (int index = 0; index < 16; ++index) {
            int encoded = (decoded[160 + index] ^ decoded[176 + index]
                    ^ StoreTables.WORD_MASK[index % 4] ^ StoreTables.ENCODED_KEY_OFFSETS[index])
                    & 0xFF;
            int intermediate = AmdOtp.linearMap(maps[index % 4], encoded);
            // KEY_OUTPUT_MAPS holds four LinearByteMaps of eight basis bytes each.
            int[] map = AmdOtp.byteToInt(StoreTables.KEY_OUTPUT_MAPS, (index % 4) * 8, 8);
            int outputMap = AmdOtp.linearMap(map, intermediate);
            roundKey[index ^ 3] = (byte) (outputMap ^ StoreTables.DECODED_KEY_OFFSETS[index]);
        }
        return AmdOtp.recoverAes128Key(roundKey);
    }

    // ------------------------------------------------- arithmetic hash

    /** apple-auth src/adi/otp.cpp:81-90 arithmetic_hash_round */
    static int[] hashRound(int[] state, int message, int constant) {
        int a = state[0], b = state[1], c = state[2], d = state[3];
        int e = state[4], f = state[5], g = state[6], h = state[7];
        int sigmaE = Integer.rotateRight(e, 25)
                + (Integer.rotateRight(e, 6) ^ Integer.rotateRight(e, 11));
        int first = h + sigmaE + 2 * g + e + (f ^ e) + message + constant;
        int second = c - a - (a ^ c) + 2 * b + Integer.rotateRight(a, 2)
                - Integer.rotateRight(a, 13) - Integer.rotateRight(a, 22);
        int head = first + second;
        return new int[] {head, a, b, c, d + first, e, f, g};
    }

    /** apple-auth src/adi/otp.cpp:92-101 arithmetic_hash_schedule_word */
    static int scheduleWord(int oldest, int fifteen, int seven, int two) {
        int first = Integer.rotateRight(fifteen, 7) + Integer.rotateRight(fifteen, 18)
                - (fifteen >>> 3);
        int second = Integer.rotateRight(two, 17) - Integer.rotateRight(two, 19)
                - (two >>> 10);
        return seven - oldest + (first ^ second);
    }

    /** apple-auth src/adi/otp.cpp:103-128 arithmetic_hash_compress */
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
            state = hashRound(state, words[index], StoreTables.HASH_ROUND_CONSTANTS[index]);
        }
        return new int[] {
            state[0] - initial[0], state[1] - initial[1], state[2] - initial[2],
            state[3] + initial[3], state[4] - initial[4], state[5] + initial[5],
            state[6] ^ initial[6], state[7] ^ initial[7],
        };
    }

    /** apple-auth src/adi/otp.cpp:130-159 arithmetic_hash */
    public static byte[] arithmeticHash(byte[] message) {
        int[] state = StoreTables.HASH_INITIAL_STATE.clone();
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

    // ------------------------------------------------------------- OTP

    /** apple-auth src/adi/otp.cpp:194-209 derive_store_hash_material + generate_store_otp */
    public static byte[] generateOtp(byte[] seed, int counter, byte[] deviceKey) {
        byte[] seedHash = arithmeticHash(seed);
        byte[] expandedHash = arithmeticHash(AmdOtp.expandArithmeticDigest(seedHash));
        byte[] counterHash = arithmeticHash(AmdOtp.counterMessage(seed, counter));
        return AmdOtp.computeOtpMac(
                new byte[][] {seedHash, expandedHash, counterHash}, deviceKey);
    }

    /** 24-byte X-Apple-AMD envelope: u32 4 | u32 16 | OTP. */
    public static byte[] amdHeader(byte[] otp) {
        byte[] header = new byte[24];
        header[3] = 4;
        header[7] = 16;
        System.arraycopy(otp, 0, header, 8, 16);
        return header;
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

    /** Convenience for the patched provider: raw 16-byte Store OTP. */
    public static byte[] computeOtp(byte[] secondary, byte[] encryptedSeed, int counter) {
        return generateOtp(AmdOtp.decodeSeed(encryptedSeed), counter, decodeDeviceKey(secondary));
    }

    /** 24-byte Store AMD envelope: u32 ver=4, u32 len=16, 16-byte OTP. */
    public static byte[] amd(byte[] otp) {
        return amdHeader(otp);
    }

}
