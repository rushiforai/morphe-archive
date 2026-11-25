/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24
 * Written by lavinhoque33, 2026-11-23
 */

package app.morphe.extension.youtube.patches.feed;

import android.net.Uri;

import androidx.annotation.Nullable;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;

import app.morphe.extension.shared.utils.ByteTrieSearch;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.AttributedText;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.BrowseEndpoint;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.DecoratedAvatarViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.InnertubeCommandHolder;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupMetadata;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.MetadataPart;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.MetadataRow;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.TextRunRange;
import app.morphe.extension.youtube.patches.utils.ReturnYouTubeChannelNamePatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.RootView;

/** Changes only the visible author run of a Home video, before Litho creates its styled/clickable text. */
@SuppressWarnings("unused")
public final class HomeFeedChannelNamesPatch {
    private static final String HOME = "FEwhat_to_watch";
    private static final String CLASSIC = "video_lockup_with_attachment.eml";
    private static final String CARD = "lockup.eml";
    private static final String WATCH_URL = "https://www.youtube.com/watch?v=";
    private static final Pattern ATTRIBUTION_TEMPLATE = Pattern.compile(
            "(?:video_lockup_with_attachment|lockup)\\.eml(?:-\\w+)?\\|[0-9a-f]+\\|?");
    private static final Pattern CHANNEL_ID = Pattern.compile("UC[A-Za-z0-9_-]{22}");
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final ByteTrieSearch TEMPLATE_SEARCH = new ByteTrieSearch(
            ByteTrieSearch.convertStringsToBytes(CLASSIC, CARD));
    private static final ByteTrieSearch HANDLE_SEARCH = new ByteTrieSearch(
            ByteTrieSearch.convertStringsToBytes("/@"));

    @Nullable
    private static volatile BrowsePane activeBrowsePane;

    private static final class BrowsePane extends WeakReference<Object> {
        private volatile boolean home;

        private BrowsePane(Object fragment, @Nullable String id) {
            super(fragment);
            home = HOME.equals(id);
        }
    }

    private enum Decision {
        DISABLED,
        NOT_HOME,
        COVERED,
        NO_MATCHING_NAME,
        REWRITTEN
    }

    /** At most one line per outcome and parser path between native pane callbacks. */
    private static final class DebugDecisions {
        private static final AtomicInteger seen = new AtomicInteger();

        private static void record(boolean converting, Decision decision) {
            int bit = 1 << (decision.ordinal() + (converting ? 8 : 0));
            int previous;
            do {
                previous = seen.get();
                if ((previous & bit) != 0) {
                    return;
                }
            } while (!seen.compareAndSet(previous, previous | bit));

            Logger.printDebug(() -> "Home attribution " + (converting ? "Classic conversion" : "element")
                    + ": " + decision);
        }
    }

    private HomeFeedChannelNamesPatch() {
    }

    /** Injection point: the main-pane transaction or its view creation, before the first render. */
    public static void setActiveBrowsePane(@Nullable Object pane, @Nullable String id, boolean creatingView) {
        activeBrowsePane = pane == null ? null : new BrowsePane(pane, id);
        if (Settings.DEBUG.get()) {
            DebugDecisions.seen.set(0);
            Logger.printDebug(() -> "Home attribution pane " + (creatingView ? "create view: " : "replace: ")
                    + (pane == null ? "non-browse" : pageKind(id)));
        }
    }

    /** Injection point: the browse fragment loaded or changed its endpoint. */
    public static void updateBrowsePaneId(Object pane, @Nullable String id) {
        BrowsePane selected = activeBrowsePane;
        boolean active = selected != null && selected.get() == pane;
        if (active) {
            selected.home = HOME.equals(id);
        }

        if (Settings.DEBUG.get()) {
            if (active) {
                DebugDecisions.seen.set(0);
            }
            Logger.printDebug(() -> "Home attribution endpoint " + (active ? "active: " : "inactive: ")
                    + pageKind(id));
        }
    }

    private static String pageKind(@Nullable String id) {
        return HOME.equals(id) ? "Home" : id == null || id.isEmpty() ? "unknown browse" : "other browse";
    }

    /** Injection point: before the native newElement protobuf parser. */
    public static byte[] onElementLoaded(byte[] bytes) {
        if (!shouldRewriteHomeAttribution(false)) {
            return bytes;
        }

        return rewrite(bytes);
    }

    static LockupMetadata metadataForClassicLayout(LockupViewModel video) {
        LockupMetadata original = video.getMetadata();
        if (!shouldRewriteHomeAttribution(true)) {
            return original;
        }

        // Use the source content ID and author runs before Classic replaces the model and joins the rows.
        try {
            LockupMetadata replacement = rewriteModernMetadata(video);
            if (video.getContentType() == 1) {
                logRewriteDecision(true, replacement != null);
            }
            return replacement == null ? original : replacement;
        } catch (InvalidProtocolBufferException ex) {
            Logger.printDebug(() -> "Could not parse Home video attribution");
            return original;
        }
    }

    private static boolean shouldRewriteHomeAttribution(boolean converting) {
        if (!Settings.HOME_FEED_CHANNEL_NAMES.get()) {
            logDecision(converting, Decision.DISABLED);
            return false;
        }

        BrowsePane selected = activeBrowsePane;
        if (selected == null || !selected.home || selected.get() == null) {
            logDecision(converting, Decision.NOT_HOME);
            return false;
        }

        // The last constructed SearchEndpoint can outlive Search. Use the actual pane and visible covers.
        if (RootView.isPlayerActive() || RootView.isShortsActive() || NavigationBar.isSearchBarActive()) {
            logDecision(converting, Decision.COVERED);
            return false;
        }

        return true;
    }

    private static void logRewriteDecision(boolean converting, boolean changed) {
        logDecision(converting, changed ? Decision.REWRITTEN : Decision.NO_MATCHING_NAME);
    }

    private static void logDecision(boolean converting, Decision outcome) {
        if (Settings.DEBUG.get()) {
            DebugDecisions.record(converting, outcome);
        }
    }

    static byte[] rewrite(byte[] bytes) {
        if (bytes == null || !TEMPLATE_SEARCH.matches(bytes) || !HANDLE_SEARCH.matches(bytes)) {
            return bytes;
        }

        try {
            Element element = Element.parseFrom(bytes);
            ComponentType component = element.getType().getComponentType();
            String template = component.getTemplateConfig().getUriTemplateConfig().getUri();
            if (!ATTRIBUTION_TEMPLATE.matcher(template).matches()) {
                return bytes;
            }

            ElementModel replacement = rewriteModel(template, component.getModel());
            logRewriteDecision(false, replacement != null);
            return replacement == null ? bytes : element.toBuilder()
                    .setType(element.getType().toBuilder()
                            .setComponentType(component.toBuilder().setModel(replacement)))
                    .build().toByteArray();
        } catch (InvalidProtocolBufferException ex) {
            Logger.printDebug(() -> "Could not parse Home video attribution");
            return bytes;
        }
    }

    @Nullable
    private static ElementModel rewriteModel(String template, ElementModel model)
            throws InvalidProtocolBufferException {
        if (template.startsWith(CLASSIC) && model.hasVideoWithContextModel()) {
            var classic = model.getVideoWithContextModel();
            var data = classic.getData();
            var video = data.getVideoData();
            if (!isClassicVideo(video.getUrl(), data.getOnTap()) || video.hasAvatarStack()
                    || video.getThumbnail().getIsPlaylist() || video.getThumbnail().getIsMix()) {
                return null;
            }

            Channel channel;
            if (video.hasAvatar()) {
                var avatar = video.getAvatar();
                channel = new Channel(browseEndpoint(avatar.getEndpoint()), avatar.getAccessibilityText());
            } else {
                channel = channel(video.getDecoratedAvatar().getDecoratedAvatarViewModel());
            }

            LockupMetadata metadata = rewriteMetadata(video.getLockupMetadata(), channel, video.getChannelId());
            return metadata == null ? null : model.toBuilder().setVideoWithContextModel(classic.toBuilder()
                    .setData(data.toBuilder().setVideoData(video.toBuilder().setLockupMetadata(metadata)))).build();
        }

        if (template.startsWith(CARD) && model.hasLockupModel()) {
            var modern = model.getLockupModel();
            var wrapper = modern.getViewModel();
            var video = wrapper.getLockupViewModel();
            LockupMetadata metadata = rewriteModernMetadata(video);
            return metadata == null ? null : model.toBuilder().setLockupModel(modern.toBuilder()
                    .setViewModel(wrapper.toBuilder().setLockupViewModel(video.toBuilder().setMetadata(metadata))))
                    .build();
        }
        return null;
    }

    @Nullable
    private static LockupMetadata rewriteModernMetadata(LockupViewModel video)
            throws InvalidProtocolBufferException {
        if (video.getContentType() != 1 || !VIDEO_ID.matcher(video.getContentId()).matches()) {
            return null;
        }

        LockupMetadata metadata = video.getMetadata();
        var avatar = metadata.getLockupMetadataViewModel().getImage().getDecoratedAvatarViewModel();
        return rewriteMetadata(metadata, channel(avatar), "");
    }

    private static boolean isClassicVideo(String url, ByteString onTap) throws InvalidProtocolBufferException {
        // Regular cards can wrap WatchEndpoint inside a command executor (e.g. autoplay).
        // The stock drag-and-drop URL identifies those without changing or unwrapping the command.
        if (url.startsWith(WATCH_URL) && VIDEO_ID.matcher(url.substring(WATCH_URL.length())).matches()) {
            return true;
        }

        var command = InnertubeCommandHolder.parseFrom(onTap).getInnertubeCommand();
        return VIDEO_ID.matcher(command.getWatchEndpoint().getVideoId()).matches();
    }

    private record Channel(BrowseEndpoint endpoint, String avatarLabel) {
    }

    private static Channel channel(DecoratedAvatarViewModel avatar) throws InvalidProtocolBufferException {
        ByteString command = avatar.getRendererContext().getCommandContext().getOnTap();
        return new Channel(browseEndpoint(command), avatar.getA11YLabel());
    }

    private static BrowseEndpoint browseEndpoint(ByteString command) throws InvalidProtocolBufferException {
        return InnertubeCommandHolder.parseFrom(command).getInnertubeCommand().getBrowseEndpoint();
    }

    @Nullable
    private static LockupMetadata rewriteMetadata(LockupMetadata metadata, Channel channel, String knownChannelId) {
        String channelId = channel.endpoint.getBrowseId();
        String canonical = channel.endpoint.getCanonicalBaseUrl();
        if (!CHANNEL_ID.matcher(channelId).matches()
                || (!knownChannelId.isEmpty() && !knownChannelId.equals(channelId))
                || !canonical.startsWith("/@")) {
            return null;
        }

        String handle = Uri.decode(canonical.substring(1));
        if (handle.length() <= 1 || handle.indexOf('/', 1) >= 0) {
            return null;
        }

        var viewModel = metadata.getLockupMetadataViewModel();
        var metadataWrapper = viewModel.getMetadata();
        var details = metadataWrapper.getContentMetadataViewModel();
        for (int rowIndex = 0; rowIndex < details.getMetadataRowsCount(); rowIndex++) {
            MetadataRow row = details.getMetadataRows(rowIndex);
            for (int partIndex = 0; partIndex < row.getMetadataPartsCount(); partIndex++) {
                MetadataPart part = row.getMetadataParts(partIndex);
                if (part.getText().getContent().isEmpty()) {
                    continue;
                }

                // In both templates the author is the first visible metadata part, after any empty rows.
                MetadataPart replacement = rewritePart(part, handle, channel);
                if (replacement == null) {
                    return null;
                }

                return metadata.toBuilder().setLockupMetadataViewModel(viewModel.toBuilder()
                        .setMetadata(metadataWrapper.toBuilder().setContentMetadataViewModel(details.toBuilder()
                                .setMetadataRows(rowIndex, row.toBuilder().setMetadataParts(partIndex, replacement)))))
                        .build();
            }
        }
        return null;
    }

    @Nullable
    private static MetadataPart rewritePart(MetadataPart part, String handle, Channel channel) {
        AttributedText text = part.getText();
        String content = text.getContent();
        int start = handleStart(content, handle);
        if (start < 0 || text.getContextualRunsCount() != 0) {
            return null;
        }

        String label = part.getAccessibilityLabel();
        String name = displayName(label, handle, channel);
        if (name == null) {
            return null;
        }

        int end = start + handle.length();
        var edit = new TextEdit(start, end, name.length() - handle.length(), content.length());
        var result = text.toBuilder().setContent(edit.replace(content, name));
        if (!rewriteRuns(text, result, edit, channel.endpoint.getBrowseId(), handle)) {
            return null;
        }

        var replacement = part.toBuilder().setText(result);
        int labelStart = handleStart(label, handle);
        if (labelStart >= 0) {
            replacement.setAccessibilityLabel(label.substring(0, labelStart) + name
                    + label.substring(labelStart + handle.length()));
        }
        return replacement.build();
    }

    private static int handleStart(String text, String handle) {
        int start = 0;
        while (start < text.length() && isBylineBoundary(text.charAt(start))) {
            start++;
        }
        int end = start + handle.length();
        return text.regionMatches(true, start, handle, 0, handle.length())
                && (end == text.length() || isBylineBoundary(text.charAt(end)) || text.charAt(end) == ',') ? start : -1;
    }

    private static boolean isBylineBoundary(char ch) {
        return Character.isWhitespace(ch) || Character.isSpaceChar(ch) || Character.getType(ch) == Character.FORMAT
                || ch == '\u00b7' || ch == '\u2022' || ch == '\ufffc';
    }

    @Nullable
    private static String displayName(String bylineLabel, String handle, Channel channel) {
        String avatarLabel = channel.avatarLabel;
        // The native byline label can still speak the display name even when the visible run is a handle.
        // Corroborate its author segment with the same row's avatar, without assuming an English action label.
        for (int end = bylineLabel.length(); end > 0; end = bylineLabel.lastIndexOf(", ", end - 1)) {
            if (end > avatarLabel.length()) {
                continue;
            }
            String candidate = bylineLabel.substring(0, end);
            if (isName(candidate) && avatarContainsName(avatarLabel, candidate)) {
                return candidate;
            }
        }

        // This cache also accepts names from channel page UI, so require the row avatar to agree.
        // The Shorts last-author heuristic and Return YouTube Username are not Home name sources.
        String cached = ReturnYouTubeChannelNamePatch.getCachedChannelName(channel.endpoint.getBrowseId());
        if (isName(cached) && avatarContainsName(avatarLabel, cached)) {
            return cached;
        }

        // Some servers keep only the handle in the byline label. Accept the named-avatar form
        // only when it uses the exact action string from this YouTube locale and the endpoint matched.
        if (avatarLabel.isEmpty() || (!bylineLabel.isEmpty() && handleStart(bylineLabel, handle) < 0)) {
            return null;
        }

        String action = ResourceUtils.getString("accessibility_go_to_channel");
        int actionEnd = action.length();
        if (!action.isEmpty() && avatarLabel.length() > actionEnd && avatarLabel.startsWith(action)
                && Character.isSpaceChar(avatarLabel.charAt(actionEnd))) {
            String name = avatarLabel.substring(actionEnd + 1);
            if (isName(name)) {
                return name;
            }
        }
        return null;
    }

    private static boolean avatarContainsName(String avatarLabel, String name) {
        int offset = avatarLabel.indexOf(name);
        return offset >= 0 && isNameBoundary(avatarLabel, offset - 1)
                && isNameBoundary(avatarLabel, offset + name.length());
    }

    private static boolean isNameBoundary(String label, int index) {
        if (index < 0 || index == label.length()) {
            return true;
        }
        char ch = label.charAt(index);
        int type = Character.getType(ch);
        return isBylineBoundary(ch) || type == Character.START_PUNCTUATION || type == Character.END_PUNCTUATION
                || type == Character.INITIAL_QUOTE_PUNCTUATION || type == Character.FINAL_QUOTE_PUNCTUATION;
    }

    private static boolean isName(String candidate) {
        int first = -1;
        for (int index = 0; index < candidate.length(); ) {
            int codePoint = candidate.codePointAt(index);
            if (Character.isISOControl(codePoint)) {
                return false;
            }
            if (first < 0 && (codePoint > Character.MAX_VALUE || !isBylineBoundary((char) codePoint))) {
                first = codePoint;
            }
            index += Character.charCount(codePoint);
        }
        return first >= 0 && first != '@';
    }

    private record TextEdit(int start, int end, int delta, int oldLength) {
        String replace(String text, String replacement) {
            return text.substring(0, start) + replacement + text.substring(end);
        }

        boolean overlaps(int runStart, int runLength) {
            return runStart < end && (long) runStart + runLength > start;
        }

        int movedStart(int runStart) {
            return runStart >= end ? runStart + delta : runStart;
        }

        int movedLength(int runStart, int runLength) {
            long runEnd = (long) runStart + runLength;
            if (runStart < 0 || runLength < 0 || runEnd > oldLength
                    || (runStart > start && runStart < end) || (runEnd > start && runEnd < end)) {
                return -1;
            }
            return overlaps(runStart, runLength) ? runLength + delta : runLength;
        }
    }

    private static boolean rewriteRuns(AttributedText old, AttributedText.Builder result, TextEdit edit,
                                       String channelId, String handle) {
        for (int index = 0; index < old.getCommandRunsCount(); index++) {
            var run = old.getCommandRuns(index);
            int start = run.getStartIndex();
            int length = edit.movedLength(start, run.getLength());
            if (length < 0 || (edit.overlaps(start, run.getLength()) && !isAuthorCommand(run.getOnTap(),
                    channelId, handle))) {
                return false;
            }
            if (length != run.getLength() || edit.movedStart(start) != start) {
                result.setCommandRuns(index, run.toBuilder().setStartIndex(edit.movedStart(start)).setLength(length));
            }
        }

        for (int index = 0; index < old.getAttachmentRunsCount(); index++) {
            var run = old.getAttachmentRuns(index);
            int start = run.getStartIndex();
            if (edit.movedLength(start, run.getLength()) < 0 || edit.overlaps(start, run.getLength())) {
                return false;
            }
            if (edit.movedStart(start) != start) {
                result.setAttachmentRuns(index, run.toBuilder().setStartIndex(edit.movedStart(start)));
            }
        }

        return rewriteRanges(old.getStyleRunsList(), edit, result::setStyleRuns)
                && rewriteRanges(old.getParagraphRunsList(), edit, result::setParagraphRuns)
                && rewriteRanges(old.getLocaleRunsList(), edit, result::setLocaleRuns);
    }

    private static boolean isAuthorCommand(InnertubeCommandHolder holder, String channelId, String handle) {
        if (!holder.hasInnertubeCommand()) {
            return !holder.hasSerialCommand();
        }
        var command = holder.getInnertubeCommand();
        if (!command.hasBrowseEndpoint()) {
            return false;
        }
        BrowseEndpoint target = command.getBrowseEndpoint();
        String canonical = target.getCanonicalBaseUrl();
        return channelId.equals(target.getBrowseId())
                && (canonical.isEmpty() || Uri.decode(canonical).equalsIgnoreCase('/' + handle));
    }

    private interface SetRange {
        void set(int index, TextRunRange.Builder run);
    }

    private static boolean rewriteRanges(List<TextRunRange> runs, TextEdit edit, SetRange setter) {
        for (int index = 0; index < runs.size(); index++) {
            TextRunRange run = runs.get(index);
            int start = run.getStartIndex();
            int moved = edit.movedStart(start);
            int length = edit.movedLength(start, run.getLength());
            if (length < 0) {
                return false;
            }
            if (moved != start || length != run.getLength()) {
                setter.set(index, run.toBuilder().setStartIndex(moved).setLength(length));
            }
        }
        return true;
    }
}
