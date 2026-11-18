package io.github.henr1klmb.patches.shared;

public class AutoModHelper {

    public static boolean isAutoMod(String author) {
        if (author == null) {
            return false;
        }
        String name = author.trim();
        if (name.startsWith("u/") || name.startsWith("U/")) {
            name = name.substring(2);
        }
        return name.equalsIgnoreCase("AutoModerator");
    }

    public static boolean shouldCollapse(String author, boolean currentCollapsed) {
        if (currentCollapsed) {
            return true;
        }
        return isAutoMod(author);
    }
}
