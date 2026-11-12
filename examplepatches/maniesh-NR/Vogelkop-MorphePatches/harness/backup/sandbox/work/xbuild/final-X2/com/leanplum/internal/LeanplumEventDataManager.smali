.class public Lcom/leanplum/internal/LeanplumEventDataManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;
    }
.end annotation


# static fields
.field private static final COLUMN_DATA:Ljava/lang/String; = "data"

.field private static final DATABASE_NAME:Ljava/lang/String; = "__leanplum.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final EVENT_TABLE_NAME:Ljava/lang/String; = "event"

.field private static final KEY_ROWID:Ljava/lang/String; = "rowid"

.field private static instance:Lcom/leanplum/internal/LeanplumEventDataManager;


# instance fields
.field private contentValues:Landroid/content/ContentValues;

.field private database:Landroid/database/sqlite/SQLiteDatabase;

.field private databaseManager:Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;

.field private hasDatabaseError:Z


# direct methods
.method private constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->contentValues:Landroid/content/ContentValues;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z

    :try_start_d
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_14

    return-void

    :cond_14
    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->databaseManager:Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;

    if-nez v0, :cond_23

    new-instance v0, Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->databaseManager:Lcom/leanplum/internal/LeanplumEventDataManager$LeanplumDataBaseManager;

    :cond_23
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_29
    .catchall {:try_start_d .. :try_end_29} :catchall_2a

    return-void

    :catchall_2a
    move-exception v0

    const-string v1, "Cannot create database."

    invoke-direct {p0, v1, v0}, Lcom/leanplum/internal/LeanplumEventDataManager;->handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3

    invoke-static {p1, p2}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-boolean p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z

    if-nez p1, :cond_d

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z

    invoke-static {p2}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_d
    return-void
.end method

.method public static sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/LeanplumEventDataManager;->instance:Lcom/leanplum/internal/LeanplumEventDataManager;

    if-nez v0, :cond_b

    new-instance v0, Lcom/leanplum/internal/LeanplumEventDataManager;

    invoke-direct {v0}, Lcom/leanplum/internal/LeanplumEventDataManager;-><init>()V

    sput-object v0, Lcom/leanplum/internal/LeanplumEventDataManager;->instance:Lcom/leanplum/internal/LeanplumEventDataManager;

    :cond_b
    return-object v0
.end method


# virtual methods
.method public deleteEvents(I)V
    .registers 6

    const-string v0, "rowid in (select rowid from event ORDER BY rowid ASC LIMIT "

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v1, :cond_7

    return-void

    :cond_7
    :try_start_7
    const-string v2, "event"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {v1, v2, p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z
    :try_end_21
    .catchall {:try_start_7 .. :try_end_21} :catchall_22

    return-void

    :catchall_22
    move-exception p1

    const-string v0, "Unable to delete events from the table."

    invoke-direct {p0, v0, p1}, Lcom/leanplum/internal/LeanplumEventDataManager;->handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getEvents(I)Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const-string v0, "data"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_4e

    const/4 v11, 0x0

    :try_start_c
    const-string v3, "event"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v4

    const-string v9, "rowid ASC"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z

    :goto_23
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-eqz p1, :cond_3e

    new-instance p1, Lorg/json/JSONObject;

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3d
    .catchall {:try_start_c .. :try_end_3d} :catchall_42

    goto :goto_23

    :cond_3e
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    return-object v1

    :catchall_42
    move-exception v0

    move-object p1, v0

    :try_start_44
    const-string v0, "Unable to get events from the table."

    invoke-direct {p0, v0, p1}, Lcom/leanplum/internal/LeanplumEventDataManager;->handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_49
    .catchall {:try_start_44 .. :try_end_49} :catchall_4f

    if-eqz v11, :cond_4e

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_4e
    return-object v1

    :catchall_4f
    move-exception v0

    move-object p0, v0

    if-eqz v11, :cond_56

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_56
    throw p0
.end method

.method public getEventsCount()J
    .registers 5

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-wide/16 v1, 0x0

    if-nez v0, :cond_7

    return-wide v1

    :cond_7
    :try_start_7
    const-string v3, "event"

    invoke-static {v0, v3}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_11

    return-wide v1

    :catchall_11
    move-exception v0

    const-string v3, "Unable to get a number of rows in the table."

    invoke-direct {p0, v3, v0}, Lcom/leanplum/internal/LeanplumEventDataManager;->handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-wide v1
.end method

.method public hasDatabaseError()Z
    .registers 1

    iget-boolean p0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z

    return p0
.end method

.method public insertEvent(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->contentValues:Landroid/content/ContentValues;

    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_c
    iget-object p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "event"

    iget-object v1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->contentValues:Landroid/content/ContentValues;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError:Z
    :try_end_19
    .catchall {:try_start_c .. :try_end_19} :catchall_1a

    goto :goto_20

    :catchall_1a
    move-exception p1

    const-string v0, "Unable to insert event to database."

    invoke-direct {p0, v0, p1}, Lcom/leanplum/internal/LeanplumEventDataManager;->handleSQLiteError(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_20
    iget-object p0, p0, Lcom/leanplum/internal/LeanplumEventDataManager;->contentValues:Landroid/content/ContentValues;

    invoke-virtual {p0}, Landroid/content/ContentValues;->clear()V

    return-void
.end method
