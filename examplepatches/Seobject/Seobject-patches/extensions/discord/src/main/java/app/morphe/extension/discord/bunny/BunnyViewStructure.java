package app.morphe.extension.discord.bunny;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Structural React Native view ownership predicates.
 *
 * These intentionally describe layout roles instead of Discord implementation
 * class names, obfuscated symbols, or stock colors.
 */
final class BunnyViewStructure {
    private BunnyViewStructure() {
    }

    static boolean isDmListSurfaceOwner(
            View view
    ) {
        try {
            if (
                    !(view instanceof ViewGroup)
            ) {
                return false;
            }

            View root =
                    view.getRootView();

            if (
                    root == null
                            || root == view
            ) {
                return false;
            }

            int rootWidth =
                    root.getWidth();

            int rootHeight =
                    root.getHeight();

            int width =
                    view.getWidth();

            int height =
                    view.getHeight();

            if (
                    rootWidth <= 0
                            || rootHeight <= 0
                            || width <= 0
                            || height <= 0
            ) {
                return false;
            }

            /*
             * Structural DM-list contract:
             *
             * - substantial pane
             * - strictly narrower than the root
             * - tall
             * - right aligned
             * - wrapped by a pane-sized ViewGroup
             * - ultimately hosted by a root-sized screen container
             *
             * No Discord, RN-screen, obfuscated-class, or color identity.
             */
            if (
                    (long) width * 100L
                            < (long) rootWidth * 50L
                            || width >= rootWidth
            ) {
                return false;
            }

            if (
                    (long) height * 4L
                            < (long) rootHeight * 3L
            ) {
                return false;
            }

            int[] rootPosition =
                    new int[2];

            int[] viewPosition =
                    new int[2];

            root.getLocationOnScreen(
                    rootPosition
            );

            view.getLocationOnScreen(
                    viewPosition
            );

            int relativeX =
                    viewPosition[0]
                            - rootPosition[0];

            if (relativeX <= 0) {
                return false;
            }

            int rightGap =
                    rootWidth
                            - (
                            relativeX
                                    + width
                    );

            int rightTolerance =
                    Math.max(
                            12,
                            rootWidth / 20
                    );

            if (
                    Math.abs(
                            rightGap
                    ) > rightTolerance
            ) {
                return false;
            }

            ViewParent parentObject =
                    view.getParent();

            if (
                    !(parentObject instanceof ViewGroup)
                            || !(parentObject instanceof View)
            ) {
                return false;
            }

            View parent =
                    (View) parentObject;

            if (
                    !approximatelySameBounds(
                            view,
                            parent
                    )
            ) {
                return false;
            }

            /*
             * The old implementation identified a screen-container ancestor
             * by concrete class. Represent that role structurally instead:
             * there must be a root-sized host above the pane wrapper.
             *
             * Critically, "any larger ancestor" is not sufficient.
             */
            ViewParent ancestor =
                    parent.getParent();

            for (
                    int depth = 0;
                    ancestor != null
                            && depth < 8;
                    depth++
            ) {
                if (
                        !(ancestor instanceof View)
                ) {
                    break;
                }

                View ancestorView =
                        (View) ancestor;

                int ancestorWidth =
                        ancestorView.getWidth();

                int ancestorHeight =
                        ancestorView.getHeight();

                if (
                        ancestorWidth > 0
                                && ancestorHeight > 0
                                && (long) ancestorWidth * 100L
                                >= (long) rootWidth * 96L
                                && (long) ancestorHeight * 100L
                                >= (long) rootHeight * 90L
                ) {
                    int[] ancestorPosition =
                            new int[2];

                    ancestorView.getLocationOnScreen(
                            ancestorPosition
                    );

                    int horizontalTolerance =
                            Math.max(
                                    12,
                                    rootWidth / 40
                            );

                    int verticalTolerance =
                            Math.max(
                                    16,
                                    rootHeight / 40
                            );

                    if (
                            Math.abs(
                                    ancestorPosition[0]
                                            - rootPosition[0]
                            ) <= horizontalTolerance
                                    && Math.abs(
                                    ancestorPosition[1]
                                            - rootPosition[1]
                            ) <= verticalTolerance
                    ) {
                        return true;
                    }
                }

                ancestor =
                        ancestorView.getParent();
            }

            return false;

        } catch (
                Throwable ignored
        ) {
            return false;
        }
    }
    static boolean isServerDrawerBackgroundOwner(
            View view
    ) {
        try {
            if (
                    !(view instanceof ViewGroup)
            ) {
                return false;
            }

            View root =
                    view.getRootView();

            if (
                    root == null
                            || root == view
            ) {
                return false;
            }

            int rootWidth =
                    root.getWidth();

            int rootHeight =
                    root.getHeight();

            if (
                    rootWidth <= 0
                            || rootHeight <= 0
            ) {
                return false;
            }

            /*
             * Proven drawer background role:
             * exact root-sized layer, not merely a nearly-fullscreen view.
             */
            if (
                    view.getWidth() != rootWidth
                            || view.getHeight() != rootHeight
            ) {
                return false;
            }

            int[] rootPosition =
                    new int[2];

            int[] viewPosition =
                    new int[2];

            root.getLocationOnScreen(
                    rootPosition
            );

            view.getLocationOnScreen(
                    viewPosition
            );

            /*
             * Preserve the proven origin relationship relative to the
             * current root instead of hardcoding physical screen (0,0).
             */
            if (
                    viewPosition[0] != rootPosition[0]
                            || viewPosition[1] != rootPosition[1]
            ) {
                return false;
            }

            ViewParent parentObject =
                    view.getParent();

            if (
                    !(parentObject instanceof ViewGroup)
                            || !(parentObject instanceof View)
            ) {
                return false;
            }

            ViewGroup parentGroup =
                    (ViewGroup) parentObject;

            View parent =
                    (View) parentObject;

            /*
             * The proven direct wrapper also fills the exact root.
             */
            if (
                    parent.getWidth() != rootWidth
                            || parent.getHeight() != rootHeight
            ) {
                return false;
            }

            int[] parentPosition =
                    new int[2];

            parent.getLocationOnScreen(
                    parentPosition
            );

            if (
                    parentPosition[0] != rootPosition[0]
                            || parentPosition[1] != rootPosition[1]
            ) {
                return false;
            }

            /*
             * The background is layer zero of that wrapper.
             */
            if (
                    parentGroup.indexOfChild(
                            view
                    ) != 0
            ) {
                return false;
            }

            /*
             * Known-good also required a distinct screen host above the
             * wrapper. Model that role structurally rather than naming
             * Discord's ScreenOverride class.
             */
            ViewParent screenHostObject =
                    parentObject.getParent();

            if (
                    !(screenHostObject instanceof View)
            ) {
                return false;
            }

            View screenHost =
                    (View) screenHostObject;

            if (
                    screenHost == root
                            || screenHost == parent
                            || screenHost == view
                            || screenHost.getRootView() != root
            ) {
                return false;
            }

            return true;

        } catch (
                Throwable ignored
        ) {
            return false;
        }
    }
    private static boolean approximatelySameBounds(
            View first,
            View second
    ) {
        if (
                first == null
                        || second == null
        ) {
            return false;
        }

        int widthTolerance =
                Math.max(
                        18,
                        first.getWidth() / 18
                );

        int heightTolerance =
                Math.max(
                        24,
                        first.getHeight() / 24
                );

        if (
                Math.abs(
                        first.getWidth()
                                - second.getWidth()
                )
                        > widthTolerance
                || Math.abs(
                first.getHeight()
                        - second.getHeight()
        )
                        > heightTolerance
        ) {
            return false;
        }

        int[] firstPosition =
                new int[2];

        int[] secondPosition =
                new int[2];

        first.getLocationOnScreen(
                firstPosition
        );

        second.getLocationOnScreen(
                secondPosition
        );

        return (
                Math.abs(
                        firstPosition[0]
                                - secondPosition[0]
                )
                        <= widthTolerance
                        && Math.abs(
                        firstPosition[1]
                                - secondPosition[1]
                )
                        <= heightTolerance
        );
    }
}
