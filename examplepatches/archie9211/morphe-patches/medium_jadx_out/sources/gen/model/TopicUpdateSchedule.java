package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.epd;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u001d\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001f¨\u0006 "}, d2 = {"Lgen/model/TopicUpdateSchedule;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "epd", "NEVER", "ONCE_DAILY_MORNING", "ONCE_DAILY_AFTERNOON", "ONCE_DAILY_EVENING", "TWICE_DAILY_MORNING_AFTERNOON_ONCE_DAILY_WEEKENDS", "TWICE_DAILY_MORNING_AFTERNOON_ONCE_SATURDAY", "TWICE_DAILY_MORNING_AFTERNOON_ONCE_SUNDAY", "TWICE_DAILY_AFTERNOON_EVENING_ONCE_DAILY_WEEKENDS", "TWICE_DAILY_AFTERNOON_EVENING_ONCE_SATURDAY", "TWICE_DAILY_AFTERNOON_EVENING_ONCE_SUNDAY", "THRICE_DAILY_ONCE_DAILY_WEEKENDS", "THRICE_DAILY_ONCE_SATURDAY", "THRICE_DAILY_ONCE_SUNDAY", "ONCE_WEEKLY_MONDAY", "ONCE_WEEKLY_TUESDAY", "ONCE_WEEKLY_WEDNESDAY", "ONCE_WEEKLY_THURSDAY", "ONCE_WEEKLY_FRIDAY", "TWICE_WEEKLY_MONDAY_WEDNESDAY", "TWICE_WEEKLY_TUESDAY_THURSDAY", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class TopicUpdateSchedule implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ TopicUpdateSchedule[] $VALUES;
    public static final ProtoAdapter<TopicUpdateSchedule> ADAPTER;
    public static final epd Companion;
    private final int value;
    public static final TopicUpdateSchedule NEVER = new TopicUpdateSchedule("NEVER", 0, 1);
    public static final TopicUpdateSchedule ONCE_DAILY_MORNING = new TopicUpdateSchedule("ONCE_DAILY_MORNING", 1, 2);
    public static final TopicUpdateSchedule ONCE_DAILY_AFTERNOON = new TopicUpdateSchedule("ONCE_DAILY_AFTERNOON", 2, 3);
    public static final TopicUpdateSchedule ONCE_DAILY_EVENING = new TopicUpdateSchedule("ONCE_DAILY_EVENING", 3, 4);
    public static final TopicUpdateSchedule TWICE_DAILY_MORNING_AFTERNOON_ONCE_DAILY_WEEKENDS = new TopicUpdateSchedule("TWICE_DAILY_MORNING_AFTERNOON_ONCE_DAILY_WEEKENDS", 4, 5);
    public static final TopicUpdateSchedule TWICE_DAILY_MORNING_AFTERNOON_ONCE_SATURDAY = new TopicUpdateSchedule("TWICE_DAILY_MORNING_AFTERNOON_ONCE_SATURDAY", 5, 13);
    public static final TopicUpdateSchedule TWICE_DAILY_MORNING_AFTERNOON_ONCE_SUNDAY = new TopicUpdateSchedule("TWICE_DAILY_MORNING_AFTERNOON_ONCE_SUNDAY", 6, 14);
    public static final TopicUpdateSchedule TWICE_DAILY_AFTERNOON_EVENING_ONCE_DAILY_WEEKENDS = new TopicUpdateSchedule("TWICE_DAILY_AFTERNOON_EVENING_ONCE_DAILY_WEEKENDS", 7, 6);
    public static final TopicUpdateSchedule TWICE_DAILY_AFTERNOON_EVENING_ONCE_SATURDAY = new TopicUpdateSchedule("TWICE_DAILY_AFTERNOON_EVENING_ONCE_SATURDAY", 8, 15);
    public static final TopicUpdateSchedule TWICE_DAILY_AFTERNOON_EVENING_ONCE_SUNDAY = new TopicUpdateSchedule("TWICE_DAILY_AFTERNOON_EVENING_ONCE_SUNDAY", 9, 16);
    public static final TopicUpdateSchedule THRICE_DAILY_ONCE_DAILY_WEEKENDS = new TopicUpdateSchedule("THRICE_DAILY_ONCE_DAILY_WEEKENDS", 10, 7);
    public static final TopicUpdateSchedule THRICE_DAILY_ONCE_SATURDAY = new TopicUpdateSchedule("THRICE_DAILY_ONCE_SATURDAY", 11, 17);
    public static final TopicUpdateSchedule THRICE_DAILY_ONCE_SUNDAY = new TopicUpdateSchedule("THRICE_DAILY_ONCE_SUNDAY", 12, 18);
    public static final TopicUpdateSchedule ONCE_WEEKLY_MONDAY = new TopicUpdateSchedule("ONCE_WEEKLY_MONDAY", 13, 8);
    public static final TopicUpdateSchedule ONCE_WEEKLY_TUESDAY = new TopicUpdateSchedule("ONCE_WEEKLY_TUESDAY", 14, 19);
    public static final TopicUpdateSchedule ONCE_WEEKLY_WEDNESDAY = new TopicUpdateSchedule("ONCE_WEEKLY_WEDNESDAY", 15, 9);
    public static final TopicUpdateSchedule ONCE_WEEKLY_THURSDAY = new TopicUpdateSchedule("ONCE_WEEKLY_THURSDAY", 16, 20);
    public static final TopicUpdateSchedule ONCE_WEEKLY_FRIDAY = new TopicUpdateSchedule("ONCE_WEEKLY_FRIDAY", 17, 10);
    public static final TopicUpdateSchedule TWICE_WEEKLY_MONDAY_WEDNESDAY = new TopicUpdateSchedule("TWICE_WEEKLY_MONDAY_WEDNESDAY", 18, 11);
    public static final TopicUpdateSchedule TWICE_WEEKLY_TUESDAY_THURSDAY = new TopicUpdateSchedule("TWICE_WEEKLY_TUESDAY_THURSDAY", 19, 12);

    private static final /* synthetic */ TopicUpdateSchedule[] $values() {
        return new TopicUpdateSchedule[]{NEVER, ONCE_DAILY_MORNING, ONCE_DAILY_AFTERNOON, ONCE_DAILY_EVENING, TWICE_DAILY_MORNING_AFTERNOON_ONCE_DAILY_WEEKENDS, TWICE_DAILY_MORNING_AFTERNOON_ONCE_SATURDAY, TWICE_DAILY_MORNING_AFTERNOON_ONCE_SUNDAY, TWICE_DAILY_AFTERNOON_EVENING_ONCE_DAILY_WEEKENDS, TWICE_DAILY_AFTERNOON_EVENING_ONCE_SATURDAY, TWICE_DAILY_AFTERNOON_EVENING_ONCE_SUNDAY, THRICE_DAILY_ONCE_DAILY_WEEKENDS, THRICE_DAILY_ONCE_SATURDAY, THRICE_DAILY_ONCE_SUNDAY, ONCE_WEEKLY_MONDAY, ONCE_WEEKLY_TUESDAY, ONCE_WEEKLY_WEDNESDAY, ONCE_WEEKLY_THURSDAY, ONCE_WEEKLY_FRIDAY, TWICE_WEEKLY_MONDAY_WEDNESDAY, TWICE_WEEKLY_TUESDAY_THURSDAY};
    }

    static {
        TopicUpdateSchedule[] topicUpdateScheduleArr$values = $values();
        $VALUES = topicUpdateScheduleArr$values;
        $ENTRIES = new i04(topicUpdateScheduleArr$values);
        Companion = new epd();
        ADAPTER = new TopicUpdateSchedule$Companion$ADAPTER$1(n1b.a.b(TopicUpdateSchedule.class), Syntax.PROTO_2, null);
    }

    private TopicUpdateSchedule(String str, int i, int i2) {
        this.value = i2;
    }

    public static final TopicUpdateSchedule fromValue(int i) {
        Companion.getClass();
        return epd.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static TopicUpdateSchedule valueOf(String str) {
        return (TopicUpdateSchedule) Enum.valueOf(TopicUpdateSchedule.class, str);
    }

    public static TopicUpdateSchedule[] values() {
        return (TopicUpdateSchedule[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
