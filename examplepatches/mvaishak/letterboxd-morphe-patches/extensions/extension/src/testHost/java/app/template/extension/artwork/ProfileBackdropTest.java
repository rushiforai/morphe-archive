package app.template.extension.artwork;

import java.util.Arrays;

public final class ProfileBackdropTest {
    public static void main(String[] args) {
        String a = "https://example.com/a.jpg";
        String b = "https://example.com/b.jpg";
        String c = "https://example.com/c.jpg";
        ProfileBackdrop daily = ProfileBackdrop.rotation(ProfileBackdrop.Schedule.DAILY,
                Arrays.asList(a, b, a, c), 100, 0);
        require(daily.images.equals(Arrays.asList(a, b, c)));
        require(a.equals(daily.image(100)));
        require(a.equals(daily.image(100)));
        require(b.equals(daily.image(101)));
        require(c.equals(daily.image(102)));
        require(a.equals(daily.image(103)));
        require(a.equals(daily.image(99)));
        ProfileBackdrop visit = ProfileBackdrop.rotation(ProfileBackdrop.Schedule.ON_OPEN,
                daily.images, 100, 0);
        require(a.equals(visit.image(100)));
        require(a.equals(visit.image(101)));
        require(b.equals(visit.nextVisit().image(101)));
        require(c.equals(visit.nextVisit().nextVisit().image(101)));
        require(a.equals(visit.nextVisit().nextVisit().nextVisit().image(101)));
        require(daily == daily.nextVisit());
        require(ProfileBackdrop.rotation(ProfileBackdrop.Schedule.DAILY,
                Arrays.asList(a, a, "bad"), 100, 0) == null);
        require(b.equals(ProfileBackdrop.single(b).image(101)));
        System.out.println("Profile backdrop rules passed");
    }

    private static void require(boolean condition) {
        if (!condition) throw new AssertionError();
    }
}
