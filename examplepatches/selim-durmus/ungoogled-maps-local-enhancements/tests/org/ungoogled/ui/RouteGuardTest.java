package org.ungoogled.ui;
public final class RouteGuardTest {
    public static void main(String[] args) {
        HomeWorkShortcuts.RouteSession route = new HomeWorkShortcuts.RouteSession(1, 51.04540024, -114.05570026, 0);
        Object[][] cases = {
            {"51.045400,-114.055700", true}, {" 51.0454002, -114.0557003 ", true},
            {"51.0454,-114.0557", true}, {"51.045401,-114.055700", false},
            {"51.0454,114.0557", false}, {"Home", false}, {"Coffee", false},
            {"51.0454,-114.0557 cafes", false}, {"", false}, {null, false},
            {"geo:51.0454,-114.0557", false}, {"NaN,NaN", false}
        };
        for (Object[] item : cases)
            if (route.matches((String) item[0]) != (Boolean) item[1]) throw new AssertionError(item[0]);
        System.out.println("Passed " + cases.length + " exact-destination ownership checks.");
    }
}
