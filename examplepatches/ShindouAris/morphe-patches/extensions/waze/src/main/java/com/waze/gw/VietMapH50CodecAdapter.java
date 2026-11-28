package com.waze.gw;

import java.util.Arrays;

/** Bridges the validated H50 AES/frame codec into the protocol-session abstraction. */
final class VietMapH50CodecAdapter implements VietMapH50Session.FrameCodec {
    @Override public byte[] encode(int command, byte[] payload, long unixSeconds) {
        return VietMapH50FrameCodec.encodeEncryptedFrame(command, payload, unixSeconds);
    }

    @Override public VietMapH50Session.DecodedFrame decode(byte[] ciphertext) {
        VietMapH50FrameCodec.H50Frame frame =
                VietMapH50FrameCodec.decodeEncryptedFrame(ciphertext);
        return new VietMapH50Session.DecodedFrame(frame.command, frame.payloadCopy());
    }

    @Override public int expectedCiphertextLength(byte[] firstBlock) {
        if (firstBlock == null || firstBlock.length != VietMapH50FrameCodec.BLOCK_BYTES) {
            throw new IllegalArgumentException("H50 first ciphertext block must be 16 bytes");
        }
        byte[] plain = VietMapH50FrameCodec.decryptFrame(Arrays.copyOf(firstBlock,
                VietMapH50FrameCodec.BLOCK_BYTES));
        if (plain[0] != VietMapH50FrameCodec.MAGIC[0]
                || plain[1] != VietMapH50FrameCodec.MAGIC[1]) {
            throw new IllegalArgumentException("invalid H50 magic in first block");
        }
        int length = ((plain[6] & 0xFF) << 8) | (plain[7] & 0xFF);
        if (length < VietMapH50FrameCodec.BLOCK_BYTES
                || (length & (VietMapH50FrameCodec.BLOCK_BYTES - 1)) != 0) {
            throw new IllegalArgumentException("invalid H50 declared frame length");
        }
        return length;
    }
}
