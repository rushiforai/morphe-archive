package defpackage;

import gen.model.TopicUpdateSchedule;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class epd {
    public static TopicUpdateSchedule a(int i) {
        switch (i) {
            case 1:
                return TopicUpdateSchedule.NEVER;
            case 2:
                return TopicUpdateSchedule.ONCE_DAILY_MORNING;
            case 3:
                return TopicUpdateSchedule.ONCE_DAILY_AFTERNOON;
            case 4:
                return TopicUpdateSchedule.ONCE_DAILY_EVENING;
            case 5:
                return TopicUpdateSchedule.TWICE_DAILY_MORNING_AFTERNOON_ONCE_DAILY_WEEKENDS;
            case 6:
                return TopicUpdateSchedule.TWICE_DAILY_AFTERNOON_EVENING_ONCE_DAILY_WEEKENDS;
            case 7:
                return TopicUpdateSchedule.THRICE_DAILY_ONCE_DAILY_WEEKENDS;
            case 8:
                return TopicUpdateSchedule.ONCE_WEEKLY_MONDAY;
            case 9:
                return TopicUpdateSchedule.ONCE_WEEKLY_WEDNESDAY;
            case 10:
                return TopicUpdateSchedule.ONCE_WEEKLY_FRIDAY;
            case 11:
                return TopicUpdateSchedule.TWICE_WEEKLY_MONDAY_WEDNESDAY;
            case 12:
                return TopicUpdateSchedule.TWICE_WEEKLY_TUESDAY_THURSDAY;
            case 13:
                return TopicUpdateSchedule.TWICE_DAILY_MORNING_AFTERNOON_ONCE_SATURDAY;
            case 14:
                return TopicUpdateSchedule.TWICE_DAILY_MORNING_AFTERNOON_ONCE_SUNDAY;
            case 15:
                return TopicUpdateSchedule.TWICE_DAILY_AFTERNOON_EVENING_ONCE_SATURDAY;
            case 16:
                return TopicUpdateSchedule.TWICE_DAILY_AFTERNOON_EVENING_ONCE_SUNDAY;
            case 17:
                return TopicUpdateSchedule.THRICE_DAILY_ONCE_SATURDAY;
            case 18:
                return TopicUpdateSchedule.THRICE_DAILY_ONCE_SUNDAY;
            case 19:
                return TopicUpdateSchedule.ONCE_WEEKLY_TUESDAY;
            case 20:
                return TopicUpdateSchedule.ONCE_WEEKLY_THURSDAY;
            default:
                return null;
        }
    }
}
