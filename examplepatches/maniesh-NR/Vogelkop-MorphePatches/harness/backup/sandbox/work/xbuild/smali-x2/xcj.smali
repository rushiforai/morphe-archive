.class public final Lxcj;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x3

    const-string v2, "share_target.db"

    invoke-direct {p0, p1, v2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxcj;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final h()Landroid/database/sqlite/SQLiteDatabase;
    .registers 4

    iget-object v0, p0, Lxcj;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lxcj;->b:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v1, :cond_9

    monitor-exit v0

    return-object v1

    :cond_9
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lxcj;->b:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->setLocale(Ljava/util/Locale;)V

    iget-object p0, p0, Lxcj;->b:Landroid/database/sqlite/SQLiteDatabase;

    monitor-exit v0

    return-object p0

    :goto_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1a

    throw p0

    :catchall_1a
    move-exception p0

    goto :goto_18
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 2

    const-string p0, "CREATE TABLE targets (target TEXT PRIMARY KEY, priority DOUBLE NOT NULL,time LONG NOT NULL,version LONG NOT NULL)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 4

    const/4 p0, 0x2

    if-ge p2, p0, :cond_8

    const-string p0, "ALTER TABLE targets ADD COLUMN time LONG DEFAULT 0;"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_8
    const/4 p0, 0x3

    if-ge p2, p0, :cond_10

    const-string p0, "ALTER TABLE targets ADD COLUMN version LONG DEFAULT 2;"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_10
    return-void
.end method
