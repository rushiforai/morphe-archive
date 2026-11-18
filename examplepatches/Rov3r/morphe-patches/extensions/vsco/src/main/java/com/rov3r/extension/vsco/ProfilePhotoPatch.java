package com.rov3r.extension.vsco;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Adds a full-quality viewer to profile photos. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class ProfilePhotoPatch {
    private static final Map<View, ProfilePhoto> PHOTOS =
        Collections.synchronizedMap(new WeakHashMap<>());

    private ProfilePhotoPatch() {
    }

    /** Called when the normal profile header binds its user model. */
    public static void bindHeader(Object holder, Object userModel) {
        bind(holder, userModel);
    }

    /** Called when the Spaces profile header binds its user model. */
    public static void bindSpacesHeader(Object header, Object userModel) {
        bind(header, userModel);
    }

    private static void bind(Object owner, Object userModel) {
        if (owner == null || userModel == null) {
            return;
        }
        try {
            Field imageField = findField(owner.getClass(), "userPhoto");
            Object value = imageField.get(owner);
            if (!(value instanceof View)) {
                return;
            }
            View photoView = (View) value;
            String sourceUrl = invokeString(userModel, "getProfileImageUrlOnlyIfSetByUser");
            if (sourceUrl.isEmpty()) {
                sourceUrl = invokeString(userModel, "getProfileImageUrlOrDefaultUrl");
            }
            if (sourceUrl.isEmpty()) {
                return;
            }
            String username = invokeString(userModel, "getSiteSubDomain");
            if (username.isEmpty()) {
                username = invokeString(userModel, "getlookupNameForCache");
            }
            username = DownloadPostsPatch.safeFilePartPublic(username);
            if (username.isEmpty()) {
                username = "profile";
            }
            String fullQualityUrl = DownloadPostsPatch.fullQualityUrl(sourceUrl, false);
            ProfilePhoto photo = new ProfilePhoto(fullQualityUrl, username);
            PHOTOS.put(photoView, photo);
            photoView.setOnLongClickListener(view -> {
                if (!PatchSettings.enabled(
                    view.getContext(),
                    PatchSettings.PROFILE_PHOTO_VIEWER,
                    true
                )) {
                    return false;
                }
                ProfilePhoto current = PHOTOS.get(view);
                if (current == null) {
                    return false;
                }
                showViewer(view.getContext(), current);
                return true;
            });
        } catch (Exception ignored) {
            // Profile headers without the expected image field are left untouched.
        }
    }

    private static void showViewer(Context context, ProfilePhoto photo) {
        Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        FrameLayout root = new FrameLayout(context);
        root.setBackgroundColor(Color.BLACK);
        ImageView image = new ImageView(context);
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        root.addView(
            image,
            new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
        );

        ProgressBar progress = new ProgressBar(context);
        FrameLayout.LayoutParams progressParams = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.CENTER
        );
        root.addView(progress, progressParams);

        LinearLayout actions = new LinearLayout(context);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER);
        actions.setPadding(dp(context, 12), dp(context, 8), dp(context, 12), dp(context, 20));
        actions.setBackgroundColor(0x99000000);

        Button save = new Button(context);
        save.setText("Save");
        save.setOnClickListener(view -> {
            Uri destination = DownloadPostsPatch.savedDestinationPublic(context);
            if (destination == null) {
                Toast.makeText(context, "Choose a download folder first", Toast.LENGTH_SHORT).show();
                DownloadPostsPatch.chooseDownloadDestination(context);
                return;
            }
            String fileName = DownloadPostsPatch.createFileName(
                context,
                "profile",
                photo.username,
                "profile_image",
                ".jpg"
            );
            DownloadPostsPatch.saveExternalUrl(
                context,
                destination,
                photo.url,
                photo.username,
                fileName,
                "image/jpeg"
            );
        });
        actions.addView(save);

        Button close = new Button(context);
        close.setText("Close");
        close.setOnClickListener(view -> dialog.dismiss());
        actions.addView(close);

        FrameLayout.LayoutParams actionParams = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.BOTTOM
        );
        root.addView(actions, actionParams);
        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
            window.setLayout(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT
            );
        }
        dialog.setOnShowListener(ignored -> {
            Window shownWindow = dialog.getWindow();
            if (shownWindow != null) {
                shownWindow.setLayout(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.MATCH_PARENT
                );
            }
        });
        dialog.show();

        new Thread(() -> {
            Bitmap bitmap = downloadBitmap(photo.url);
            image.post(() -> {
                progress.setVisibility(View.GONE);
                if (bitmap == null) {
                    Toast.makeText(context, "Couldn't load profile photo", Toast.LENGTH_SHORT).show();
                    return;
                }
                image.setImageBitmap(bitmap);
            });
        }, "Morphe-VSCO-Profile-Photo").start();
    }

    private static Bitmap downloadBitmap(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(20000);
            connection.setReadTimeout(60000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Android) VSCO");
            if (connection.getResponseCode() < 200 || connection.getResponseCode() >= 300) {
                return null;
            }
            try (InputStream input = new BufferedInputStream(connection.getInputStream())) {
                return BitmapFactory.decodeStream(input);
            }
        } catch (Exception ignored) {
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static String invokeString(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            Object value = method.invoke(target);
            return value instanceof String ? (String) value : "";
        } catch (Exception ignored) {
            return "";
        }
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

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static final class ProfilePhoto {
        private final String url;
        private final String username;

        private ProfilePhoto(String url, String username) {
            this.url = url;
            this.username = username;
        }
    }
}
