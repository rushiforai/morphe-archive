/*
 * Copyright 2026 HushGram contributors. https://github.com/SysAdminDoc/HushGram
 * SPDX-License-Identifier: GPL-3.0-only
 */
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.HexFormat;
import java.util.Properties;

/** Runs from the JDK before either launcher loads any wrapper JAR code. */
public final class VerifyGradleWrapper {
    // Independently reviewed at https://gradle.org/release-checksums/ on 2026-10-03.
    private static final String VERSION = "9.8.0";
    private static final String JAR_SHA256 = "238e777fcddd7e34f9708186085def2abd6e08e658505b38718d79d74c21abd5";
    private static final String ZIP_SHA256 = "bafd5ce9cfaea0fbccfdc8439a1ac42fbd4cd9c89dc9a988228d8a2639a58e6c";

    public static void main(String[] args) {
        try {
            if (args.length != 1) throw new IllegalArgumentException("Expected the checkout directory.");
            Path wrapper = Path.of(args[0]).resolve("gradle/wrapper");
            Properties properties = new Properties();
            try (InputStream input = Files.newInputStream(wrapper.resolve("gradle-wrapper.properties"))) {
                properties.load(input);
            } catch (Exception failure) {
                throw new IllegalStateException("Gradle wrapper properties are unreadable.", failure);
            }
            String reviewedUrl = "https://services.gradle.org/distributions/gradle-" + VERSION + "-bin.zip";
            if (!reviewedUrl.equals(properties.getProperty("distributionUrl"))) {
                throw new IllegalStateException("The wrapper distribution is not the reviewed Gradle " + VERSION + " binary URL.");
            }
            if (!ZIP_SHA256.equals(properties.getProperty("distributionSha256Sum"))) {
                throw new IllegalStateException("Gradle distribution ZIP SHA-256 does not match the reviewed publisher checksum.");
            }
            Path jar = wrapper.resolve("gradle-wrapper.jar");
            if (!Files.isRegularFile(jar)) throw new IllegalStateException("Gradle wrapper JAR is missing.");
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            try (InputStream input = Files.newInputStream(jar)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count);
            }
            if (!JAR_SHA256.equals(HexFormat.of().formatHex(digest.digest()))) {
                throw new IllegalStateException("Gradle wrapper JAR SHA-256 does not match the reviewed Gradle " + VERSION + " publisher checksum.");
            }
        } catch (Exception failure) {
            System.err.println("[wrapper] Refusing to execute: " + failure.getMessage());
            System.err.println("Review the version and official checksums at https://gradle.org/release-checksums/ before changing this gate.");
            System.exit(1);
        }
    }
}
