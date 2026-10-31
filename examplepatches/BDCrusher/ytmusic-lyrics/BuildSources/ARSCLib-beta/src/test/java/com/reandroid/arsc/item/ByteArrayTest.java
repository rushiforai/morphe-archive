package com.reandroid.arsc.item;

import org.junit.Assert;
import org.junit.Test;

public class ByteArrayTest {

    @Test
    public void testEqualsIgnoreTrailZero() {
        byte[] bytes = {1, 2, 3};
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(bytes, bytes));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(bytes, new byte[]{1, 2, 3}));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(bytes, new byte[]{1, 2, 3, 0, 0}));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(new byte[]{1, 2, 3, 0}, bytes));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(new byte[]{1, 0, 3, 0}, new byte[]{1, 0, 3}));

        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(null, null));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(null, new byte[0]));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(new byte[]{0, 0}, null));
        Assert.assertTrue(ByteArray.equalsIgnoreTrailZero(new byte[]{0}, new byte[0]));

        Assert.assertFalse(ByteArray.equalsIgnoreTrailZero(bytes, new byte[]{1, 2}));
        Assert.assertFalse(ByteArray.equalsIgnoreTrailZero(bytes, new byte[]{1, 2, 3, 0, 4}));
        Assert.assertFalse(ByteArray.equalsIgnoreTrailZero(new byte[]{1, 2, 4}, bytes));
        Assert.assertFalse(ByteArray.equalsIgnoreTrailZero(null, new byte[]{0, 1}));
        Assert.assertFalse(ByteArray.equalsIgnoreTrailZero(new byte[]{0, 1}, new byte[]{1}));
    }
}
