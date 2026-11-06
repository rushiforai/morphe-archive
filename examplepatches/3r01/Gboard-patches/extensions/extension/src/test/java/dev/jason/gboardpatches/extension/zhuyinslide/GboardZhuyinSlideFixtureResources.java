package dev.jason.gboardpatches.extension.zhuyinslide;

import android.content.res.Resources;

import java.util.HashMap;
import java.util.Map;

public final class GboardZhuyinSlideFixtureResources extends Resources {
    private static final GboardZhuyinSlideFixtureResources INSTANCE =
            new GboardZhuyinSlideFixtureResources();
    private static final Map<Integer, String> ENTRY_NAMES = new HashMap<Integer, String>();

    private GboardZhuyinSlideFixtureResources() {
        super(Resources.getSystem().getAssets(),
                Resources.getSystem().getDisplayMetrics(),
                Resources.getSystem().getConfiguration());
    }

    public static Resources instance() {
        return INSTANCE;
    }

    public static void register(int resourceId, String resourceEntryName) {
        ENTRY_NAMES.put(Integer.valueOf(resourceId), resourceEntryName);
    }

    public static void clear() {
        ENTRY_NAMES.clear();
    }

    @Override
    public String getResourceEntryName(int resourceId) throws NotFoundException {
        String name = ENTRY_NAMES.get(Integer.valueOf(resourceId));
        if (name == null) {
            throw new NotFoundException("Unknown fixture resource id " + resourceId);
        }
        return name;
    }
}
