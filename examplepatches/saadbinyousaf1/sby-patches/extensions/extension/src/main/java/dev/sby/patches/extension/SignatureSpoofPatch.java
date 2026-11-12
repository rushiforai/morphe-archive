// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.extension;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.util.Base64;

// © https://saadbinyousaf.dev/ © //
public final class SignatureSpoofPatch {

    private static final String PACKAGE_NAME = "com.global.foodpanda.android";

    private static final String ORIGINAL_CERT =
            "MIIDiTCCAnGgAwIBAgIEeUEmOzANBgkqhkiG9w0BAQsFADB1MQswCQYDVQQGEwJQVDEOMAwGA1UECBMFUG9ydG8xDjAMBgNVBAcTBVBvcnRvMRgwFgYDVQQKEw9Sb2NrZXQgSW50ZXJuZXQxEjAQBgNVBAsTCVNpbHZlck9hazEYMBYGA1UEAxMPUmljYXJkbyBEb3VyYWRvMB4XDTEyMTExNTExMzQzN1oXDTQwMDQwMjExMzQzN1owdTELMAkGA1UEBhMCUFQxDjAMBgNVBAgTBVBvcnRvMQ4wDAYDVQQHEwVQb3J0bzEYMBYGA1UEChMPUm9ja2V0IEludGVybmV0MRIwEAYDVQQLEwlTaWx2ZXJPYWsxGDAWBgNVBAMTD1JpY2FyZG8gRG91cmFkbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAILaeEIizKVINblEIZoH+zbrAnyUWnLSSbAKoWcPuJFUxGLJ2pOYNkEJNADHaI+En2de1+jlI+wdQzHjo4toZPOr7TptZTwru3K7r0G3VQKAi+Rmuzgqy9iDbw63icRwBetzJzA5j1bRvYil1HQCYLakDE5+o2Im5kUo9er/6FZ4z1ncp4PIIqk7o2h5I4ms+ppKWaIFik53HQ//bSYwnsCP3NMUZTUOm6BZ7Wq8f/Ft/YjSZcmSSQ08m9E6+VxI+wsgJ/BgaG5un1vKOsxAxyetUroWRfHGHFV+pbW6+Hx0V6ady4JFL+z13H5wyfdHa0xZplwrwSHCJsKRaCYznh0CAwEAAaMhMB8wHQYDVR0OBBYEFLEQmRAreaf0Gkz8LW/0q4fwnNgBMA0GCSqGSIb3DQEBCwUAA4IBAQBq8oadYiDWqrOX9v5TfYir9MVDf/DrN+Zyss5zh75GNcfVzdljzAyVhaM538tua1KGyoV6dfWGep//k5Z/bARWcTcuSoE/VIGWG7VJ04rdxcc67bl6N9U1VqhEu0SUMOjd2ELyEdVWlHnp5lXdxkY5uRXAgEav71jK8k5s4UtOWLIVadi65enfASj61NvGVf3ZKeQTSA1OSkYwcfmzg6hHwkVDI2a0domfy9MTD8Q3AeeB7D3xJuMG+TR1Qi0lOgGurMUxpZVgaJn0sr/27zx4Xw3+1JfDJrmdcVL0039Selt3Q5hwN4MFd5BC9VK4044lVbVbbtYVfmg/sqh+eArD";

    private static volatile Signature originalSignature;

    // © https://saadbinyousaf.dev/ © //
    private static Signature original() {
        if (originalSignature == null) {
            originalSignature = new Signature(Base64.decode(ORIGINAL_CERT, Base64.DEFAULT));
        }
        return originalSignature;
    }

    // © https://saadbinyousaf.dev/ © //
    public static PackageInfo getPackageInfo(PackageManager manager, String packageName, int flags)
            throws PackageManager.NameNotFoundException {
        PackageInfo info = manager.getPackageInfo(packageName, flags);
        if (PACKAGE_NAME.equals(packageName) && info != null && info.signatures != null
                && info.signatures.length > 0) {
            info.signatures[0] = original();
        }
        return info;
    }
}
// © https://saadbinyousaf.dev/ © //
