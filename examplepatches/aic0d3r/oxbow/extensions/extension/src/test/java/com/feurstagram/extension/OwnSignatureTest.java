package com.feurstagram.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.nio.charset.StandardCharsets;

/** The comparison behind the signature patch: only this APK's own key hash is "own". */
public class OwnSignatureTest {

    /** Stands in for Instagram's key-hash value class (X.04jp in 456): one String field, no getter. */
    static final class KeyHash {
        final String value;
        KeyHash(String value) { this.value = value; }
    }

    static final class TwoStrings {
        final String first = "a";
        final String second = "b";
    }

    @Test
    public void onlyTheSameHashIsOwn() {
        assertTrue(OwnSignature.isOwn(new KeyHash("abc"), "abc"));
        assertFalse(OwnSignature.isOwn(new KeyHash("abc"), "abd"));   // another app's certificate
        assertFalse(OwnSignature.isOwn(null, "abc"));                 // no caller
        assertFalse(OwnSignature.isOwn(new KeyHash("abc"), ""));      // own hash unreadable: trust nobody extra
    }

    @Test
    public void theHashIsReadFromTheValuesOnlyStringField() {
        assertFalse(OwnSignature.isOwn("abc", "abc"));                // a bare String has no fields
        assertFalse(OwnSignature.isOwn(new TwoStrings(), "abc"));     // ambiguous: not one of ours
        assertFalse(OwnSignature.isOwn(new Object(), "abc"));
    }

    @Test
    public void keyHashIsInstagramsEncoding() throws Exception {
        // SHA-256, URL-safe alphabet, no padding: 43 characters, like every entry of Instagram's allowlist.
        assertEquals("LXEWQrcmsEQBYnyp-6wy9chTD7GQPMTbAiWHF5IaSIE",
                OwnSignature.keyHash("x".getBytes(StandardCharsets.US_ASCII)));
        assertEquals(43, OwnSignature.keyHash("oxbow".getBytes(StandardCharsets.US_ASCII)).length());
    }
}
