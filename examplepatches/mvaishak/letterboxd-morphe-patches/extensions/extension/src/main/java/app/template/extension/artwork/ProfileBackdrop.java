package app.template.extension.artwork;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public final class ProfileBackdrop {
    public enum Schedule { DAILY, ON_OPEN }

    public final Schedule schedule;
    public final List<String> images;
    final long startDay;
    final int position;

    private ProfileBackdrop(Schedule schedule, List<String> images, long startDay, int position) {
        this.schedule = schedule;
        this.images = Collections.unmodifiableList(images);
        this.startDay = startDay;
        this.position = position;
    }

    static ProfileBackdrop single(String url) {
        String image = ArtworkRules.imageUrl(url);
        return image == null ? null : new ProfileBackdrop(null, Collections.singletonList(image), 0, 0);
    }

    static ProfileBackdrop rotation(Schedule schedule, List<String> urls, long startDay, int position) {
        Set<String> distinct = new LinkedHashSet<>();
        for (String url : urls) {
            String image = ArtworkRules.imageUrl(url);
            if (image != null) distinct.add(image);
        }
        if (schedule == null || distinct.size() < 2) return null;
        return new ProfileBackdrop(schedule, new ArrayList<>(distinct), startDay,
                Math.max(-1, Math.min(position, distinct.size() - 1)));
    }

    String image(long today) {
        int index = schedule == Schedule.DAILY
                ? (int) (Math.max(0, today - startDay) % images.size()) : Math.max(0, position);
        return images.get(index);
    }

    ProfileBackdrop nextVisit() {
        return schedule == Schedule.ON_OPEN
                ? new ProfileBackdrop(schedule, images, startDay, (position + 1) % images.size()) : this;
    }
}
