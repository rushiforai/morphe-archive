package dev.jason.gboardpatches.extension.webclipboard;

import java.io.ByteArrayInputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.security.KeyStore;

import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;

final class ClipboardSyncHttpsSocketFactory {
    private static final char[] KEYSTORE_PASSWORD = "changeit".toCharArray();
    private static volatile SSLContext cachedSslContext;

    private ClipboardSyncHttpsSocketFactory() {
    }

    static int defaultHttpsPortFor(int httpPort) {
        if (httpPort <= 0) {
            return 0;
        }
        return httpPort < 65535 ? httpPort + 1 : httpPort - 1;
    }

    static ServerSocket createServerSocket(int port) throws Exception {
        SSLServerSocket socket = (SSLServerSocket) sslContext()
                .getServerSocketFactory()
                .createServerSocket();
        socket.setReuseAddress(true);
        socket.bind(new InetSocketAddress(port));
        return socket;
    }

    private static SSLContext sslContext() throws Exception {
        SSLContext current = cachedSslContext;
        if (current != null) {
            return current;
        }

        synchronized (ClipboardSyncHttpsSocketFactory.class) {
            current = cachedSslContext;
            if (current != null) {
                return current;
            }

            KeyStore keyStore = KeyStore.getInstance("PKCS12");
            try (ByteArrayInputStream input = new ByteArrayInputStream(decodeKeystore())) {
                keyStore.load(input, KEYSTORE_PASSWORD);
            }

            KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(
                    KeyManagerFactory.getDefaultAlgorithm());
            keyManagerFactory.init(keyStore, KEYSTORE_PASSWORD);

            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(keyManagerFactory.getKeyManagers(), null, null);
            cachedSslContext = sslContext;
            return sslContext;
        }
    }

    private static byte[] decodeKeystore() throws Exception {
        String payload = SELF_SIGNED_PKCS12_KEYSTORE.replaceAll("\\s+", "");
        try {
            return android.util.Base64.decode(payload, android.util.Base64.DEFAULT);
        } catch (Throwable ignored) {
            return decodeWithJavaBase64(payload);
        }
    }

    private static byte[] decodeWithJavaBase64(String payload) throws Exception {
        Class<?> base64Class = Class.forName("java.util.Base64");
        Object decoder = base64Class.getMethod("getDecoder").invoke(null);
        return (byte[]) decoder.getClass()
                .getMethod("decode", String.class)
                .invoke(decoder, payload);
    }

    private static final String SELF_SIGNED_PKCS12_KEYSTORE = """
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
hyD8OH+AG7WcOgICJxA=
""";
}

