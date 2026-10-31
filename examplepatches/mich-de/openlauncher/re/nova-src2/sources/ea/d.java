package ea;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public enum d {
    IGNORE(-1),
    LAUNCHER_APP_LAUNCH_TAP(338),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_TASK_LAUNCH_TAP(339),
    LAUNCHER_NOTIFICATION_LAUNCH_TAP(516),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_TASK_LAUNCH_SWIPE_DOWN(340),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_TASK_DISMISS_SWIPE_UP(341),
    LAUNCHER_ITEM_DRAG_STARTED(383),
    LAUNCHER_ITEM_DROP_COMPLETED(385),
    LAUNCHER_ITEM_DROP_COMPLETED_ON_FOLDER_ICON(697),
    LAUNCHER_ITEM_DROP_FOLDER_CREATED(386),
    LAUNCHER_FOLDER_AUTO_LABELED(591),
    LAUNCHER_FOLDER_AUTO_LABELING_SKIPPED_EMPTY_PRIMARY(592),
    LAUNCHER_FOLDER_AUTO_LABELING_SKIPPED_EMPTY_SUGGESTIONS(593),
    LAUNCHER_FOLDER_LABEL_UPDATED(460),
    LAUNCHER_WORKSPACE_LONGPRESS(461),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(462),
    LAUNCHER_SETTINGS_BUTTON_TAP_OR_LONGPRESS(463),
    LAUNCHER_WIDGETSTRAY_BUTTON_TAP_OR_LONGPRESS(464),
    LAUNCHER_WIDGETSTRAY_APP_EXPANDED(818),
    LAUNCHER_WIDGETSTRAY_SEARCHED(819),
    LAUNCHER_ITEM_DROPPED_ON_REMOVE(465),
    LAUNCHER_ITEM_DROPPED_ON_CANCEL(466),
    LAUNCHER_ITEM_DROPPED_ON_DONT_SUGGEST(467),
    LAUNCHER_ITEM_DROPPED_ON_UNINSTALL(468),
    LAUNCHER_ITEM_UNINSTALL_COMPLETED(469),
    LAUNCHER_ITEM_UNINSTALL_CANCELLED(470),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(517),
    LAUNCHER_SYSTEM_SHORTCUT_WIDGETS_TAP(514),
    LAUNCHER_SYSTEM_SHORTCUT_APP_INFO_TAP(515),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(518),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(519),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(521),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(522),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(523),
    LAUNCHER_FOLDER_OPEN(551),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(479),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(480),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(481),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(482),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(552),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(553),
    LAUNCHER_ONSTOP(TTAdConstant.STYLE_SIZE_RADIO_9_16),
    LAUNCHER_ONRESUME(563),
    LAUNCHER_SWIPELEFT(564),
    LAUNCHER_SWIPERIGHT(565),
    LAUNCHER_UNKNOWN_SWIPEUP(566),
    LAUNCHER_UNKNOWN_SWIPEDOWN(567),
    LAUNCHER_ALLAPPS_OPEN_UP(568),
    LAUNCHER_ALLAPPS_CLOSE_DOWN(569),
    LAUNCHER_OVERVIEW_GESTURE(570),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(571),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(572),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(573),
    LAUNCHER_HOME_GESTURE(574),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(579),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(580),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(581),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(582),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(895),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(583),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(584),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(611),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(612),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(613),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(614),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(615),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(616),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(619),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(620),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(621),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(622),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(623),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(624),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(625),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(627),
    LAUNCHER_ADD_EXTERNAL_ITEM_START(641),
    LAUNCHER_ADD_EXTERNAL_ITEM_CANCELLED(642),
    LAUNCHER_ADD_EXTERNAL_ITEM_BACK(643),
    LAUNCHER_ADD_EXTERNAL_ITEM_PLACED_AUTOMATICALLY(644),
    LAUNCHER_ADD_EXTERNAL_ITEM_DRAGGED(645),
    LAUNCHER_FOLDER_CONVERTED_TO_ICON(646),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(647),
    LAUNCHER_UNDO(648),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(649),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(650),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(651),
    LAUNCHER_NOTIFICATION_DISMISSED(652),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(662),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(663),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(664),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(665),
    LAUNCHER_ALLAPPS_ENTRY(692),
    LAUNCHER_ALLAPPS_EXIT(693),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(694),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(695),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(696),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(Sdk.SDKError.Reason.DOH_FETCH_FAILED_VALUE),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(702),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(703),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(704),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(705),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(706),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(707),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(718),
    LAUNCHER_ALLAPPS_ITEM_LONG_PRESSED(719),
    LAUNCHER_ALLAPPS_ENTRY_WITH_DEVICE_SEARCH(720),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(721),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(722),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(724),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(725),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(764),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(765),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(766),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(767),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(768),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(769),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(770),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(771),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(772),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(773),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(774),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(775),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(776),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(777),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(778),
    LAUNCHER_WIDGET_RESIZE_STARTED(820),
    LAUNCHER_WIDGET_RESIZE_COMPLETED(824),
    LAUNCHER_WIDGET_RECONFIGURED(821),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_ENABLED(836),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_THEMED_ICON_DISABLED(837),
    LAUNCHER_TURN_ON_WORK_APPS_TAP(838),
    LAUNCHER_TURN_OFF_WORK_APPS_TAP(839),
    LAUNCHER_ITEM_DROP_FAILED_INSUFFICIENT_SPACE(872),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_TASKBAR_LONGPRESS_HIDE(896),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_TASKBAR_LONGPRESS_SHOW(897),
    /* JADX INFO: Fake field, exist only in values array */
    LAUNCHER_ALLAPPS_SEARCHINAPP_LAUNCH(913);


    /* renamed from: a, reason: collision with root package name */
    public final int f52450a;

    d(int i5) {
        this.f52450a = i5;
    }
}
