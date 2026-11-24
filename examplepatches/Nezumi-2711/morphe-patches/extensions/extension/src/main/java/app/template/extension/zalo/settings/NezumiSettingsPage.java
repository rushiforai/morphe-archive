package app.template.extension.zalo.settings;

import android.app.Dialog;
import android.app.Notification;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.template.extension.zalo.appearance.CustomFont;
import app.template.extension.zalo.chat.OnlineStatus;
import app.template.extension.zalo.messages.OfficialAccounts;
import app.template.extension.zalo.navigation.DiscoveryTab;
import app.template.extension.zalo.shared.ZaloEnv;
import app.template.extension.zalo.sound.CustomSounds;
import app.template.extension.zalo.ui.ZaloUi;

/** The Nezumi's Settings entry row and the full-screen settings page it opens. */
public final class NezumiSettingsPage {
    private NezumiSettingsPage() { }

    static final int FEATURE_REACTION = 1;

    static final int FEATURE_TYPING = 1 << 1;

    static final int FEATURE_READ_RECEIPTS = 1 << 2;

    static final int FEATURE_DELIVERY_RECEIPTS = 1 << 3;

    static final int FEATURE_MEDIA_BOX = 1 << 4;

    static final int FEATURE_BUSINESS_BOX = 1 << 10;

    static final int FEATURE_OA_MESSAGES = 1 << 12;

    static final int FEATURE_MESSAGE_ADS = 1 << 13;

    static final int FEATURE_FEED_ADS = 1 << 11;

    static final int FEATURE_RECALLED_MESSAGES = 1 << 8;

    static final int FEATURE_ONLINE_STATUS = 1 << 5;

    static final int FEATURE_CUSTOM_FONT = 1 << 6;

    static final int FEATURE_DISCOVERY = 1 << 7;

    static final int FEATURE_CUSTOM_SOUNDS = 1 << 9;

    static void attach(View root, View anchor, int feature) {
        if (root == null || anchor == null || !(anchor.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) anchor.getParent();
        for (int index = 0; index < parent.getChildCount(); index++) {
            Object tag = parent.getChildAt(index).getTag();
            if (tag instanceof EntryState) {
                ((EntryState) tag).features |= feature;
                return;
            }
        }
        Context context = anchor.getContext();
        boolean darkMode = ZaloUi.isDarkMode(context, anchor);
        int titleId = context.getResources().getIdentifier("list_title", "id", context.getPackageName());
        View title = titleId == 0 ? null : anchor.findViewById(titleId);
        TextView nativeTitle = title instanceof TextView ? (TextView) title : null;
        View entry = ZaloUi.row(context, "Nezumi's Settings", ZaloUi.gearIcon(context), true, darkMode, nativeTitle, 49);
        Drawable background = anchor.getBackground();
        if (background != null && background.getConstantState() != null) {
            entry.setBackground(background.getConstantState().newDrawable(context.getResources()).mutate());
        }
        EntryState state = new EntryState(feature);
        entry.setTag(state);
        entry.setOnClickListener(view -> show(context, darkMode, state));
        parent.addView(entry, parent.indexOfChild(anchor) + 1);
        int dividerId = context.getResources().getIdentifier("list_divider", "id", context.getPackageName());
        View divider = dividerId == 0 ? null : anchor.findViewById(dividerId);
        if (divider != null) divider.post(() -> divider.setVisibility(View.VISIBLE));
    }

    private static final class EntryState {
        private int features;

        private EntryState(int features) {
            this.features = features;
        }
    }

    private static void show(Context context, boolean darkMode, EntryState state) {
        boolean vietnamese = ZaloEnv.isVietnamese(context);
        int features = state.features;
        boolean hasChatFeatures = (features & (FEATURE_ONLINE_STATUS | FEATURE_REACTION |
            FEATURE_TYPING | FEATURE_READ_RECEIPTS | FEATURE_DELIVERY_RECEIPTS |
            FEATURE_RECALLED_MESSAGES)) != 0;
        String reactionLabel = vietnamese ? "Mở khóa biểu tượng cảm xúc" : "Unlock reaction icons";
        String typingLabel = vietnamese ? "Ẩn trạng thái đang nhập" : "Hide typing status";
        String readLabel = vietnamese ? "Ẩn trạng thái đã xem" : "Hide read receipts";
        String deliveryLabel = vietnamese ? "Ẩn trạng thái đã nhận" : "Hide delivery receipts";
        String mediaBoxLabel = vietnamese ? "Ẩn Media Box" : "Hide Media Box";
        String businessBoxLabel = vietnamese ? "Ẩn Business Box" : "Hide Business Box";
        String oaMessagesLabel = vietnamese ? "Ẩn tài khoản OA" : "Hide OA accounts";
        String oaMuteLabel = vietnamese ? "Tắt thông báo tài khoản OA" : "Mute OA accounts";
        String feedAdsLabel = vietnamese ? "Ẩn quảng cáo Bảng tin" : "Hide feed ads";
        String recalledMessagesLabel = vietnamese ? "Giữ tin nhắn đã thu hồi" :
            "Keep recalled messages";
        String onlineLabel = vietnamese ? "Ẩn trạng thái hoạt động" : "Hide activity status";
        String discoveryLabel = vietnamese ? "Ẩn tab Khám phá" : "Hide Discovery tab";
        String messageAdsLabel = vietnamese ? "Ẩn quảng cáo trong Messages" : "Hide ads in Messages";
        SharedPreferences prefs = NezumiPrefs.of(context);
        Dialog page = ZaloUi.page(context, "Nezumi's Settings", darkMode);
        boolean[] discoveryChanged = { false };
        page.setOnDismissListener(dialog -> {
            if (discoveryChanged[0]) DiscoveryTab.recreateAfterChange(context);
        });
        LinearLayout list = page.findViewById(android.R.id.content).findViewWithTag("nezumi-list");
        if (hasChatFeatures) ZaloUi.addGroup(list, context, vietnamese ? "Trò chuyện" : "Chat", darkMode);
        if ((features & FEATURE_ONLINE_STATUS) != 0) {
            View onlineItem = ZaloUi.toggleRow(list, context, onlineLabel, "user_status",
                prefs.getBoolean(NezumiPrefs.HIDE_ONLINE_STATUS, false), darkMode, (button, checked) -> {
                if (prefs.getBoolean(NezumiPrefs.HIDE_ONLINE_STATUS, false) == checked) return;
                boolean originalSharing = OnlineStatus.originalOnlineSharing();
                boolean hasSavedSharing = prefs.contains(NezumiPrefs.SAVED_ONLINE_SHARING);
                boolean savedSharing = hasSavedSharing ? prefs.getBoolean(NezumiPrefs.SAVED_ONLINE_SHARING, true) : originalSharing;
                prefs.edit().putBoolean(NezumiPrefs.HIDE_ONLINE_STATUS, checked).apply();
                try {
                    if (checked) {
                        if (!hasSavedSharing) {
                            prefs.edit().putBoolean(NezumiPrefs.SAVED_ONLINE_SHARING, originalSharing).apply();
                        }
                        OnlineStatus.applyOriginalOnlineSharing(false);
                    } else {
                        OnlineStatus.applyOriginalOnlineSharing(savedSharing);
                        prefs.edit().remove(NezumiPrefs.SAVED_ONLINE_SHARING).apply();
                    }
                    OnlineStatus.publishOnlineState(103);
                } catch (LinkageError | RuntimeException failure) {
                    OnlineStatus.applyOriginalOnlineSharing(originalSharing);
                    prefs.edit().putBoolean(NezumiPrefs.HIDE_ONLINE_STATUS, !checked).apply();
                    button.setChecked(!checked);
                    Toast.makeText(context, vietnamese ? "Không thể cập nhật trạng thái kết nối" :
                        "Unable to update connection status", Toast.LENGTH_SHORT).show();
                }
            });
            onlineItem.setVisibility(OnlineStatus.isOnlinePatchAvailable() ? View.VISIBLE : View.GONE);
        }
        if ((features & FEATURE_REACTION) != 0) {
            ZaloUi.toggleRow(list, context, reactionLabel, "face_smile", prefs.getBoolean(NezumiPrefs.REACTION, true), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.REACTION, checked).apply());
        }
        if ((features & FEATURE_TYPING) != 0) {
            ZaloUi.toggleRow(list, context, typingLabel, "more_horizontal", prefs.getBoolean(NezumiPrefs.HIDE_TYPING, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_TYPING, checked).apply());
        }
        if ((features & FEATURE_READ_RECEIPTS) != 0) {
            ZaloUi.toggleRow(list, context, readLabel, "read_message", prefs.getBoolean(NezumiPrefs.HIDE_READ_RECEIPTS, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_READ_RECEIPTS, checked).apply());
        }
        if ((features & FEATURE_DELIVERY_RECEIPTS) != 0) {
            ZaloUi.toggleRow(list, context, deliveryLabel, "check_circle", prefs.getBoolean(NezumiPrefs.HIDE_DELIVERY_RECEIPTS, false),
                darkMode, (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_DELIVERY_RECEIPTS, checked).apply());
        }
        if ((features & FEATURE_RECALLED_MESSAGES) != 0) {
            ZaloUi.toggleRow(list, context, recalledMessagesLabel, "recall",
                prefs.getBoolean(NezumiPrefs.KEEP_RECALLED_MESSAGES, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.KEEP_RECALLED_MESSAGES, checked).apply());
        }
        if ((features & FEATURE_DISCOVERY) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Điều hướng" : "Navigation", darkMode);
            ZaloUi.toggleRow(list, context, discoveryLabel, "grid_view", prefs.getBoolean(NezumiPrefs.HIDE_DISCOVERY, true), darkMode,
                (button, checked) -> {
                if (prefs.getBoolean(NezumiPrefs.HIDE_DISCOVERY, true) == checked) return;
                prefs.edit().putBoolean(NezumiPrefs.HIDE_DISCOVERY, checked).apply();
                discoveryChanged[0] = true;
            });
        }
        if ((features & FEATURE_FEED_ADS) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Bảng tin" : "Feed", darkMode);
            ZaloUi.toggleRow(list, context, feedAdsLabel, "new_feed", prefs.getBoolean(NezumiPrefs.HIDE_FEED_ADS, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_FEED_ADS, checked).apply());
        }
        if ((features & (FEATURE_MEDIA_BOX | FEATURE_BUSINESS_BOX | FEATURE_OA_MESSAGES | FEATURE_MESSAGE_ADS)) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Hội thoại" : "Conversation", darkMode);
        }
        if ((features & FEATURE_MEDIA_BOX) != 0) {
            ZaloUi.toggleRow(list, context, mediaBoxLabel, "photo", prefs.getBoolean(NezumiPrefs.HIDE_MEDIA_BOX, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_MEDIA_BOX, checked).apply());
        }
        if ((features & FEATURE_BUSINESS_BOX) != 0) {
            ZaloUi.toggleRow(list, context, businessBoxLabel, "business_suite", prefs.getBoolean(NezumiPrefs.HIDE_BUSINESS_BOX, false),
                darkMode, (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_BUSINESS_BOX, checked).apply());
        }
        if ((features & FEATURE_OA_MESSAGES) != 0) {
            ZaloUi.toggleRow(list, context, oaMessagesLabel, "hide", prefs.getBoolean(NezumiPrefs.HIDE_OA_MESSAGES, true), darkMode,
                (button, checked) -> OfficialAccounts.setOAMessagesHidden(context, checked));
            ZaloUi.toggleRow(list, context, oaMuteLabel, "notif_off", prefs.getBoolean(NezumiPrefs.MUTE_OA_MESSAGES, true), darkMode,
                (button, checked) -> OfficialAccounts.setOAMessagesMuted(context, checked));
        }
        if ((features & FEATURE_MESSAGE_ADS) != 0) {
            ZaloUi.toggleRow(list, context, messageAdsLabel, "chat_block", prefs.getBoolean(NezumiPrefs.HIDE_MESSAGE_ADS, false),
                darkMode, (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_MESSAGE_ADS, checked).apply());
        }
        if ((features & FEATURE_CUSTOM_FONT) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Giao diện" : "Appearance", darkMode);
            String fontTitle = vietnamese ? "Phông chữ tùy chọn" : "Custom font";
            View fontItem = ZaloUi.row(context, fontTitle, ZaloUi.zdsIcon(context, "edit_text", darkMode), true, darkMode, null);
            TextView fontLabel = ZaloUi.rowTitle(fontItem);
            Runnable updateFontLabel = () -> fontLabel.setText(fontTitle + (CustomFont.isSelected(context)
                ? (vietnamese ? " (đã chọn)" : " (selected)") : ""));
            updateFontLabel.run();
            fontItem.setOnClickListener(view -> {
                if (!CustomFont.pick(context, updateFontLabel)) {
                    Toast.makeText(context, vietnamese ? "Không thể mở trình chọn phông chữ" : "Cannot open font picker",
                        Toast.LENGTH_SHORT).show();
                }
            });
            list.addView(fontItem);
            View resetFont = ZaloUi.row(context, vietnamese ? "Dùng phông chữ mặc định" : "Restore default font",
                ZaloUi.zdsIcon(context, "auto_counter_clockwise", darkMode), false, darkMode, null);
            resetFont.setOnClickListener(view -> {
                CustomFont.reset(context);
                updateFontLabel.run();
                Toast.makeText(context, vietnamese ? "Mở lại Zalo để cập nhật phông chữ"
                    : "Restart Zalo to refresh text", Toast.LENGTH_LONG).show();
            });
            list.addView(resetFont);
        }
        if ((features & FEATURE_CUSTOM_SOUNDS) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Âm thanh" : "Sounds", darkMode);
            addSoundRows(list, context, CustomSounds.NOTIFICATION, "notif",
                vietnamese ? "Âm báo tin nhắn" : "Notification sound", darkMode, vietnamese);
            addSoundRows(list, context, CustomSounds.RINGTONE, "call",
                vietnamese ? "Nhạc chuông cuộc gọi" : "Incoming-call ringtone", darkMode, vietnamese);
        }
        ZaloUi.trimGroupDividers(list);
        page.show();
        page.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private static void addSoundRows(LinearLayout list, Context context, String kind, String icon, String title,
            boolean darkMode, boolean vietnamese) {
        View item = ZaloUi.row(context, title, ZaloUi.zdsIcon(context, icon, darkMode), true, darkMode, null);
        TextView text = ZaloUi.rowTitle(item);
        Runnable update = () -> text.setText(title + (CustomSounds.isSelected(context, kind)
            ? (vietnamese ? " (đã chọn)" : " (selected)") : ""));
        update.run();
        item.setOnClickListener(view -> {
            if (!CustomSounds.pick(context, kind, update)) {
                Toast.makeText(context, vietnamese ? "Không thể mở trình chọn âm thanh"
                    : "Cannot open audio picker", Toast.LENGTH_SHORT).show();
            }
        });
        list.addView(item);
        View reset = ZaloUi.row(context, vietnamese ? "Khôi phục: " + title : "Restore: " + title,
            ZaloUi.zdsIcon(context, "auto_counter_clockwise", darkMode), false, darkMode, null);
        reset.setOnClickListener(view -> {
            CustomSounds.reset(context, kind);
            update.run();
        });
        list.addView(reset);
    }
}
