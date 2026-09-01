package com.medium.proto.event;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.l50;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0015\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017¨\u0006\u0018"}, d2 = {"Lcom/medium/proto/event/AppIconName;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "l50", "APP_ICON_NAME_BLACK", "APP_ICON_NAME_WHITE", "APP_ICON_NAME_WORDMARK", "APP_ICON_NAME_FRIEND_TIER", "APP_ICON_NAME_THROWBACK_2012", "APP_ICON_NAME_THROWBACK_2015", "APP_ICON_NAME_THROWBACK_2017", "APP_ICON_NAME_POSTAGE_PAID", "APP_ICON_NAME_DAILY_EDITION", "APP_ICON_NAME_PUBLISHER_MARK", "APP_ICON_NAME_PRIDE", "APP_ICON_NAME_WORDMARK_WHITE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AppIconName implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ AppIconName[] $VALUES;
    public static final ProtoAdapter<AppIconName> ADAPTER;
    public static final AppIconName APP_ICON_NAME_BLACK;
    public static final AppIconName APP_ICON_NAME_DAILY_EDITION;
    public static final AppIconName APP_ICON_NAME_FRIEND_TIER;
    public static final AppIconName APP_ICON_NAME_POSTAGE_PAID;
    public static final AppIconName APP_ICON_NAME_PRIDE;
    public static final AppIconName APP_ICON_NAME_PUBLISHER_MARK;
    public static final AppIconName APP_ICON_NAME_THROWBACK_2012;
    public static final AppIconName APP_ICON_NAME_THROWBACK_2015;
    public static final AppIconName APP_ICON_NAME_THROWBACK_2017;
    public static final AppIconName APP_ICON_NAME_WHITE;
    public static final AppIconName APP_ICON_NAME_WORDMARK;
    public static final AppIconName APP_ICON_NAME_WORDMARK_WHITE;
    public static final l50 Companion;
    private final int value;

    private static final /* synthetic */ AppIconName[] $values() {
        return new AppIconName[]{APP_ICON_NAME_BLACK, APP_ICON_NAME_WHITE, APP_ICON_NAME_WORDMARK, APP_ICON_NAME_FRIEND_TIER, APP_ICON_NAME_THROWBACK_2012, APP_ICON_NAME_THROWBACK_2015, APP_ICON_NAME_THROWBACK_2017, APP_ICON_NAME_POSTAGE_PAID, APP_ICON_NAME_DAILY_EDITION, APP_ICON_NAME_PUBLISHER_MARK, APP_ICON_NAME_PRIDE, APP_ICON_NAME_WORDMARK_WHITE};
    }

    static {
        AppIconName appIconName = new AppIconName("APP_ICON_NAME_BLACK", 0, 0);
        APP_ICON_NAME_BLACK = appIconName;
        APP_ICON_NAME_WHITE = new AppIconName("APP_ICON_NAME_WHITE", 1, 1);
        APP_ICON_NAME_WORDMARK = new AppIconName("APP_ICON_NAME_WORDMARK", 2, 2);
        APP_ICON_NAME_FRIEND_TIER = new AppIconName("APP_ICON_NAME_FRIEND_TIER", 3, 3);
        APP_ICON_NAME_THROWBACK_2012 = new AppIconName("APP_ICON_NAME_THROWBACK_2012", 4, 4);
        APP_ICON_NAME_THROWBACK_2015 = new AppIconName("APP_ICON_NAME_THROWBACK_2015", 5, 5);
        APP_ICON_NAME_THROWBACK_2017 = new AppIconName("APP_ICON_NAME_THROWBACK_2017", 6, 6);
        APP_ICON_NAME_POSTAGE_PAID = new AppIconName("APP_ICON_NAME_POSTAGE_PAID", 7, 7);
        APP_ICON_NAME_DAILY_EDITION = new AppIconName("APP_ICON_NAME_DAILY_EDITION", 8, 8);
        APP_ICON_NAME_PUBLISHER_MARK = new AppIconName("APP_ICON_NAME_PUBLISHER_MARK", 9, 9);
        APP_ICON_NAME_PRIDE = new AppIconName("APP_ICON_NAME_PRIDE", 10, 10);
        APP_ICON_NAME_WORDMARK_WHITE = new AppIconName("APP_ICON_NAME_WORDMARK_WHITE", 11, 11);
        AppIconName[] appIconNameArr$values = $values();
        $VALUES = appIconNameArr$values;
        $ENTRIES = new i04(appIconNameArr$values);
        Companion = new l50();
        ADAPTER = new AppIconName$Companion$ADAPTER$1(n1b.a.b(AppIconName.class), Syntax.PROTO_3, appIconName);
    }

    private AppIconName(String str, int i, int i2) {
        this.value = i2;
    }

    public static final AppIconName fromValue(int i) {
        Companion.getClass();
        return l50.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static AppIconName valueOf(String str) {
        return (AppIconName) Enum.valueOf(AppIconName.class, str);
    }

    public static AppIconName[] values() {
        return (AppIconName[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
