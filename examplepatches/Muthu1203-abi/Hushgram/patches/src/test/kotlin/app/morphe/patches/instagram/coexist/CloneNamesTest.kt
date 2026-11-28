/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.coexist

import app.morphe.patcher.patch.OptionException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Test

class CloneNamesTest {
    @Test fun theDefaultsAreTakenAsTheyAre() {
        assertNull(clonePackageProblem(DEFAULT_PACKAGE))
        assertNull(cloneLabelProblem(DEFAULT_LABEL))
        assertEquals("com.instagram.android.hush", DEFAULT_PACKAGE)
        assertEquals("Instagram Clone", DEFAULT_LABEL)
    }

    @Test fun anyValidPackageIsTaken() {
        for (name in listOf("com.hushgram.android", "a.b", "org.example.Insta_2", "com.instagram.android2")) {
            assertNull(name, clonePackageProblem(name))
        }
    }

    @Test fun aPackageAndroidWouldRefuseOrAnotherAppsIsRefused() {
        val bad = listOf(
            null, "", "nodots", "1abc.def", "com..hush", "com.hush.", ".com.hush", "com.hu-sh.app", "com.hush.2go",
            "com.hush app.x", "com.ä.b", "com." + "a".repeat(120),
            "com.instagram.android", "COM.Instagram.Android", "com.instagram.android.debug", "com.instagram.barcelona",
            "com.facebook.katana", "com.facebook.orca", "com.whatsapp",
        )
        for (name in bad) assertNotNull("$name was taken", clonePackageProblem(name))
    }

    @Test fun aHomeScreenNameIsTakenWhenItStartsWithALetter() {
        for (label in listOf("Instagram 2", "IG (work)", "Insta+", "Ínstagram", "A")) assertNull(label, cloneLabelProblem(label))
        val bad = listOf(
            null, "", " Instagram", "Instagram ", "2nd Instagram", "@string/app_name", "?attr/name", "#ff0000",
            "true", "FALSE", "Insta\\gram", "Insta\"gram", "Insta\ngram", "Insta<gram>", "I".repeat(51),
        )
        for (label in bad) assertNotNull("$label was taken", cloneLabelProblem(label))
    }

    @Test fun movingANameKeepsWhatFollowsInstagramsPackage() {
        assertEquals("com.hush.provider.phoneid", underClone("com.instagram.android.provider.phoneid", "com.hush"))
        assertEquals("com.hush:mqtt", underClone("com.instagram.android:mqtt", "com.hush"))
        assertEquals("com.hush", underClone("com.instagram.android", "com.hush"))
        assertNull(underClone("com.instagram.androidx", "com.hush"))
        assertNull(underClone("com.instagram.fileprovider", "com.hush"))
        assertEquals("com.hush.com.instagram.fileprovider", cloneAuthority("com.instagram.fileprovider", "com.hush"))
        assertEquals("com.hush.securefileprovider", cloneAuthority("com.instagram.android.securefileprovider", "com.hush"))
    }


}
