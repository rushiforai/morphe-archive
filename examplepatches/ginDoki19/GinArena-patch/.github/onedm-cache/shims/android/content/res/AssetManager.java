package android.content.res;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class AssetManager {
    private final File assetsRoot;

    public AssetManager(File assetsRoot) {
        this.assetsRoot = assetsRoot;
    }

    public InputStream open(String fileName) throws IOException {
        if (assetsRoot != null) {
            File f = new File(assetsRoot, fileName);
            if (f.isFile()) {
                return new FileInputStream(f);
            }
        }
        InputStream cl = AssetManager.class.getClassLoader().getResourceAsStream("assets/" + fileName);
        if (cl != null) {
            return cl;
        }
        throw new FileNotFoundException("Asset not found: " + fileName);
    }

    public InputStream open(String fileName, int accessMode) throws IOException {
        return open(fileName);
    }
}
