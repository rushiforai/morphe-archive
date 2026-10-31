package com.reandroid.utils;

import org.junit.Assert;
import org.junit.Test;

import java.util.Random;
import java.util.zip.CRC32;

public class Crc32Test {

    @Test
    public void testMatchesPlatformChecksum() {
        byte[] data = randomBytes(100 * 1024);

        Crc32 crc32 = new Crc32();
        crc32.update(data, 0, data.length);
        Assert.assertEquals(platformCrc(data, 0, data.length), crc32.getValue());
        Assert.assertEquals(data.length, crc32.getLength());

        Assert.assertEquals(platformCrc(data, 10, 5000), Crc32.of(data, 10, 5000));
        Assert.assertEquals(platformCrc(data, 0, 0), new Crc32().getValue());
    }

    @Test
    public void testSmallAndLargeWritesMixed() {
        byte[] data = randomBytes(200 * 1024);
        Random random = new Random(1);

        // Small writes are gathered and large ones are not, in any order
        Crc32 crc32 = new Crc32();
        int offset = 0;
        while (offset < data.length) {
            int length = random.nextInt(4) == 0 ? random.nextInt(20000) : random.nextInt(10);
            length = Math.min(length, data.length - offset);
            crc32.update(data, offset, length);
            offset += length;
            if (random.nextInt(50) == 0) {
                // Reading the value in between must not change the result
                Assert.assertEquals(platformCrc(data, 0, offset), crc32.getValue());
            }
        }
        Assert.assertEquals(platformCrc(data, 0, data.length), crc32.getValue());
        Assert.assertEquals(data.length, crc32.getLength());
    }

    @Test
    public void testSingleBytesAndReset() {
        byte[] data = randomBytes(20000);

        Crc32 crc32 = new Crc32();
        crc32.update(data, 0, 100);
        crc32.reset();
        Assert.assertEquals(0, crc32.getLength());

        for (byte b : data) {
            crc32.update(b);
        }
        Assert.assertEquals(platformCrc(data, 0, data.length), crc32.getValue());
    }

    private static byte[] randomBytes(int length) {
        byte[] data = new byte[length];
        new Random(length).nextBytes(data);
        return data;
    }

    private static long platformCrc(byte[] data, int offset, int length) {
        CRC32 crc32 = new CRC32();
        crc32.update(data, offset, length);
        return crc32.getValue();
    }
}
