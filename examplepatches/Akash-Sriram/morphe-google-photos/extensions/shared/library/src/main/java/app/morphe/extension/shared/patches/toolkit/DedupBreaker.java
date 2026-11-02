package app.morphe.extension.shared.patches.toolkit;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.zip.CRC32;

public final class DedupBreaker {
    private static final byte[] PNG_SIGNATURE = {(byte) 137, 80, 78, 71, 13, 10, 26, 10};
    private static final byte[] IEND = {0, 0, 0, 0, 73, 69, 78, 68, (byte) 174, 66, 96, (byte) 130};

    private DedupBreaker() {
    }

    private enum Container {
        JPEG {
            @Override
            boolean tag(File file, String token) throws IOException {
                long insertion = 2;
                try (RandomAccessFile input = new RandomAccessFile(file, "rw")) {
                    while (true) {
                        input.seek(insertion);
                        if (input.read() != 0xFF) return false;
                        int marker;
                        do {
                            marker = input.read();
                        } while (marker == 0xFF);
                        if (marker < 0xC0 || marker == 0xD8 || marker == 0xD9
                                || (marker >= 0xD0 && marker <= 0xD7)) return false;
                        if (input.length() - input.getFilePointer() < 2) return false;
                        int length = input.readUnsignedShort();
                        if (length < 2 || length - 2 > input.length() - input.getFilePointer()) return false;
                        if (marker < 0xE0 || marker > 0xEF) break;
                        insertion = input.getFilePointer() + length - 2;
                    }

                    byte[] payload = token.getBytes(StandardCharsets.UTF_8);
                    int payloadLength = Math.min(payload.length, 65533);
                    int segmentLength = payloadLength + 4;
                    byte[] buffer = new byte[65536];
                    long length = input.length();
                    input.setLength(length + segmentLength);
                    long position = length;
                    while (position > insertion) {
                        int size = (int) Math.min(buffer.length, position - insertion);
                        position -= size;
                        input.seek(position);
                        input.readFully(buffer, 0, size);
                        input.seek(position + segmentLength);
                        input.write(buffer, 0, size);
                    }
                    input.seek(insertion);
                    input.write(0xFF);
                    input.write(0xFE);
                    input.writeShort(payloadLength + 2);
                    input.write(payload, 0, payloadLength);
                    return true;
                }
            }
        },
        ISO_BMFF {
            @Override
            boolean tag(File file, String token) throws IOException {
                long length;
                try (RandomAccessFile input = new RandomAccessFile(file, "r")) {
                    length = input.length();
                    long position = 0;
                    while (position < length) {
                        if (length - position < 8) return false;
                        input.seek(position);
                        long size = input.readInt() & 0xFFFFFFFFL;
                        input.skipBytes(4);
                        int header = 8;
                        if (size == 0) return false;
                        if (size == 1) {
                            if (length - position < 16) return false;
                            size = input.readLong();
                            header = 16;
                        }
                        if (size < header || size > length - position) return false;
                        position += size;
                    }
                }
                byte[] payload = token.getBytes(StandardCharsets.UTF_8);
                long size = 8L + payload.length;
                try (FileOutputStream output = new FileOutputStream(file, true)) {
                    output.write(new byte[]{(byte) (size >>> 24), (byte) (size >>> 16),
                            (byte) (size >>> 8), (byte) size, 'f', 'r', 'e', 'e'});
                    output.write(payload);
                } catch (IOException e) {
                    try (RandomAccessFile output = new RandomAccessFile(file, "rw")) {
                        output.setLength(length);
                    }
                    throw e;
                }
                return true;
            }
        },
        PNG {
            @Override
            boolean tag(File file, String token) throws IOException {
                byte[] text = ("Comment\0" + token).getBytes(StandardCharsets.ISO_8859_1);
                byte[] type = {'t', 'E', 'X', 't'};
                CRC32 crc = new CRC32();
                crc.update(type);
                crc.update(text);
                try (RandomAccessFile output = new RandomAccessFile(file, "rw")) {
                    long length = output.length();
                    if (length < PNG_SIGNATURE.length + IEND.length) return false;
                    byte[] end = new byte[IEND.length];
                    output.seek(length - IEND.length);
                    output.readFully(end);
                    if (!Arrays.equals(end, IEND)) return false;
                    try {
                        output.setLength(length - IEND.length);
                        output.seek(length - IEND.length);
                        output.writeInt(text.length);
                        output.write(type);
                        output.write(text);
                        output.writeInt((int) crc.getValue());
                        output.write(IEND);
                    } catch (IOException e) {
                        output.setLength(length - IEND.length);
                        output.seek(length - IEND.length);
                        output.write(IEND);
                        throw e;
                    }
                }
                return true;
            }
        };

        abstract boolean tag(File file, String token) throws IOException;

        static Container detect(File file) throws IOException {
            byte[] header = new byte[8];
            try (RandomAccessFile input = new RandomAccessFile(file, "r")) {
                int length = input.read(header);
                if (length >= 2 && (header[0] & 0xFF) == 0xFF && (header[1] & 0xFF) == 0xD8) return JPEG;
                if (length < 8) return null;
                if (header[4] == 'f' && header[5] == 't' && header[6] == 'y' && header[7] == 'p') return ISO_BMFF;
                if (Arrays.equals(header, PNG_SIGNATURE)) return PNG;
                return null;
            }
        }
    }

    public static boolean tag(File file, String token) throws IOException {
        Container container = Container.detect(file);
        return container != null && container.tag(file, token);
    }
}
