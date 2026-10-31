package io.github.emotionbug.patches.adot.security;

import io.github.emotionbug.patches.adot.PatchFiles;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedHashMap;
import java.util.Map;

/** Detector-only companion to DebuggerDetectionPatch, not a separate user option. */
public final class NativeDetectorPatch {
    private static final Profile[] PROFILES = {
        new Profile("arm64-v8a", 39824, 2, 183,
            "cfc1ab3f6259cbb3d53ef35f393e4342d891fd629097e80f73a6fff6d46f8703",
            new int[]{0x5c18, 0x6280, 0x6134},
            new String[]{"fd7bbaa9fc6f01a9", "fd7bbba9fc6701a9", "ff0301d1fd7b01a9"},
            "00008052c0035fd6"),
        new Profile("armeabi-v7a", 31284, 1, 40,
            "dfa7e908b631b4131128230325fcebe4e1fbcba6ae65bd6ff7b02e47d672a552",
            new int[]{0x4684, 0x4bbc, 0x4ac0},
            new String[]{"f0b503af", "f0b503af", "f0b503af"}, "00207047")
    };

    public interface LibrarySource { byte[] read(String entry, int expectedSize) throws IOException; }

    /** Reads and validates both libraries before returning any staged replacement. */
    public Map<String, byte[]> replacements(LibrarySource source) throws IOException {
        Map<String, byte[]> patched = new LinkedHashMap<>();
        for (Profile profile : PROFILES) {
            PatchFiles.checkInterrupted();
            byte[] bytes = source.read(profile.entry(), profile.size);
            patchLibrary(profile.abi, bytes);
            patched.put(profile.entry(), bytes);
        }
        return patched;
    }


    /** Mutates only the three verified entry ranges, after every guard has passed. */
    static void patchLibrary(String abi, byte[] bytes) throws IOException {
        Profile profile = null;
        for (Profile candidate : PROFILES) if (candidate.abi.equals(abi)) profile = candidate;
        if (profile == null) throw unsupported(abi, "unsupported ABI");
        if (bytes.length != profile.size) throw unsupported(abi, "unexpected library size");
        if (bytes[0] != 0x7f || bytes[1] != 'E' || bytes[2] != 'L' || bytes[3] != 'F'
            || bytes[4] != profile.elfClass || bytes[5] != 1 || bytes[6] != 1
            || bytes[16] != 3 || bytes[17] != 0 || (bytes[18] & 255) != profile.machine || bytes[19] != 0)
            throw unsupported(abi, "unexpected ELF ABI/header");
        for (int i = 0; i < profile.offsets.length; i++) {
            byte[] expected = profile.original[i];
            for (int j = 0; j < expected.length; j++)
                if (bytes[profile.offsets[i] + j] != expected[j])
                    throw unsupported(abi, "altered detector entry");
        }
        try {
            if (!MessageDigest.isEqual(profile.sha256, MessageDigest.getInstance("SHA-256").digest(bytes)))
                throw unsupported(abi, "unknown or altered library digest");
        } catch (NoSuchAlgorithmException impossible) {
            throw new IllegalStateException("SHA-256 unavailable", impossible);
        }
        // Shared TracerPid and maps bodies cover both JNI aliases. Early return at
        // fork_ptrace_attach prevents creating a child. Auth/signature code stays intact.
        for (int offset : profile.offsets)
            System.arraycopy(profile.replacement, 0, bytes, offset, profile.replacement.length);
    }

    private static IOException unsupported(String abi, String reason) {
        return new IOException("Unsupported or already patched libauthmanager.so (" + abi + "): " + reason);
    }

    private static byte[] hex(String value) {
        byte[] result = new byte[value.length() / 2];
        for (int i = 0; i < result.length; i++)
            result[i] = (byte) Integer.parseInt(value.substring(i * 2, i * 2 + 2), 16);
        return result;
    }

    private static final class Profile {
        final String abi;
        final int size, elfClass, machine;
        final byte[] sha256, replacement;
        final int[] offsets;
        final byte[][] original;
        Profile(String abi, int size, int elfClass, int machine, String sha256,
                int[] offsets, String[] original, String replacement) {
            this.abi = abi; this.size = size; this.elfClass = elfClass; this.machine = machine;
            this.sha256 = hex(sha256); this.offsets = offsets; this.replacement = hex(replacement);
            this.original = new byte[original.length][];
            for (int i = 0; i < original.length; i++) this.original[i] = hex(original[i]);
        }
        String entry() { return "lib/" + abi + "/libauthmanager.so"; }
    }
}
