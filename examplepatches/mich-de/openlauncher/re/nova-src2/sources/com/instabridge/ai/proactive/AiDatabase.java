package com.instabridge.ai.proactive;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0007\b\u0001\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0016J \u0010\n\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\fH\u0016J\u0010\u0010\u000e\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0002J\u0010\u0010\u000f\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0002J\u0010\u0010\u0010\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0002J\u0010\u0010\u0011\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0002¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/proactive/AiDatabase;", "Landroid/database/sqlite/SQLiteOpenHelper;", "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "onCreate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "db", "Landroid/database/sqlite/SQLiteDatabase;", "onUpgrade", "oldVersion", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "newVersion", "createInsightsTable", "createEngagementTable", "createTriggeredQueriesTable", "createMetaLeadsTable", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiDatabase extends SQLiteOpenHelper {

    @NotNull
    public static final String COL_ENGAGEMENT_ID = "id";

    @NotNull
    public static final String COL_IMPRESSIONS = "impressions";

    @NotNull
    public static final String COL_INSIGHT_CAT = "cat";

    @NotNull
    public static final String COL_INSIGHT_EXPIRES_AT = "expires_at";

    @NotNull
    public static final String COL_INSIGHT_FETCHED_AT = "fetched_at";

    @NotNull
    public static final String COL_INSIGHT_ID = "id";

    @NotNull
    public static final String COL_INSIGHT_JSON = "json";

    @NotNull
    public static final String COL_INSIGHT_SCORE = "score";

    @NotNull
    public static final String COL_INSIGHT_VIEW_COUNT = "view_count";

    @NotNull
    public static final String COL_ML_FETCHED_AT = "fetched_at";

    @NotNull
    public static final String COL_ML_JSON = "json";

    @NotNull
    public static final String COL_TAPS = "taps";

    @NotNull
    public static final String COL_TQ_EXPIRES_AT = "expires_at";

    @NotNull
    public static final String COL_TQ_ID = "id";

    @NotNull
    public static final String COL_TQ_JSON = "json";

    @NotNull
    public static final String COL_TQ_TRIGGER_EVENT = "trigger_event";

    @NotNull
    public static final String COL_WINDOW_START = "window_start";

    @NotNull
    private static final String DATABASE_NAME = "instabridge_ai.db";
    private static final int DATABASE_VERSION = 2;

    @NotNull
    public static final String TABLE_ENGAGEMENT = "engagement";

    @NotNull
    public static final String TABLE_INSIGHTS = "insights";

    @NotNull
    public static final String TABLE_META_LEADS = "meta_query_leads";

    @NotNull
    public static final String TABLE_TRIGGERED_QUERIES = "triggered_queries";
    public static final int $stable = 8;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AiDatabase(@NotNull Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 2);
        Intrinsics.g(context, "context");
    }

    private final void createEngagementTable(SQLiteDatabase db2) throws SQLException {
        db2.execSQL("CREATE TABLE engagement (\n    id  INTEGER PRIMARY KEY,\n    impressions    INTEGER NOT NULL DEFAULT 0,\n    taps           INTEGER NOT NULL DEFAULT 0,\n    window_start   INTEGER NOT NULL DEFAULT 0\n)");
    }

    private final void createInsightsTable(SQLiteDatabase db2) throws SQLException {
        db2.execSQL("CREATE TABLE insights (\n    id         TEXT    PRIMARY KEY,\n    json       TEXT    NOT NULL,\n    fetched_at INTEGER NOT NULL,\n    expires_at INTEGER NOT NULL DEFAULT 0,\n    cat        INTEGER NOT NULL DEFAULT 0,\n    score      REAL    NOT NULL DEFAULT 0.5,\n    view_count INTEGER NOT NULL DEFAULT 0\n)");
    }

    private final void createMetaLeadsTable(SQLiteDatabase db2) throws SQLException {
        db2.execSQL("CREATE TABLE meta_query_leads (\n    fetched_at INTEGER PRIMARY KEY,\n    json       TEXT    NOT NULL\n)");
    }

    private final void createTriggeredQueriesTable(SQLiteDatabase db2) throws SQLException {
        db2.execSQL("CREATE TABLE triggered_queries (\n    id            TEXT    PRIMARY KEY,\n    json          TEXT    NOT NULL,\n    expires_at    INTEGER NOT NULL,\n    trigger_event TEXT    NOT NULL\n)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(@NotNull SQLiteDatabase db2) throws SQLException {
        Intrinsics.g(db2, "db");
        createInsightsTable(db2);
        createEngagementTable(db2);
        createTriggeredQueriesTable(db2);
        createMetaLeadsTable(db2);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(@NotNull SQLiteDatabase db2, int oldVersion, int newVersion) throws SQLException {
        Intrinsics.g(db2, "db");
        if (oldVersion < 2) {
            db2.execSQL("DROP TABLE IF EXISTS insights");
            createInsightsTable(db2);
            createTriggeredQueriesTable(db2);
            createMetaLeadsTable(db2);
        }
    }
}
