package dev.utaa.linimal.extension.core;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

public class KotlinUnitTest {
    @Test
    public void returnsTheSingletonOfTheObfuscatedUnitClass() {
        assertSame(ObfuscatedUnit.a, KotlinUnit.get(ObfuscatedUnit.class.getName(), getClass().getClassLoader()));
    }

    @Test
    public void rejectsAnotherSingletonWithTheSameShape() {
        assertNull(KotlinUnit.get(OtherSingleton.class.getName(), getClass().getClassLoader()));
    }

    @Test
    public void returnsNullWhenTheClassIsMissing() {
        assertNull(KotlinUnit.get("missing.Unit", getClass().getClassLoader()));
    }

    public static final class ObfuscatedUnit {
        public static final ObfuscatedUnit a = new ObfuscatedUnit();

        @Override
        public String toString() {
            return "kotlin.Unit";
        }
    }

    public static final class OtherSingleton {
        public static final OtherSingleton a = new OtherSingleton();
    }
}
