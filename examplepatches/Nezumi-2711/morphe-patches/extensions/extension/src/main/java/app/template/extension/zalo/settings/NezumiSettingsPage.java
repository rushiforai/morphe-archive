package app.template.extension.zalo.settings;

import android.app.Dialog;
import android.app.Notification;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Map;

import app.template.extension.zalo.appearance.CustomFont;
import app.template.extension.zalo.buglog.BugLogExport;
import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.call.CallRecorder;
import app.template.extension.zalo.chat.OnlineStatus;
import app.template.extension.zalo.messages.MessagesTab;
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

    static final int FEATURE_CALL_RECORDING = 1 << 14;

    static final int FEATURE_CONVERSATION_PROTECTION = 1 << 15;

    static final int FEATURE_BUG_LOG = 1 << 16;

    static final int FEATURE_CALL_BACKGROUND = 1 << 17;

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
        boolean vietnamese = ZaloEnv.isVietnamese(Patch.CORE, context);
        int features = state.features;
        boolean hasChatFeatures = (features & (FEATURE_ONLINE_STATUS | FEATURE_REACTION |
            FEATURE_TYPING | FEATURE_READ_RECEIPTS | FEATURE_DELIVERY_RECEIPTS |
            FEATURE_RECALLED_MESSAGES | FEATURE_CONVERSATION_PROTECTION)) != 0;
        String reactionLabel = vietnamese ? "Mở khóa biểu tượng cảm xúc" : "Unlock reaction icons";
        String typingLabel = vietnamese ? "Ẩn trạng thái đang nhập" : "Hide typing status";
        String readLabel = vietnamese ? "Ẩn trạng thái đã xem" : "Hide read receipts";
        String markAsReadLabel = vietnamese ? "Hiện nút Đánh dấu đã xem" : "Show Mark as read button";
        String deliveryLabel = vietnamese ? "Ẩn trạng thái đã nhận" : "Hide delivery receipts";
        String protectionLabel = vietnamese ? "Gỡ giới hạn hội thoại được bảo vệ" : "Bypass conversation protection";
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
        if ((features & FEATURE_CUSTOM_FONT) != 0) CustomFont.trackForRestart(context);
        Map<String, Object> restartSnapshot = RestartPrompt.snapshot();
        Dialog page = ZaloUi.page(context, "Nezumi's Settings", darkMode);
        boolean[] discoveryChanged = { false };
        page.setOnDismissListener(dialog -> {
            Runnable rebuildTabs = () -> {
                if (discoveryChanged[0]) DiscoveryTab.recreateAfterChange(context);
            };
            if (RestartPrompt.changedSince(restartSnapshot)) RestartPrompt.ask(context, darkMode, rebuildTabs);
            else rebuildTabs.run();
        });
        LinearLayout list = page.findViewById(android.R.id.content).findViewWithTag("nezumi-list");
        if (RestartPrompt.anyPending()) {
            list.addView(ZaloUi.banner(context,
                vietnamese ? "Một số thay đổi cần khởi động lại Zalo để áp dụng." : "Some changes need a Zalo restart to apply.",
                vietnamese ? "Khởi động lại" : "Restart", darkMode, () -> RestartPrompt.restart(context)));
        }
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
                    NezumiLog.e(Patch.VIEW_ONLINE_STATUS_PRIVATELY, "NezumiSettingsPage", "online status toggle failed, reverted", failure);
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
            LinearLayout readGroup = ZaloUi.linkedRows(list, context, darkMode);
            View[] markAsReadItem = { null };
            ZaloUi.toggleRow(readGroup, context, readLabel, "read_message", prefs.getBoolean(NezumiPrefs.HIDE_READ_RECEIPTS, false), darkMode,
                (button, checked) -> {
                prefs.edit().putBoolean(NezumiPrefs.HIDE_READ_RECEIPTS, checked).apply();
                if (markAsReadItem[0] != null) ZaloUi.setChildRowVisible(list, markAsReadItem[0], checked, true);
            });
            markAsReadItem[0] = ZaloUi.toggleRow(readGroup, context, markAsReadLabel, "bubble_multiselect",
                prefs.getBoolean(NezumiPrefs.SHOW_MARK_AS_READ_BUTTON, true), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.SHOW_MARK_AS_READ_BUTTON, checked).apply());
            markAsReadItem[0].setVisibility(prefs.getBoolean(NezumiPrefs.HIDE_READ_RECEIPTS, false) ? View.VISIBLE : View.GONE);
        }
        if ((features & FEATURE_DELIVERY_RECEIPTS) != 0) {
            ZaloUi.toggleRow(list, context, deliveryLabel, "check_circle", prefs.getBoolean(NezumiPrefs.HIDE_DELIVERY_RECEIPTS, false),
                darkMode, (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.HIDE_DELIVERY_RECEIPTS, checked).apply());
        }
        if ((features & FEATURE_CONVERSATION_PROTECTION) != 0) {
            ZaloUi.toggleRow(list, context, protectionLabel, "shield", prefs.getBoolean(NezumiPrefs.BYPASS_CONVERSATION_PROTECTION, true), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.BYPASS_CONVERSATION_PROTECTION, checked).apply());
        }
        if ((features & FEATURE_RECALLED_MESSAGES) != 0) {
            ZaloUi.toggleRow(list, context, recalledMessagesLabel, "recall",
                prefs.getBoolean(NezumiPrefs.KEEP_RECALLED_MESSAGES, false), darkMode,
                (button, checked) -> {
                prefs.edit().putBoolean(NezumiPrefs.KEEP_RECALLED_MESSAGES, checked).apply();
                NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "NezumiSettingsPage", "setting keep_recalled_messages=" + checked);
            });
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
                (button, checked) -> {
                prefs.edit().putBoolean(NezumiPrefs.HIDE_MEDIA_BOX, checked).apply();
                MessagesTab.refreshList(Patch.HIDE_MEDIA_BOX_IN_MESSAGES);
            });
        }
        if ((features & FEATURE_BUSINESS_BOX) != 0) {
            ZaloUi.toggleRow(list, context, businessBoxLabel, "business_suite", prefs.getBoolean(NezumiPrefs.HIDE_BUSINESS_BOX, false),
                darkMode, (button, checked) -> {
                prefs.edit().putBoolean(NezumiPrefs.HIDE_BUSINESS_BOX, checked).apply();
                MessagesTab.refreshList(Patch.HIDE_BUSINESS_BOX_IN_MESSAGES);
            });
        }
        if ((features & FEATURE_OA_MESSAGES) != 0) {
            ZaloUi.toggleRow(list, context, oaMessagesLabel, "hide", prefs.getBoolean(NezumiPrefs.HIDE_OA_MESSAGES, true), darkMode,
                (button, checked) -> OfficialAccounts.setOAMessagesHidden(context, checked));
            ZaloUi.toggleRow(list, context, oaMuteLabel, "notif_off", prefs.getBoolean(NezumiPrefs.MUTE_OA_MESSAGES, true), darkMode,
                (button, checked) -> OfficialAccounts.setOAMessagesMuted(context, checked));
        }
        if ((features & FEATURE_MESSAGE_ADS) != 0) {
            ZaloUi.toggleRow(list, context, messageAdsLabel, "chat_block", prefs.getBoolean(NezumiPrefs.HIDE_MESSAGE_ADS, false),
                darkMode, (button, checked) -> {
                prefs.edit().putBoolean(NezumiPrefs.HIDE_MESSAGE_ADS, checked).apply();
                MessagesTab.refreshList(Patch.HIDE_ADS_IN_MESSAGES);
            });
        }
        if ((features & FEATURE_CUSTOM_FONT) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Giao diện" : "Appearance", darkMode);
            String fontTitle = vietnamese ? "Phông chữ tùy chọn" : "Custom font";
            View fontItem = ZaloUi.row(context, fontTitle, ZaloUi.zdsIcon(context, "edit_text", darkMode), true, darkMode, null);
            TextView fontLabel = ZaloUi.rowTitle(fontItem);
            Runnable updateFontLabel = () -> {
                String label = fontTitle + (CustomFont.isSelected(context) ? (vietnamese ? " (đã chọn)" : " (selected)") : "");
                boolean pending = RestartPrompt.isPending(CustomFont.FONT);
                String note = pending ? (vietnamese ? "Đang chờ khởi động lại" : "Waiting for restart")
                    : (vietnamese ? "Cần khởi động lại để áp dụng" : "Restart required to apply");
                addRowNote(fontLabel, label, note, pending ? (darkMode ? 0xFF3D8BFF : 0xFF0068FF)
                    : (darkMode ? 0xFFA3A9B1 : 0xFF6B7280));
            };
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
        if ((features & (FEATURE_CALL_RECORDING | FEATURE_CALL_BACKGROUND)) != 0) {
            ZaloUi.addGroup(list, context, vietnamese ? "Cuộc gọi" : "Calls", darkMode);
        }
        if ((features & FEATURE_CALL_RECORDING) != 0) {
            ZaloUi.toggleRow(list, context, vietnamese ? "Hiện nút ghi âm" : "Show record button", "call",
                prefs.getBoolean(NezumiPrefs.CALL_RECORDING, true), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.CALL_RECORDING, checked).apply());
            View folder = ZaloUi.row(context, vietnamese ? "Mở thư mục bản ghi" : "Open recordings folder",
                ZaloUi.zdsIcon(context, "grid_view", darkMode), true, darkMode, null);
            folder.setOnClickListener(view -> CallRecorder.openFolder(context));
            list.addView(folder);
        }
        if ((features & FEATURE_CALL_BACKGROUND) != 0) {
            String callBackgroundLabel = vietnamese ? "Nền đen cho màn hình cuộc gọi" : "True-black call screen";
            String callBackgroundNote = vietnamese ? "Chỉ áp dụng khi dùng giao diện tối" : "Dark theme only";
            View callBackground = ZaloUi.toggleRow(list, context, callBackgroundLabel, "call",
                prefs.getBoolean(NezumiPrefs.TRUE_BLACK_CALL_SCREEN, false), darkMode,
                (button, checked) -> prefs.edit().putBoolean(NezumiPrefs.TRUE_BLACK_CALL_SCREEN, checked).apply());
            addRowNote(ZaloUi.rowTitle(callBackground), callBackgroundLabel, callBackgroundNote);
        }
        if ((features & FEATURE_BUG_LOG) != 0 && NezumiLog.isAvailable()) {
            addBugLogRows(list, context, darkMode, vietnamese);
        }
        ZaloUi.trimGroupDividers(list);
        page.show();
        page.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private static void addBugLogRows(LinearLayout list, Context context, boolean darkMode, boolean vietnamese) {
        ZaloUi.addGroup(list, context, vietnamese ? "Gỡ lỗi" : "Debugging", darkMode);
        String detailedLabel = vietnamese ? "Ghi log chi tiết" : "Detailed logging";
        String detailedNote = vietnamese ? "Lỗi và sự cố luôn được ghi lại" : "Errors and crashes are always recorded";
        View detailed = ZaloUi.toggleRow(list, context, detailedLabel, "warning",
            NezumiLog.isDetailed(), darkMode, (button, checked) -> {
                if (NezumiLog.isDetailed() == checked) return;
                NezumiLog.setDetailed(context, checked);
            });
        addRowNote(ZaloUi.rowTitle(detailed), detailedLabel, detailedNote);
        String offLabel = vietnamese ? "Tắt hoàn toàn log lỗi" : "Turn off bug log completely";
        String offNote = vietnamese ? "Không ghi lại gì, kể cả sự cố" : "Nothing is recorded, not even crashes";
        View off = ZaloUi.toggleRow(list, context, offLabel, "hide",
            NezumiLog.isOff(), darkMode, (button, checked) -> {
                if (NezumiLog.isOff() == checked) return;
                NezumiLog.setOff(context, checked);
            });
        addRowNote(ZaloUi.rowTitle(off), offLabel, offNote);
        String exportTitle = vietnamese ? "Xuất log" : "Export log";
        View export = ZaloUi.row(context, exportTitle, ZaloUi.zdsIcon(context, "download", darkMode), true, darkMode, null);
        TextView exportLabel = ZaloUi.rowTitle(export);
        Runnable updateSize = () -> exportLabel.setText(exportTitle + " (" + formatSize(BugLogExport.totalBytes(context)) + ")");
        updateSize.run();
        export.setOnClickListener(view -> {
            export.setEnabled(false);
            BugLogExport.export(context, path -> {
                export.setEnabled(true);
                String message = path != null
                    ? (vietnamese ? "Đã lưu log tại: " : "Log saved to: ") + path
                    : (vietnamese ? "Không thể xuất log" : "Unable to export log");
                Toast.makeText(context, message, Toast.LENGTH_LONG).show();
            });
        });
        list.addView(export);
        View clear = ZaloUi.row(context, vietnamese ? "Xóa log" : "Clear log",
            ZaloUi.zdsIcon(context, "delete", darkMode), false, darkMode, null);
        clear.setOnClickListener(view -> {
            BugLogExport.clear(context);
            updateSize.run();
            Toast.makeText(context, vietnamese ? "Đã xóa log" : "Log cleared", Toast.LENGTH_SHORT).show();
        });
        list.addView(clear);
    }

    /** Shows {@code note} as a smaller second line under a row title. */
    private static void addRowNote(TextView title, String label, String note) {
        addRowNote(title, label, note, 0);
    }

    /** As above, with the note drawn in {@code noteColor} (0 keeps the title colour). */
    private static void addRowNote(TextView title, String label, String note, int noteColor) {
        SpannableString text = new SpannableString(label + "\n" + note);
        text.setSpan(new RelativeSizeSpan(0.8f), label.length() + 1, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (noteColor != 0) {
            text.setSpan(new ForegroundColorSpan(noteColor), label.length() + 1, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        title.setSingleLine(false);
        title.setMaxLines(2);
        title.setText(text);
    }

    private static String formatSize(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return (bytes / 1024) + " KB";
        return String.format(java.util.Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
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
