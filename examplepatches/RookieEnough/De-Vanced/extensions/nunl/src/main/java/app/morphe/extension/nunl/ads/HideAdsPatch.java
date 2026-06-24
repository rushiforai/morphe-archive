/*
 * Forked from:
 * https://gitlab.com/ReVanced/ravanced-patches/-/raw/main/extensions/nunl/src/main/java/app/revanced/extension/nunl/ads/HideAdsPatch.java
 */
package app.morphe.extension.nunl.ads;

import app.morphe.extension.shared.Logger;

import java.util.ArrayList;
import java.util.List;

import nl.nu.performance.api.client.interfaces.Block;
import nl.nu.performance.api.client.objects.DpgBannerBlock;
import nl.nu.performance.api.client.objects.DividerBlock;
import nl.nu.performance.api.client.objects.HeaderBlock;
import nl.nu.performance.api.client.objects.Link;
import nl.nu.performance.api.client.objects.LinkBlock;
import nl.nu.performance.api.client.objects.StyledText;
import nl.nu.performance.api.client.unions.SmallArticleLinkFlavor;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public class HideAdsPatch {
    private static final String[] blockedHeaderBlocks = {
            "Aanbiedingen (Adverteerders)",
            "Aangeboden door NUshop"
    };

    private static final String[] blockedLinkBlocks = {
            "Van onze adverteerders"
    };

    public static void filterAds(List blocks) {
        try {
            ArrayList cleanedList = new ArrayList<>();

            boolean skipFullHeader = false;
            boolean skipUntilDivider = false;

            int index = 0;
            while (index < blocks.size()) {
                Block currentBlock = (Block) blocks.get(index);

                if (currentBlock instanceof DpgBannerBlock) {
                    index++;
                    continue;
                }

                if (index + 1 < blocks.size()) {
                    if (currentBlock instanceof DividerBlock
                            && blocks.get(index + 1) instanceof DpgBannerBlock) {
                        index += 2;
                        continue;
                    }

                    if (currentBlock instanceof DividerBlock
                            && blocks.get(index + 1) instanceof LinkBlock) {
                        LinkBlock linkBlock = (LinkBlock) blocks.get(index + 1);
                        Link link = linkBlock.getLink();
                        if (link != null && link.getTitle() != null) {
                            for (String blockedLinkBlock : blockedLinkBlocks) {
                                if (blockedLinkBlock.equals(link.getTitle().getText())) {
                                    skipUntilDivider = true;
                                    break;
                                }
                            }
                            if (skipUntilDivider) {
                                index++;
                                continue;
                            }
                        }
                    }
                }

                if (currentBlock instanceof LinkBlock) {
                    LinkBlock linkBlock = (LinkBlock) currentBlock;
                    if (linkBlock.getLink() != null
                            && linkBlock.getLink().getLinkFlavor() instanceof SmallArticleLinkFlavor) {
                        SmallArticleLinkFlavor flavor = (SmallArticleLinkFlavor) linkBlock.getLink().getLinkFlavor();
                        if (flavor.isPartner() != null && flavor.isPartner()) {
                            index++;
                            continue;
                        }
                    }
                }

                if (currentBlock instanceof DividerBlock) {
                    skipUntilDivider = false;
                }

                if (currentBlock instanceof HeaderBlock) {
                    HeaderBlock headerBlock = (HeaderBlock) currentBlock;
                    StyledText headerText = headerBlock.getTitle();
                    if (headerText != null) {
                        skipFullHeader = false;
                        for (String blockedHeaderBlock : blockedHeaderBlocks) {
                            if (blockedHeaderBlock.equals(headerText.getText())) {
                                skipFullHeader = true;
                                break;
                            }
                        }
                        if (skipFullHeader) {
                            index++;
                            continue;
                        }
                    }
                }

                if (!skipFullHeader && !skipUntilDivider) {
                    cleanedList.add(currentBlock);
                }
                index++;
            }

            blocks.clear();
            blocks.addAll(cleanedList);
        } catch (Throwable ex) {
            Logger.printException(() -> "NU.nl filterAds failure", ex);
        }
    }
}

