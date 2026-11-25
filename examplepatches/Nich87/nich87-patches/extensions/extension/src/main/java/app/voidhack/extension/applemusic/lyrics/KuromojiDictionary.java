package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.util.Log;

import com.atilika.kuromoji.dict.CharacterDefinitions;
import com.atilika.kuromoji.dict.ConnectionCosts;
import com.atilika.kuromoji.dict.InsertedDictionary;
import com.atilika.kuromoji.dict.TokenInfoDictionary;
import com.atilika.kuromoji.dict.UnknownDictionary;
import com.atilika.kuromoji.ipadic.Tokenizer;
import com.atilika.kuromoji.trie.DoubleArrayTrie;
import com.atilika.kuromoji.util.ResourceResolver;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UncheckedIOException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.net.ssl.HttpsURLConnection;

final class KuromojiDictionary {
    private static final String TAG = "AppleMusicLrclib";
    private static final String ARCHIVE_URL = "https://repo.maven.apache.org/maven2/com/atilika/kuromoji/"
            + "kuromoji-ipadic/0.9.0/kuromoji-ipadic-0.9.0.jar";
    private static final int ARCHIVE_BYTES = 13_343_016;
    private static final String ARCHIVE_SHA256 = "24909fd751c0b439f7af5131b080eb65bc85062f0c4977ca4a71c76abe74e0b6";
    private static final String ENTRY_PREFIX = "com/atilika/kuromoji/ipadic/";
    private static final Object CACHE_LOCK = new Object();

    private static volatile Tokenizer tokenizer;

    private KuromojiDictionary() {}

    static boolean isInstalled(Context context) {
        return tokenizer != null || archive(context).length() == ARCHIVE_BYTES;
    }

    static Tokenizer get(Context context) {
        Tokenizer current = tokenizer;
        if (current != null || context == null) return current;
        File cached = archive(context);
        if (!cached.isFile()) return null;

        synchronized (CACHE_LOCK) {
            if (tokenizer != null || !cached.isFile()) return tokenizer;
            try {
                try (InputStream input = new FileInputStream(cached)) {
                    verifyArchive(input, null);
                }
                tokenizer = load(cached);
            } catch (IOException e) {
                Log.w(TAG, "Could not load the cached Japanese lyric dictionary", e);
                removeFile(cached);
            }
            return tokenizer;
        }
    }

    static synchronized void install(Context context) throws IOException {
        if (get(context) != null) return;
        File installed = archive(context);
        File temporary = File.createTempFile("voidhack-ipadic-", ".download", installed.getParentFile());
        try {
            download(temporary);
            Tokenizer downloaded = load(temporary);
            synchronized (CACHE_LOCK) {
                if (!temporary.renameTo(installed)) {
                    throw new IOException("Could not install the Japanese lyric dictionary");
                }
                tokenizer = downloaded;
            }
        } finally {
            removeFile(temporary);
        }
    }

    private static File archive(Context context) {
        return new File(context.getNoBackupFilesDir(), "voidhack-ipadic-0.9.0.zip");
    }

    private static void download(File destination) throws IOException {
        HttpsURLConnection connection = (HttpsURLConnection) new URL(ARCHIVE_URL).openConnection();
        connection.setConnectTimeout(15_000);
        connection.setReadTimeout(30_000);
        connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("Accept-Encoding", "identity");
        try {
            int status = connection.getResponseCode();
            if (status != HttpsURLConnection.HTTP_OK) {
                throw new IOException("Japanese lyric dictionary download failed with HTTP " + status);
            }
            try (InputStream input = connection.getInputStream();
                 FileOutputStream output = new FileOutputStream(destination)) {
                verifyArchive(input, output);
                output.getFD().sync();
            }
        } finally {
            connection.disconnect();
        }
    }

    private static void verifyArchive(InputStream input, FileOutputStream copy) throws IOException {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new IOException("SHA-256 is unavailable", e);
        }
        byte[] buffer = new byte[64 * 1024];
        int bytes = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            bytes += count;
            if (bytes > ARCHIVE_BYTES) throw new IOException("Japanese lyric dictionary is larger than expected");
            digest.update(buffer, 0, count);
            if (copy != null) copy.write(buffer, 0, count);
        }
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest.digest()) {
            hex.append(Character.forDigit((value & 0xff) >>> 4, 16));
            hex.append(Character.forDigit(value & 0x0f, 16));
        }
        if (bytes != ARCHIVE_BYTES || !ARCHIVE_SHA256.contentEquals(hex)) {
            throw new IOException("Japanese lyric dictionary failed size or SHA-256 verification");
        }
    }

    private static Tokenizer load(File archive) throws IOException {
        try (ZipFile zip = new ZipFile(archive)) {
            ExternalBuilder builder = new ExternalBuilder(name -> {
                ZipEntry entry = name.endsWith(".bin") ? zip.getEntry(ENTRY_PREFIX + name) : null;
                if (entry == null) throw new IOException("Missing Japanese dictionary entry: " + name);
                return zip.getInputStream(entry);
            });
            return builder.build();
        } catch (RuntimeException e) {
            throw new IOException("Could not initialize the Japanese lyric dictionary", e);
        }
    }

    private static void removeFile(File file) {
        if (file.exists() && !file.delete()) Log.w(TAG, "Could not remove unused Japanese dictionary data");
    }

    @SuppressWarnings("unchecked")
    private static final class ExternalBuilder extends Tokenizer.Builder {
        ExternalBuilder(ResourceResolver resourceResolver) {
            resolver = resourceResolver;
        }

        @Override
        protected void loadDictionaries() {
            // Match IPADIC 0.9.0's default builder with a resolver backed by the downloaded archive.
            penalties = Arrays.asList(2, 3000, 7, 1700);
            try {
                doubleArrayTrie = DoubleArrayTrie.newInstance(resolver);
                connectionCosts = ConnectionCosts.newInstance(resolver);
                tokenInfoDictionary = TokenInfoDictionary.newInstance(resolver);
                characterDefinitions = CharacterDefinitions.newInstance(resolver);
                unknownDictionary = UnknownDictionary.newInstance(resolver, characterDefinitions, totalFeatures);
                insertedDictionary = new InsertedDictionary(totalFeatures);
            } catch (IOException e) {
                throw new UncheckedIOException(e);
            }
        }
    }
}
