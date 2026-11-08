package app.polishapps.extension.orange;

@SuppressWarnings("unused")
public final class DashboardItemsPatch {

    public interface RawItemViewTypeSource {
        int polishappsRawItemViewType(int position);
    }

    private DashboardItemsPatch() {
    }

    private static boolean hideStories() {
        return false;
    }

    private static boolean hideOfferCarousel() {
        return false;
    }

    private static int invisibleLayout() {
        return 0;
    }

    private static int storiesLayout() {
        return 0;
    }

    private static int prepaidStoriesLayout() {
        return 0;
    }

    private static int ghostCollectionLayout() {
        return 0;
    }

    private static int ghostSkeletonLayout() {
        return 0;
    }

    public static int getItemViewType(Object adapter, int position) {
        RawItemViewTypeSource source = (RawItemViewTypeSource) adapter;
        int type = source.polishappsRawItemViewType(position);
        if (type == 0) {
            return type;
        }

        try {
            if (hideStories() && (type == storiesLayout() || type == prepaidStoriesLayout())) {
                return invisibleLayout();
            }

            if (hideOfferCarousel() && (type == ghostCollectionLayout() || type == ghostSkeletonLayout())) {
                return invisibleLayout();
            }
        } catch (RuntimeException ignored) {
        }

        return type;
    }
}
