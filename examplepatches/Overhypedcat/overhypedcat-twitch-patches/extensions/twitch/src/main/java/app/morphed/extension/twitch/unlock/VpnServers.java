package app.morphed.extension.twitch.unlock;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import app.morphed.extension.twitch.vpn.WgConfig;

/** The user's WireGuard configs (VPN servers), kept in the app's private storage and tried in name order. */
public final class VpnServers {
    private final File folder;

    public VpnServers(File folder) {
        this.folder = folder;
    }

    /** A config's name as kept: the file name without folders and extension, plain characters only. */
    static String safeName(String name) {
        String base = new File(name == null ? "" : name).getName();
        if (base.toLowerCase(Locale.ROOT).endsWith(".conf")) base = base.substring(0, base.length() - 5);
        String safe = base.replaceAll("[^A-Za-z0-9._ -]", "").trim();
        return safe.isEmpty() ? "server" : safe;
    }

    /**
     * Keeps a config, in place of one of the same name. Returns the name it's kept as. Throws
     * IllegalArgumentException saying what's wrong with the config, or IOException when it can't be saved.
     */
    public synchronized String add(String name, String text) throws IOException {
        String safe = safeName(name);
        WgConfig.parse(safe, text); // refuses what isn't a usable WireGuard config
        if (!folder.isDirectory() && !folder.mkdirs()) throw new IOException("The VPN folder couldn't be made");
        try (FileOutputStream out = new FileOutputStream(new File(folder, safe + ".conf"))) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
        }
        return safe;
    }

    /** Whether a server of this name is kept already (adding one of the same name replaces it). */
    public synchronized boolean has(String name) {
        return new File(folder, safeName(name) + ".conf").isFile();
    }

    /** The first "Server N" not taken. */
    public synchronized String freeName() {
        for (int n = 1; ; n++) {
            if (!has("Server " + n)) return "Server " + n;
        }
    }

    /** A kept config's text (to put it back after a removal), or null. */
    public synchronized String text(String name) {
        File file = new File(folder, safeName(name) + ".conf");
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            int read = 0;
            while (read < bytes.length) {
                int n = in.read(bytes, read, bytes.length - read);
                if (n < 0) break;
                read += n;
            }
            return new String(bytes, 0, read, StandardCharsets.UTF_8);
        } catch (IOException e) {
            return null;
        }
    }

    public synchronized boolean remove(String name) {
        return new File(folder, safeName(name) + ".conf").delete();
    }

    public synchronized List<String> names() {
        String[] files = folder.list((dir, file) -> file.endsWith(".conf"));
        if (files == null) return new ArrayList<>();
        Arrays.sort(files);
        List<String> out = new ArrayList<>();
        for (String file : files) out.add(file.substring(0, file.length() - 5));
        return out;
    }

    /** The configs, in name order; a broken one is skipped with why in problems. */
    public synchronized List<WgConfig> configs(List<String> problems) {
        List<WgConfig> out = new ArrayList<>();
        for (String name : names()) {
            File file = new File(folder, name + ".conf");
            try (FileInputStream in = new FileInputStream(file)) {
                byte[] bytes = new byte[(int) file.length()];
                int read = 0;
                while (read < bytes.length) {
                    int n = in.read(bytes, read, bytes.length - read);
                    if (n < 0) break;
                    read += n;
                }
                out.add(WgConfig.parse(name, new String(bytes, 0, read, StandardCharsets.UTF_8)));
            } catch (IOException | IllegalArgumentException e) {
                problems.add(name + ": " + e.getMessage());
            }
        }
        return out;
    }
}
