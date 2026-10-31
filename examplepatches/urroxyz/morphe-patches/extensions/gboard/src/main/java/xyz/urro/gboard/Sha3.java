package xyz.urro.gboard;

/** SHA3-512 (FIPS 202). Android's JCA provider does not expose SHA-3 on all devices. */
final class Sha3 {
    private static final int RATE = 72;
    private static final int[] ROTATION = {
            0, 1, 62, 28, 27, 36, 44, 6, 55, 20, 3, 10, 43,
            25, 39, 41, 45, 15, 21, 8, 18, 2, 61, 56, 14
    };
    private static final long[] ROUND = {
            0x0000000000000001L, 0x0000000000008082L, 0x800000000000808aL, 0x8000000080008000L,
            0x000000000000808bL, 0x0000000080000001L, 0x8000000080008081L, 0x8000000000008009L,
            0x000000000000008aL, 0x0000000000000088L, 0x0000000080008009L, 0x000000008000000aL,
            0x000000008000808bL, 0x800000000000008bL, 0x8000000000008089L, 0x8000000000008003L,
            0x8000000000008002L, 0x8000000000000080L, 0x000000000000800aL, 0x800000008000000aL,
            0x8000000080008081L, 0x8000000000008080L, 0x0000000080000001L, 0x8000000080008008L
    };

    private Sha3() {}

    static byte[] sha3_512(byte[] input) {
        long[] state = new long[25];
        int offset = 0;
        while (input.length - offset >= RATE) {
            absorb(state, input, offset, RATE);
            permute(state);
            offset += RATE;
        }
        byte[] last = new byte[RATE];
        int length = input.length - offset;
        System.arraycopy(input, offset, last, 0, length);
        last[length] = 0x06;
        last[RATE - 1] |= (byte) 0x80;
        absorb(state, last, 0, RATE);
        permute(state);
        byte[] result = new byte[64];
        for (int i = 0; i < result.length; i++) result[i] = (byte) (state[i / 8] >>> (8 * (i % 8)));
        return result;
    }

    private static void absorb(long[] state, byte[] input, int offset, int length) {
        for (int i = 0; i < length; i++) state[i / 8] ^= (input[offset + i] & 0xffL) << (8 * (i % 8));
    }

    private static void permute(long[] state) {
        long[] column = new long[5], mixed = new long[25];
        for (long round : ROUND) {
            for (int x = 0; x < 5; x++) column[x] = state[x] ^ state[x + 5] ^ state[x + 10] ^ state[x + 15] ^ state[x + 20];
            for (int x = 0; x < 5; x++) {
                long delta = column[(x + 4) % 5] ^ Long.rotateLeft(column[(x + 1) % 5], 1);
                for (int y = 0; y < 5; y++) state[x + 5 * y] ^= delta;
            }
            for (int x = 0; x < 5; x++) for (int y = 0; y < 5; y++) {
                int source = x + 5 * y;
                mixed[y + 5 * ((2 * x + 3 * y) % 5)] = Long.rotateLeft(state[source], ROTATION[source]);
            }
            for (int x = 0; x < 5; x++) for (int y = 0; y < 5; y++) {
                state[x + 5 * y] = mixed[x + 5 * y] ^ (~mixed[(x + 1) % 5 + 5 * y] & mixed[(x + 2) % 5 + 5 * y]);
            }
            state[0] ^= round;
        }
    }
}
