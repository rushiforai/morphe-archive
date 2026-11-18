package com.rov3r.extension.vsco;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.app.Fragment;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Runtime code injected into VSCO by the Morphe patch. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess", "deprecation"})
public final class DownloadPostsPatch {
    private static final String DOWNLOAD_BUTTON_TAG = "rov3r_morphe_vsco_download_button";
    private static final String COPY_BUTTON_TAG = "rov3r_morphe_vsco_copy_button";
    private static final String SHARE_BUTTON_TAG = "rov3r_morphe_vsco_share_button";
    private static final String FEED_DOWNLOAD_BUTTON_TAG =
        "rov3r_morphe_vsco_feed_download_button";
    private static final String OVERFLOW_COPY_TAG = "rov3r_morphe_vsco_overflow_copy";
    private static final String OVERFLOW_SHARE_TAG = "rov3r_morphe_vsco_overflow_share";
    private static final String NETWORK_UTILITY = "co.vsco.vsn.utility.NetworkUtility";
    private static final String PICKER_TAG = "rov3r_morphe_vsco_directory_picker";
    private static final Set<String> TRACKING_PARAMETERS = new HashSet<>(Arrays.asList(
        "fbclid", "gclid", "dclid", "msclkid", "mc_cid", "mc_eid", "ref", "referrer"
    ));

    private static WeakReference<Object> currentModel = new WeakReference<>(null);

    private DownloadPostsPatch() {
    }

    /** Called at the start of MediaDetailView.setUpImage(ImageMediaModel). */
    public static void setCurrentModel(Object model) {
        currentModel = new WeakReference<>(model);
    }

    /** Called at the start of MediaDetailView.setupListeners(). */
    public static void attachDownloadButton(View detailView) {
        Context context = detailView.getContext();
        int favoriteId = resourceId(context, "id", "detail_view_favorite_button");
        View favoriteButton = detailView.findViewById(favoriteId);
        if (favoriteButton == null || !(favoriteButton.getParent() instanceof ViewGroup)) {
            return;
        }

        ViewGroup actionRow = (ViewGroup) favoriteButton.getParent();
        int iconId = resourceId(context, "drawable", "morphe_vsco_download");
        if (iconId == 0) {
            return;
        }

        View existingDownload = actionRow.findViewWithTag(DOWNLOAD_BUTTON_TAG);
        if (existingDownload == null) {
            int inflatedId = resourceId(context, "id", "morphe_vsco_detail_download_button");
            if (inflatedId != 0) {
                existingDownload = detailView.findViewById(inflatedId);
            }
        }

        ImageButton button;
        if (existingDownload instanceof ImageButton) {
            button = (ImageButton) existingDownload;
            bindInflatedDownloadButton(button);
        } else {
            button = createActionButton(context, favoriteButton, iconId);
            button.setTag(DOWNLOAD_BUTTON_TAG);
            button.setContentDescription("Download post. Long press to change save folder.");
            configureDownloadButton(button, null);
            int forwardId = resourceId(context, "id", "detail_view_forward_button");
            View forwardButton = detailView.findViewById(forwardId);
            int insertAt = forwardButton == null
                ? actionRow.indexOfChild(favoriteButton) + 1
                : actionRow.indexOfChild(forwardButton) + 1;
            actionRow.addView(button, insertAt);
        }

        int insertAt = actionRow.indexOfChild(button) + 1;
        if (actionRow.findViewWithTag(COPY_BUTTON_TAG) == null) {
            ImageButton copyButton = createActionButton(
                context,
                favoriteButton,
                resourceId(context, "drawable", "morphe_vsco_copy")
            );
            copyButton.setTag(COPY_BUTTON_TAG);
            copyButton.setContentDescription("Copy original media link");
            copyButton.setOnClickListener(view -> copyOriginalLink(view.getContext()));
            actionRow.addView(copyButton, insertAt++);
        }
        if (actionRow.findViewWithTag(SHARE_BUTTON_TAG) == null) {
            ImageButton shareButton = createActionButton(
                context,
                favoriteButton,
                resourceId(context, "drawable", "morphe_vsco_share")
            );
            shareButton.setTag(SHARE_BUTTON_TAG);
            shareButton.setContentDescription("Share original media");
            shareButton.setOnClickListener(view -> shareOriginal(view.getContext()));
            actionRow.addView(shareButton, insertAt);
        }
        applyButtonPreferences(actionRow);
    }

    /** Initializes a download button that was created during XML inflation. */
    static void bindInflatedDownloadButton(ImageButton button) {
        boolean feed = false;
        String resourceName = "";
        try {
            resourceName = button.getResources().getResourceEntryName(button.getId());
            feed = resourceName.startsWith("morphe_vsco_feed_");
        } catch (RuntimeException ignored) {
            // Detail buttons use the non-feed behavior when an ID is unavailable.
        }
        button.setTag(feed ? FEED_DOWNLOAD_BUTTON_TAG : DOWNLOAD_BUTTON_TAG);
        button.setContentDescription("Download post. Long press to change save folder.");
        View feedItem = feed ? button : null;
        if (feed && button.getParent() instanceof ViewGroup) {
            String favoriteName = resourceName.contains("video")
                ? "video_item_favorite_button"
                : "image_item_favorite_button";
            int favoriteId = resourceId(button.getContext(), "id", favoriteName);
            View favorite = ((ViewGroup) button.getParent()).findViewById(favoriteId);
            if (favorite != null) {
                feedItem = favorite;
            }
        }
        configureDownloadButton(button, feedItem);
        applyButtonPreferences(button);
    }

    private static ImageButton createActionButton(Context context, View template, int iconId) {
        ImageButton button = new ImageButton(context);
        button.setImageResource(iconId);
        button.setBackgroundColor(Color.TRANSPARENT);
        button.setLayoutParams(copyLayoutParams(template.getLayoutParams()));
        button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
        int size = Math.min(template.getLayoutParams().width, template.getLayoutParams().height);
        int padding = size > 0 ? Math.max(dp(context, 4), (size - dp(context, 24)) / 2) : dp(context, 8);
        button.setPadding(padding, padding, padding, padding);
        return button;
    }

    private static void configureDownloadButton(ImageButton button, View feedItem) {
        button.setOnClickListener(view -> {
            view.performHapticFeedback(HapticFeedbackConstants.CONTEXT_CLICK);
            if (feedItem != null) {
                Object model = findBoundMediaModel(feedItem);
                if (model == null) {
                    showToast(view.getContext(), "Couldn't download - media unavailable");
                    return;
                }
                setCurrentModel(model);
            }
            Context viewContext = view.getContext();
            Uri destination = savedDestination(viewContext);
            if (destination == null) {
                chooseDestination(viewContext, true);
                return;
            }
            queueDownload(viewContext, destination);
        });
        button.setOnLongClickListener(view -> {
            view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            chooseDestination(view.getContext(), false);
            return true;
        });
    }

    public static void applyButtonPreferences(View root) {
        Object tag = root.getTag();
        Context context = root.getContext();
        boolean toolsEnabled = PatchSettings.enabled(
            context,
            PatchSettings.DOWNLOAD_TOOLS,
            true
        );
        if (DOWNLOAD_BUTTON_TAG.equals(tag)) {
            root.setVisibility(toolsEnabled ? View.VISIBLE : View.GONE);
        } else if (COPY_BUTTON_TAG.equals(tag)) {
            int slots = hiddenNativeActionSlots(context);
            root.setVisibility(toolsEnabled
                && slots > 0
                && PatchSettings.enabled(context, PatchSettings.COPY_LINK_BUTTON, false)
                ? View.VISIBLE : View.GONE);
        } else if (SHARE_BUTTON_TAG.equals(tag)) {
            int slots = hiddenNativeActionSlots(context);
            if (PatchSettings.enabled(context, PatchSettings.COPY_LINK_BUTTON, false)) {
                slots--;
            }
            root.setVisibility(toolsEnabled
                && slots > 0
                && PatchSettings.enabled(context, PatchSettings.SHARE_LINK_BUTTON, false)
                ? View.VISIBLE : View.GONE);
        } else if (FEED_DOWNLOAD_BUTTON_TAG.equals(tag)) {
            root.setVisibility(toolsEnabled ? View.VISIBLE : View.GONE);
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                applyButtonPreferences(group.getChildAt(i));
            }
        }
    }

    private static int hiddenNativeActionSlots(Context context) {
        int slots = 0;
        if (PatchSettings.enabled(context, PatchSettings.HIDE_ACTION_FAVORITE, false)) slots++;
        if (PatchSettings.enabled(context, PatchSettings.HIDE_ACTION_REPOST, false)) slots++;
        if (PatchSettings.enabled(context, PatchSettings.HIDE_ACTION_MESSAGE, false)) slots++;
        return slots;
    }

    /** Adds one native-sized download action to image and video cards in scrolling feeds. */
    public static void attachFeedButtons(View root) {
        Context context = root.getContext();
        int imageFavorite = resourceId(context, "id", "image_item_favorite_button");
        int videoFavorite = resourceId(context, "id", "video_item_favorite_button");
        attachFeedButtons(root, imageFavorite, videoFavorite);
    }

    private static void attachFeedButtons(View root, int imageFavorite, int videoFavorite) {
        int id = root.getId();
        if ((id == imageFavorite && imageFavorite != 0)
            || (id == videoFavorite && videoFavorite != 0)) {
            attachFeedButton(root);
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                attachFeedButtons(group.getChildAt(i), imageFavorite, videoFavorite);
            }
        }
    }

    private static void attachFeedButton(View favoriteButton) {
        if (!(favoriteButton.getParent() instanceof ViewGroup)) {
            return;
        }
        ViewGroup card = (ViewGroup) favoriteButton.getParent();
        if (card.findViewWithTag(FEED_DOWNLOAD_BUTTON_TAG) != null
            || hasInflatedFeedButton(card)) {
            return;
        }
        int iconId = resourceId(card.getContext(), "drawable", "morphe_vsco_download");
        if (iconId == 0) {
            return;
        }

        ImageButton button = createActionButton(card.getContext(), favoriteButton, iconId);
        button.setId(View.generateViewId());
        button.setTag(FEED_DOWNLOAD_BUTTON_TAG);
        button.setContentDescription("Download post. Long press to change save folder.");
        configureDownloadButton(button, favoriteButton);

        ViewGroup.LayoutParams params = createFeedLayoutParams(favoriteButton);
        if (params == null) {
            return;
        }
        button.setLayoutParams(params);

        card.addView(button);
        applyButtonPreferences(button);
    }

    private static boolean hasInflatedFeedButton(View card) {
        Context context = card.getContext();
        for (String name : new String[] {
            "morphe_vsco_feed_image_download_button",
            "morphe_vsco_feed_video_download_button"
        }) {
            int id = resourceId(context, "id", name);
            if (id != 0 && card.findViewById(id) != null) {
                return true;
            }
        }
        return false;
    }

    private static ViewGroup.LayoutParams createFeedLayoutParams(View favoriteButton) {
        ViewGroup.LayoutParams original = favoriteButton.getLayoutParams();
        if (original instanceof RelativeLayout.LayoutParams) {
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                original.width,
                original.height
            );
            copyMargins(original, params);
            params.addRule(RelativeLayout.LEFT_OF, favoriteButton.getId());
            params.addRule(RelativeLayout.ALIGN_TOP, favoriteButton.getId());
            params.addRule(RelativeLayout.ALIGN_BOTTOM, favoriteButton.getId());
            return params;
        }

        try {
            Object copy = original.getClass()
                .getConstructor(int.class, int.class)
                .newInstance(original.width, original.height);
            if (!(copy instanceof ViewGroup.LayoutParams)) {
                return null;
            }
            ViewGroup.LayoutParams params = (ViewGroup.LayoutParams) copy;
            copyMargins(original, params);
            for (String name : new String[] {
                "topToTop", "topToBottom", "bottomToTop", "bottomToBottom",
                "baselineToBaseline", "baselineToTop", "baselineToBottom"
            }) {
                copyIntField(original, params, name);
            }
            boolean anchored = setIntField(
                params, "rightToLeft", favoriteButton.getId()
            );
            anchored |= setIntField(
                params, "endToStart", favoriteButton.getId()
            );
            if (!anchored) {
                return null;
            }
            return params;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static void copyMargins(
        ViewGroup.LayoutParams source,
        ViewGroup.LayoutParams target
    ) {
        if (source instanceof ViewGroup.MarginLayoutParams
            && target instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams from = (ViewGroup.MarginLayoutParams) source;
            ViewGroup.MarginLayoutParams to = (ViewGroup.MarginLayoutParams) target;
            to.setMargins(from.leftMargin, from.topMargin, from.rightMargin, from.bottomMargin);
            to.setMarginStart(from.getMarginStart());
            to.setMarginEnd(from.getMarginEnd());
        }
    }

    private static void copyIntField(Object source, Object target, String name) {
        try {
            Field sourceField = source.getClass().getField(name);
            Field targetField = target.getClass().getField(name);
            targetField.setInt(target, sourceField.getInt(source));
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The layout implementation may not support every vertical constraint.
        }
    }

    /** Called whenever the post's three-dot menu is opened. */
    public static void attachOverflowActions(View detailView, Object menuState) {
        if (menuState == null || !menuState.getClass().getSimpleName().contains("BottomMenuOpen")) {
            return;
        }
        detailView.postDelayed(() -> {
            try {
                Field field = findField(detailView.getClass(), "bottomMenuDialogFragment");
                Object fragment = field.get(detailView);
                Object dialogObject = fragment.getClass().getMethod("getDialog").invoke(fragment);
                if (!(dialogObject instanceof Dialog)) {
                    return;
                }
                Dialog dialog = (Dialog) dialogObject;
                if (dialog.getWindow() == null) {
                    return;
                }
                View decor = dialog.getWindow().getDecorView();
                View listView = decor.findViewById(
                    resourceId(detailView.getContext(), "id", "bottom_menu_list")
                );
                if (!(listView instanceof LinearLayout)) {
                    return;
                }
                LinearLayout list = (LinearLayout) listView;
                addOverflowAction(
                    list, dialog, OVERFLOW_COPY_TAG, "Copy direct media link", true
                );
                addOverflowAction(
                    list, dialog, OVERFLOW_SHARE_TAG, "Share direct media link", false
                );
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // A missing or closed menu must never interfere with VSCO's own options.
            }
        }, 150L);
    }

    private static void addOverflowAction(
        LinearLayout list,
        Dialog dialog,
        String tag,
        String title,
        boolean copy
    ) {
        if (list.findViewWithTag(tag) != null) {
            return;
        }
        TextView template = null;
        int cancelId = resourceId(list.getContext(), "id", "bottom_menu_cancel");
        View cancel = list.findViewById(cancelId);
        if (cancel instanceof TextView) {
            template = (TextView) cancel;
        }
        if (template == null) {
            for (int i = list.getChildCount() - 1; i >= 0; i--) {
                if (list.getChildAt(i) instanceof TextView) {
                    template = (TextView) list.getChildAt(i);
                    break;
                }
            }
        }

        TextView action = new TextView(list.getContext());
        action.setTag(tag);
        action.setText(title);
        action.setContentDescription(title);
        action.setClickable(true);
        action.setFocusable(true);
        if (template != null) {
            action.setTextColor(template.getTextColors());
            action.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, template.getTextSize());
            action.setTypeface(template.getTypeface());
            action.setGravity(template.getGravity());
            action.setPadding(
                template.getPaddingLeft(), template.getPaddingTop(),
                template.getPaddingRight(), template.getPaddingBottom()
            );
            action.setMinHeight(template.getMinHeight());
            action.setLayoutParams(copyLayoutParams(template.getLayoutParams()));
            if (template.getBackground() != null
                && template.getBackground().getConstantState() != null) {
                action.setBackground(template.getBackground().getConstantState().newDrawable());
            }
        } else {
            action.setPadding(dp(list.getContext(), 16), 0, dp(list.getContext(), 16), 0);
            action.setMinHeight(dp(list.getContext(), 56));
            action.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }
        action.setOnClickListener(view -> {
            if (copy) {
                copyOriginalLink(view.getContext());
            } else {
                shareOriginal(view.getContext());
            }
            dialog.dismiss();
        });
        int insertAt = cancel == null ? list.getChildCount() : list.indexOfChild(cancel);
        list.addView(action, Math.max(0, insertAt));
    }

    private static Object findBoundMediaModel(View view) {
        try {
            Object listeners = findField(View.class, "mListenerInfo").get(view);
            Object listenerModel = findMediaModel(
                listeners, 4, new IdentityHashMap<>(), new int[] {0}
            );
            if (listenerModel != null) {
                return listenerModel;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Recycler/view-holder lookup below supports implementations that hide listeners.
        }
        View current = view;
        while (current != null) {
            Object tagged = findMediaModel(
                current.getTag(), 3, new IdentityHashMap<>(), new int[] {0}
            );
            if (tagged != null) {
                return tagged;
            }
            ViewParent parent = current.getParent();
            if (!(parent instanceof View)) {
                break;
            }
            View parentView = (View) parent;
            if (parentView.getClass().getName().contains("RecyclerView")) {
                try {
                    Method holderMethod = parentView.getClass()
                        .getMethod("getChildViewHolder", View.class);
                    Object holder = holderMethod.invoke(parentView, current);
                    Object model = findMediaModel(
                        holder, 4, new IdentityHashMap<>(), new int[] {0}
                    );
                    if (model != null) {
                        return model;
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    return null;
                }
            }
            current = parentView;
        }
        return null;
    }

    private static Object findMediaModel(
        Object candidate,
        int depth,
        Map<Object, Boolean> visited,
        int[] inspected
    ) {
        if (candidate == null || depth < 0 || inspected[0]++ > 150
            || visited.put(candidate, Boolean.TRUE) != null) {
            return null;
        }
        if (looksLikeMediaModel(candidate)) {
            return candidate;
        }
        if (candidate instanceof View || candidate instanceof Context) {
            return null;
        }
        Class<?> type = candidate.getClass();
        String name = type.getName();
        if (type.isPrimitive() || type.isEnum() || name.startsWith("java.lang.")) {
            return null;
        }
        for (Class<?> current = type; current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object found = findMediaModel(
                        field.get(candidate), depth - 1, visited, inspected
                    );
                    if (found != null) {
                        return found;
                    }
                } catch (IllegalAccessException | RuntimeException ignored) {
                    // Continue through accessible binding/view-holder fields.
                }
            }
        }
        return null;
    }

    private static boolean looksLikeMediaModel(Object value) {
        String name = value.getClass().getName();
        if (name.endsWith("ImageMediaModel")) {
            return true;
        }
        try {
            value.getClass().getMethod("getIdStr");
            value.getClass().getMethod("getResponsiveImageUrl");
            value.getClass().getMethod("getOwnerSiteData");
            value.getClass().getMethod("isDsco");
            return true;
        } catch (NoSuchMethodException ignored) {
            return false;
        }
    }

    public static void chooseDownloadDestination(Context context) {
        chooseDestination(context, false);
    }

    private static void chooseDestination(Context context, boolean downloadAfterSelection) {
        Activity activity = findActivity(context);
        if (activity == null) {
            showToast(context, "Couldn't open the folder picker");
            return;
        }

        if (activity.getFragmentManager().findFragmentByTag(PICKER_TAG) != null) {
            return;
        }

        DirectoryPickerFragment picker = DirectoryPickerFragment.create(downloadAfterSelection);
        activity.getFragmentManager()
            .beginTransaction()
            .add(picker, PICKER_TAG)
            .commitAllowingStateLoss();
    }

    private static Uri savedDestination(Context context) {
        SharedPreferences preferences = PatchSettings.preferences(context);
        String value = preferences.getString(PatchSettings.DESTINATION_KEY, null);
        if (value == null || value.isEmpty()) {
            return null;
        }

        Uri uri = Uri.parse(value);
        List<android.content.UriPermission> permissions =
            context.getContentResolver().getPersistedUriPermissions();
        for (android.content.UriPermission permission : permissions) {
            if (permission.isReadPermission()
                && permission.isWritePermission()
                && uri.equals(permission.getUri())) {
                return uri;
            }
        }

        preferences.edit().remove(PatchSettings.DESTINATION_KEY).apply();
        return null;
    }

    public static Uri savedDestinationPublic(Context context) {
        return savedDestination(context);
    }

    public static String safeFilePartPublic(String value) {
        return safeFilePart(value);
    }

    public static String fullQualityUrl(String sourceUrl, boolean video) {
        try {
            return makeAbsoluteMediaUrl(sourceUrl, video);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return sourceUrl;
        }
    }

    public static String createFileName(
        Context context,
        String id,
        String username,
        String type,
        String extension
    ) {
        String timestamp = String.valueOf(System.currentTimeMillis());
        String template = PatchSettings.text(
            context,
            PatchSettings.FILE_NAME_TEMPLATE,
            PatchSettings.DEFAULT_FILE_NAME_TEMPLATE
        );
        return renderFileName(
            template,
            safeFilePart(id),
            safeFilePart(username),
            safeFilePart(type),
            timestamp,
            PatchSettings.enabled(context, PatchSettings.INCLUDE_TIMESTAMP, true)
        ) + extension;
    }

    public static void saveExternalUrl(
        Context context,
        Uri destination,
        String url,
        String username,
        String fileName,
        String mimeType
    ) {
        DownloadInfo info = new DownloadInfo(url, safeFilePart(username), fileName, mimeType);
        Context appContext = context.getApplicationContext();
        showToast(appContext, "Downloading " + fileName);
        new Thread(() -> {
            boolean saved = downloadToFolder(appContext, destination, info);
            showToast(appContext, saved ? "Saved " + fileName : "Couldn't download " + fileName);
        }, "Morphe-VSCO-External-Download").start();
    }

    private static void queueDownload(Context context, Uri destination) {
        final DownloadInfo info = currentDownloadInfo(context);
        if (info == null) {
            showToast(context, "Couldn't download - media unavailable");
            return;
        }

        final Context appContext = context.getApplicationContext();
        showToast(appContext, "Downloading " + info.fileName);
        new Thread(() -> {
            boolean saved = downloadToFolder(appContext, destination, info);
            showToast(
                appContext,
                saved ? "Saved " + info.fileName : "Couldn't download " + info.fileName
            );
        }, "Morphe-VSCO-Download").start();
    }

    private static DownloadInfo currentDownloadInfo(Context context) {
        Object model = currentModel.get();
        if (model == null) {
            return null;
        }

        try {
            boolean isVideo = (boolean) invoke(model, "isDsco");
            String mediaId = safeFilePart((String) invoke(model, "getIdStr"));
            String sourceUrl = (String) invoke(
                model,
                isVideo ? "getDscoUrl" : "getResponsiveImageUrl"
            );
            String downloadUrl = makeAbsoluteMediaUrl(sourceUrl, isVideo);
            if (downloadUrl == null || downloadUrl.isEmpty()) {
                return null;
            }

            Object owner = invoke(model, "getOwnerSiteData");
            String username = safeFilePart(readString(owner, "username", "getUsername"));
            if (username.isEmpty()) {
                username = "unknown";
            }

            String extension = isVideo ? ".mp4" : imageExtension(downloadUrl);
            String mimeType = isVideo ? "video/mp4" : imageMimeType(extension);
            String fileName = createFileName(
                context,
                mediaId.isEmpty() ? "post" : mediaId,
                username,
                isVideo ? "video" : "image",
                extension
            );
            return new DownloadInfo(downloadUrl, username, fileName, mimeType);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static boolean downloadToFolder(Context context, Uri treeUri, DownloadInfo info) {
        ContentResolver resolver = context.getContentResolver();
        Uri outputUri = null;
        HttpURLConnection connection = null;
        try {
            Uri root = DocumentsContract.buildDocumentUriUsingTree(
                treeUri,
                DocumentsContract.getTreeDocumentId(treeUri)
            );
            Uri outputFolder = root;
            if (PatchSettings.enabled(context, PatchSettings.ORGANIZE_BY_USERNAME, true)) {
                outputFolder = findOrCreateDirectory(resolver, root, info.username);
                if (outputFolder == null) {
                    return false;
                }
            }

            connection = (HttpURLConnection) new URL(info.url).openConnection();
            connection.setConnectTimeout(20000);
            connection.setReadTimeout(60000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Android) VSCO");
            int responseCode = connection.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                return false;
            }

            outputUri = DocumentsContract.createDocument(
                resolver,
                outputFolder,
                info.mimeType,
                info.fileName
            );
            if (outputUri == null) {
                return false;
            }

            try (
                InputStream input = new BufferedInputStream(connection.getInputStream());
                OutputStream rawOutput = resolver.openOutputStream(outputUri, "w");
                OutputStream output = rawOutput == null ? null : new BufferedOutputStream(rawOutput)
            ) {
                if (output == null) {
                    DocumentsContract.deleteDocument(resolver, outputUri);
                    return false;
                }
                byte[] buffer = new byte[32768];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    output.write(buffer, 0, count);
                }
            }
            return true;
        } catch (IOException | RuntimeException ignored) {
            if (outputUri != null) {
                try {
                    DocumentsContract.deleteDocument(resolver, outputUri);
                } catch (Exception ignoredDeleteFailure) {
                    // The provider may already have removed an incomplete document.
                }
            }
            return false;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static Uri findOrCreateDirectory(ContentResolver resolver, Uri parent, String name)
        throws IOException {
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(
            parent,
            DocumentsContract.getDocumentId(parent)
        );
        String[] projection = {
            DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME,
            DocumentsContract.Document.COLUMN_MIME_TYPE
        };
        try (Cursor cursor = resolver.query(children, projection, null, null, null)) {
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    if (name.equals(cursor.getString(1))
                        && DocumentsContract.Document.MIME_TYPE_DIR.equals(cursor.getString(2))) {
                        return DocumentsContract.buildDocumentUriUsingTree(parent, cursor.getString(0));
                    }
                }
            }
        }
        return DocumentsContract.createDocument(
            resolver,
            parent,
            DocumentsContract.Document.MIME_TYPE_DIR,
            name
        );
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            Context next = ((ContextWrapper) current).getBaseContext();
            if (next == current) {
                break;
            }
            current = next;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static void showToast(Context context, String message) {
        new Handler(Looper.getMainLooper()).post(
            () -> Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        );
    }

    private static void copyOriginalLink(Context context) {
        DownloadInfo info = currentDownloadInfo(context);
        if (info == null) {
            showToast(context, "Couldn't copy link - media unavailable");
            return;
        }
        String url = removeTrackingParameters(info.url);
        ClipboardManager clipboard =
            (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) {
            showToast(context, "Clipboard unavailable");
            return;
        }
        clipboard.setPrimaryClip(ClipData.newPlainText("Original VSCO media", url));
        showToast(context, "Original media link copied");
    }

    private static void shareOriginal(Context context) {
        DownloadInfo info = currentDownloadInfo(context);
        if (info == null) {
            showToast(context, "Couldn't share - media unavailable");
            return;
        }
        Intent share = new Intent(Intent.ACTION_SEND);
        share.setType("text/plain");
        share.putExtra(Intent.EXTRA_TEXT, removeTrackingParameters(info.url));
        Intent chooser = Intent.createChooser(share, "Share original media");
        if (!(context instanceof Activity)) {
            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(chooser);
    }

    private static String removeTrackingParameters(String value) {
        try {
            Uri uri = Uri.parse(value);
            if (uri.getQuery() == null) {
                return value;
            }
            Uri.Builder clean = uri.buildUpon().clearQuery();
            for (String key : uri.getQueryParameterNames()) {
                String lower = key.toLowerCase(java.util.Locale.US);
                if (lower.startsWith("utm_") || TRACKING_PARAMETERS.contains(lower)) {
                    continue;
                }
                for (String parameterValue : uri.getQueryParameters(key)) {
                    clean.appendQueryParameter(key, parameterValue);
                }
            }
            return clean.build().toString();
        } catch (RuntimeException ignored) {
            return value;
        }
    }

    private static String makeAbsoluteMediaUrl(String sourceUrl, boolean isVideo)
        throws ReflectiveOperationException {
        if (sourceUrl == null || sourceUrl.isEmpty()) {
            return null;
        }

        Class<?> utilityClass = Class.forName(NETWORK_UTILITY);
        Field instanceField = utilityClass.getField("INSTANCE");
        Object utility = instanceField.get(null);
        Method method = utilityClass.getMethod(
            isVideo ? "getVideoUrl" : "getFullResImgixImageUrl",
            String.class
        );
        return (String) method.invoke(utility, sourceUrl);
    }

    private static Object invoke(Object target, String methodName)
        throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(methodName);
        return method.invoke(target);
    }

    private static String readString(Object target, String fieldName, String getterName)
        throws ReflectiveOperationException {
        if (target == null) {
            return "";
        }

        try {
            Field field = target.getClass().getField(fieldName);
            Object value = field.get(target);
            return value instanceof String ? (String) value : "";
        } catch (NoSuchFieldException ignored) {
            Object value = invoke(target, getterName);
            return value instanceof String ? (String) value : "";
        }
    }

    private static int resourceId(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        Class<?> current = type;
        while (current != null) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static ViewGroup.LayoutParams copyLayoutParams(ViewGroup.LayoutParams original) {
        try {
            Constructor<?> exactCopy = original.getClass().getConstructor(original.getClass());
            return (ViewGroup.LayoutParams) exactCopy.newInstance(original);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Some framework parameter classes only expose a superclass copy constructor.
        }
        for (Constructor<?> constructor : original.getClass().getConstructors()) {
            Class<?>[] parameterTypes = constructor.getParameterTypes();
            if (parameterTypes.length == 1 && parameterTypes[0].isInstance(original)) {
                try {
                    return (ViewGroup.LayoutParams) constructor.newInstance(original);
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    // Fall through to the Android layout-parameter copies below.
                }
            }
        }
        if (original instanceof LinearLayout.LayoutParams) {
            return new LinearLayout.LayoutParams((LinearLayout.LayoutParams) original);
        }
        if (original instanceof RelativeLayout.LayoutParams) {
            return new RelativeLayout.LayoutParams((RelativeLayout.LayoutParams) original);
        }
        if (original instanceof FrameLayout.LayoutParams) {
            return new FrameLayout.LayoutParams((FrameLayout.LayoutParams) original);
        }
        if (original instanceof ViewGroup.MarginLayoutParams) {
            return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) original);
        }
        return new ViewGroup.LayoutParams(original);
    }

    private static boolean setIntField(Object target, String name, int value) {
        try {
            target.getClass().getField(name).setInt(target, value);
            return true;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // These fields are supplied by ConstraintLayout on supported VSCO versions.
            return false;
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static String safeFilePart(String value) {
        if (value == null) {
            return "";
        }
        return value.replaceAll("[^A-Za-z0-9._-]", "_");
    }

    private static String renderFileName(
        String template,
        String id,
        String username,
        String type,
        String timestamp,
        boolean includeTimestamp
    ) {
        String chosen = template == null || template.trim().isEmpty()
            ? PatchSettings.DEFAULT_FILE_NAME_TEMPLATE
            : template.trim();
        chosen = chosen
            .replace("{id}", id)
            .replace("{username}", username)
            .replace("{type}", type)
            .replace("{timestamp}", includeTimestamp ? timestamp : "");
        if (includeTimestamp && !templateContainsTimestamp(template)) {
            chosen += "_" + timestamp;
        }
        chosen = safeFilePart(chosen).replaceAll("_+", "_");
        chosen = chosen.replaceAll("^[._-]+|[._-]+$", "");
        return chosen.isEmpty() ? "vsco_post" : chosen;
    }

    private static boolean templateContainsTimestamp(String template) {
        return template != null && template.contains("{timestamp}");
    }

    private static String imageExtension(String url) {
        String lower = url.toLowerCase(java.util.Locale.ROOT);
        if (lower.contains(".png")) {
            return ".png";
        }
        if (lower.contains(".webp")) {
            return ".webp";
        }
        return ".jpg";
    }

    private static String imageMimeType(String extension) {
        if (".png".equals(extension)) {
            return "image/png";
        }
        if (".webp".equals(extension)) {
            return "image/webp";
        }
        return "image/jpeg";
    }

    private static final class DownloadInfo {
        private final String url;
        private final String username;
        private final String fileName;
        private final String mimeType;

        private DownloadInfo(String url, String username, String fileName, String mimeType) {
            this.url = url;
            this.username = username;
            this.fileName = fileName;
            this.mimeType = mimeType;
        }
    }

    public static final class DirectoryPickerFragment extends Fragment {
        private static final int REQUEST_DIRECTORY = 9827;
        private static final String DOWNLOAD_AFTER_SELECTION = "download_after_selection";
        private boolean pickerStarted;

        static DirectoryPickerFragment create(boolean downloadAfterSelection) {
            DirectoryPickerFragment fragment = new DirectoryPickerFragment();
            Bundle arguments = new Bundle();
            arguments.putBoolean(DOWNLOAD_AFTER_SELECTION, downloadAfterSelection);
            fragment.setArguments(arguments);
            return fragment;
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setRetainInstance(true);
        }

        @Override
        public void onResume() {
            super.onResume();
            if (pickerStarted) {
                return;
            }
            pickerStarted = true;
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
            intent.addFlags(
                Intent.FLAG_GRANT_READ_URI_PERMISSION
                    | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                    | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
                    | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION
            );
            startActivityForResult(intent, REQUEST_DIRECTORY);
        }

        @Override
        @SuppressLint("WrongConstant")
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            super.onActivityResult(requestCode, resultCode, data);
            Activity activity = getActivity();
            if (activity == null || requestCode != REQUEST_DIRECTORY) {
                removeSelf();
                return;
            }

            if (resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
                Uri destination = data.getData();
                int flags = data.getFlags()
                    & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                try {
                    activity.getContentResolver().takePersistableUriPermission(destination, flags);
                    activity.getSharedPreferences(PatchSettings.PREFERENCES, Context.MODE_PRIVATE)
                        .edit()
                        .putString(PatchSettings.DESTINATION_KEY, destination.toString())
                        .apply();
                    showToast(activity, "Download folder saved");
                    Bundle arguments = getArguments();
                    if (arguments != null && arguments.getBoolean(DOWNLOAD_AFTER_SELECTION, false)) {
                        queueDownload(activity, destination);
                    }
                } catch (SecurityException ignored) {
                    showToast(activity, "Couldn't save access to that folder");
                }
            }
            removeSelf();
        }

        private void removeSelf() {
            if (isAdded()) {
                getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
            }
        }
    }
}
