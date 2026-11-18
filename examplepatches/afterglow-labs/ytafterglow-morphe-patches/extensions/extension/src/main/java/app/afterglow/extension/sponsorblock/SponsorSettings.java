package app.afterglow.extension.sponsorblock;

import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** A preference revision builds one immutable skip/marker policy, shared by ticks and drawing. */
public final class SponsorSettings {
    public static final class Snapshot {
        public final long revision;
        public final boolean enabled, shorts, markers;
        public final Set<SponsorCategory> skipCategories, markerCategories;
        private Snapshot(long revision) {
            this.revision = revision;
            enabled = AfterglowPrefs.getBool("sponsorBlockEnabled");
            shorts = AfterglowPrefs.getBool("sponsorBlockShortsEnabled");
            markers = AfterglowPrefs.getBool("sponsorBlockMarkersEnabled");
            EnumSet<SponsorCategory> skip = EnumSet.noneOf(SponsorCategory.class);
            EnumSet<SponsorCategory> visible = EnumSet.noneOf(SponsorCategory.class);
            for (SponsorCategory category : SponsorCategory.values()) {
                if (AfterglowPrefs.getBool(category.skipKey)) skip.add(category);
                if (AfterglowPrefs.getBool(category.markerKey)) visible.add(category);
            }
            skipCategories = Collections.unmodifiableSet(skip);
            markerCategories = Collections.unmodifiableSet(visible);
        }
        public boolean shouldRun(boolean isShort) {
            return InstalledTweaks.has("sponsorblock") && enabled && (!isShort || shorts);
        }
    }

    private static volatile Snapshot cached;
    private SponsorSettings() {}

    public static Snapshot current() {
        long revision = AfterglowPrefs.revision();
        Snapshot value = cached;
        if (value == null || value.revision != revision) {
            synchronized (SponsorSettings.class) {
                value = cached;
                if (value == null || value.revision != revision) cached = value = new Snapshot(revision);
            }
        }
        return value;
    }
}
