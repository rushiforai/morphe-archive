package com.google.android.libraries.inputmethod.metadata;

/** Test-only ABI fixture for the KeyboardDef.d source entries. */
public interface KeyboardSource {
    final class Xml implements KeyboardSource {
        public final int a;

        public Xml(int a) {
            this.a = a;
        }
    }

    final class UnparceledProvider implements KeyboardSource {
        public final String a;

        public UnparceledProvider(String a) {
            this.a = a;
        }
    }
}
