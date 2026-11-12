.class public final Ljlh;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"


# static fields
.field public static final b:[Ljava/lang/String;


# instance fields
.field public final synthetic a:B


# direct methods
.method static constructor <clinit>()V
    .registers 10

    const-string v8, "content_mime_type"

    const-string v9, "visit_count"

    const-string v0, "id"

    const-string v1, "url"

    const-string v2, "title"

    const-string v3, "content_path"

    const-string v4, "timestamp"

    const-string v5, "image_path"

    const-string v6, "transcoded"

    const-string v7, "filesize"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljlh;->b:[Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;IB)V
    .registers 6

    iput-byte p5, p0, Ljlh;->a:B

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method private final l(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 4

    return-void
.end method


# virtual methods
.method public final h(Ljava/util/Collection;Z)Ljava/util/ArrayList;
    .registers 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string p0, "image_path"

    const-string v2, "content_path"

    filled-new-array {p0, v2}, [Ljava/lang/String;

    move-result-object v3

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "id in ("

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Lr40;

    const/4 v4, 0x3

    const-string v5, ","

    invoke-direct {v2, v5, v4}, Lr40;-><init>(Ljava/lang/String;B)V

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v2, p1}, Lr40;->b(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 p0, 0x0

    :try_start_33
    const-string v2, "reading"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_67

    :cond_43
    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_51

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_51
    if-eqz p2, :cond_61

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_61

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_61
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1
    :try_end_65
    .catchall {:try_start_33 .. :try_end_65} :catchall_6b

    if-nez p1, :cond_43

    :cond_67
    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v0

    :catchall_6b
    move-exception v0

    move-object p1, v0

    invoke-static {p0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p1
.end method

.method public final k(Ljava/lang/String;)Ljava/lang/Long;
    .registers 11

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string p0, "id"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v2

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    const/4 p0, 0x0

    :try_start_f
    const-string v1, "reading"

    const-string v3, "url=?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1a
    .catchall {:try_start_f .. :try_end_1a} :catchall_30

    :try_start_1a
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_29

    const/4 p0, 0x0

    invoke-interface {p1, p0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0
    :try_end_29
    .catchall {:try_start_1a .. :try_end_29} :catchall_2d

    :cond_29
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p0

    :catchall_2d
    move-exception v0

    move-object p0, v0

    goto :goto_35

    :catchall_30
    move-exception v0

    move-object p1, v0

    move-object v8, p1

    move-object p1, p0

    move-object p0, v8

    :goto_35
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final m()Ljava/util/ArrayList;
    .registers 11

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 p0, 0x0

    :try_start_5
    new-instance v9, Lhlh;

    const-string v1, "reading"

    sget-object v2, Ljlh;->b:[Ljava/lang/String;

    const-string v7, "id DESC"

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {v9, v0}, Lhlh;-><init>(Landroid/database/Cursor;)V
    :try_end_19
    .catchall {:try_start_5 .. :try_end_19} :catchall_3e

    :try_start_19
    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_23
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_37

    invoke-interface {v0, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    new-instance v2, Lilh;

    invoke-direct {v2, v9}, Lilh;-><init>(Lhlh;)V

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catchall {:try_start_19 .. :try_end_34} :catchall_3b

    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    :cond_37
    invoke-static {v9}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p0

    :catchall_3b
    move-exception v0

    :goto_3c
    move-object p0, v0

    goto :goto_41

    :catchall_3e
    move-exception v0

    move-object v9, p0

    goto :goto_3c

    :goto_41
    invoke-static {v9}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3

    iget-byte v0, p0, Ljlh;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void

    :pswitch_9
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 8

    iget-byte p0, p0, Ljlh;->a:B

    packed-switch p0, :pswitch_data_6a

    const-string p0, "CREATE TABLE icons (id INTEGER PRIMARY KEY AUTOINCREMENT,origin TEXT UNIQUE)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    sget-object p0, Lmnj;->e:Lh58;

    invoke-static {p0, p0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lw4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-virtual {p0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnj;

    sget v1, Lvnj;->j:I

    invoke-static {v0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v0

    const-string v3, " (icon INTEGER,"

    const-string v4, " INTEGER NOT NULL,PRIMARY KEY (icon, "

    const-string v5, "CREATE TABLE "

    invoke-static {v5, v1, v3, v2, v4}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "),FOREIGN KEY(icon) REFERENCES icons(id) ON DELETE CASCADE)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_10

    :cond_44
    return-void

    :pswitch_45
    const-string p0, "CREATE TABLE articles (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, article_id TEXT NOT NULL, secondary_id TEXT, title TEXT NOT NULL, type TEXT NOT NULL, summary TEXT, original_img_url TEXT, insta_url TEXT, page_url TEXT, source_url TEXT, source_name TEXT, date_time INTEGER, request_id TEXT, more_id TEXT, hot_topic_id TEXT, category TEXT, recommend_type TEXT, infra_feedback TEXT, related_original_news_entry_id TEXT, category_name TEXT, category_id TEXT, share_count INTEGER, secondary_img_url TEXT, tertiary_img_url TEXT, opentype INTEGER DEFAULT -1, news_id TEXT, video_view_count INTEGER, video_upload_timestamp INTEGER, video_duration INTEGER, video_width INTEGER, video_height INTEGER, video_auto_play_flag INTEGER, like_count INTEGER, dislike_count INTEGER, emotions TEXT, logo_url TEXT, bg_image TEXT, video_card_style INTEGER, feedback_reason_map TEXT, publisher_id TEXT, publisher_name TEXT, publisher_logo TEXT, publisher_description TEXT, publisher_reason TEXT, publisher_last_update_time INTEGER, publisher_subscribers INTEGER, publisher_posts INTEGER, publisher_infra_feedback TEXT, share_url TEXT, downloaded_date_time INTEGER, stream_id TEXT NOT NULL, local_news_city_name TEXT, is_headlines_carousel_article flag INTEGER, podcast TEXT, banner TEXT,  event_carousel TEXT, trending_search_card TEXT);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE categories (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, code TEXT NOT NULL, name TEXT NOT NULL, subscribed INTEGER NOT NULL, supported flag INTEGER DEFAULT 1, selected flag INTEGER, user_position INTEGER DEFAULT -1 );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE images (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, article_id TEXT NOT NULL, image_url TEXT, video_url TEXT, thumbnail_url TEXT NOT NULL, description TEXT, width INTEGER, height INTEGER, stream_id TEXT NOT NULL );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE feedback_reasons (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, reason_group TEXT NOT NULL, reason_map TEXT NOT NULL);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE cities (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, city_index INTEGER NOT NULL, city_id TEXT NOT NULL, name TEXT NOT NULL, state TEXT NOT NULL, zip_code TEXT NOT NULL, origin INTEGER NOT NULL, selected_state INTEGER NOT NULL );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE city_registrations (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, city_id TEXT NOT NULL, name TEXT NOT NULL, state TEXT NOT NULL, zip_code TEXT NOT NULL, origin INTEGER NOT NULL, country_code TEXT NOT NULL, language_code TEXT NOT NULL, selected_state INTEGER NOT NULL );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void

    :pswitch_64
    const-string p0, "CREATE TABLE reading (id INTEGER PRIMARY KEY AUTOINCREMENT, url TEXT UNIQUE NOT NULL, title TEXT NOT NULL, timestamp INTEGER NULL, image_path TEXT NULL, content_path TEXT NULL, content_mime_type TEXT NULL, transcoded INTEGER NOT NULL DEFAULT 0, filesize INTEGER NULL, visit_count INTEGER NOT NULL DEFAULT 0)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_64
        :pswitch_45
    .end packed-switch
.end method

.method public final onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 5

    iget-byte v0, p0, Ljlh;->a:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0, p1, p2, p3}, Landroid/database/sqlite/SQLiteOpenHelper;->onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x2
        :pswitch_8
    .end packed-switch
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 11

    iget-byte p0, p0, Ljlh;->a:B

    const/4 v0, 0x5

    const/4 v1, 0x2

    packed-switch p0, :pswitch_data_220

    const/4 p0, 0x1

    const-string v0, "),FOREIGN KEY(icon) REFERENCES icons(id) ON DELETE CASCADE)"

    const-string v2, " INTEGER NOT NULL,PRIMARY KEY (icon, "

    const-string v3, " (icon INTEGER,"

    const-string v4, "CREATE TABLE "

    if-ne p2, p0, :cond_35

    if-lt p3, v1, :cond_35

    sget p0, Lvnj;->j:I

    sget-object p0, Lmnj;->b:Lmnj;

    invoke-static {p0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, v5, v3, v6, v2}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_35
    if-gt p2, v1, :cond_5b

    const/4 p0, 0x3

    if-lt p3, p0, :cond_5b

    sget p0, Lvnj;->j:I

    sget-object p0, Lmnj;->c:Lmnj;

    invoke-static {p0}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p0}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p2, v3, p3, v2}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_5b
    return-void

    :pswitch_5c
    if-ge p2, v0, :cond_69

    const-string p0, "DROP TABLE IF EXISTS categories"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE categories (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, code TEXT NOT NULL, name TEXT NOT NULL, subscribed INTEGER NOT NULL, supported flag INTEGER DEFAULT 1, selected flag INTEGER, user_position INTEGER DEFAULT -1 );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_7c

    :cond_69
    const/16 p0, 0x8

    if-ge p2, p0, :cond_7c

    const-string p0, "ALTER TABLE categories ADD COLUMN supported flag INTEGER DEFAULT 1"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE categories ADD COLUMN selected flag INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE categories ADD COLUMN user_position INTEGER DEFAULT -1"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_7c
    :goto_7c
    const/4 p0, 0x6

    const/16 p3, 0x12

    if-ge p2, p0, :cond_8d

    const-string p0, "DROP TABLE IF EXISTS articles"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE articles (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, article_id TEXT NOT NULL, secondary_id TEXT, title TEXT NOT NULL, type TEXT NOT NULL, summary TEXT, original_img_url TEXT, insta_url TEXT, page_url TEXT, source_url TEXT, source_name TEXT, date_time INTEGER, request_id TEXT, more_id TEXT, hot_topic_id TEXT, category TEXT, recommend_type TEXT, infra_feedback TEXT, related_original_news_entry_id TEXT, category_name TEXT, category_id TEXT, share_count INTEGER, secondary_img_url TEXT, tertiary_img_url TEXT, opentype INTEGER DEFAULT -1, news_id TEXT, video_view_count INTEGER, video_upload_timestamp INTEGER, video_duration INTEGER, video_width INTEGER, video_height INTEGER, video_auto_play_flag INTEGER, like_count INTEGER, dislike_count INTEGER, emotions TEXT, logo_url TEXT, bg_image TEXT, video_card_style INTEGER, feedback_reason_map TEXT, publisher_id TEXT, publisher_name TEXT, publisher_logo TEXT, publisher_description TEXT, publisher_reason TEXT, publisher_last_update_time INTEGER, publisher_subscribers INTEGER, publisher_posts INTEGER, publisher_infra_feedback TEXT, share_url TEXT, downloaded_date_time INTEGER, stream_id TEXT NOT NULL, local_news_city_name TEXT, is_headlines_carousel_article flag INTEGER, podcast TEXT, banner TEXT,  event_carousel TEXT, trending_search_card TEXT);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto/16 :goto_197

    :cond_8d
    const/4 p0, 0x7

    if-ge p2, p0, :cond_95

    const-string p0, "DELETE FROM articles WHERE ROWID NOT IN (SELECT MIN(ROWID) FROM articles GROUP BY article_id);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_95
    const/16 p0, 0xb

    if-ge p2, p0, :cond_9e

    const-string p0, "ALTER TABLE articles ADD COLUMN opentype INTEGER DEFAULT -1"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_9e
    const/16 p0, 0xc

    if-ge p2, p0, :cond_c0

    const-string p0, "ALTER TABLE articles ADD COLUMN news_id TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN video_view_count INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN video_upload_timestamp INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN video_duration INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN video_width INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN video_height INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_c0
    const/16 p0, 0x11

    if-ge p2, p0, :cond_c9

    const-string p0, "ALTER TABLE articles ADD COLUMN video_auto_play_flag INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_c9
    if-ge p2, p3, :cond_d5

    const-string p0, "ALTER TABLE articles ADD COLUMN like_count INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN dislike_count INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_d5
    const/16 p0, 0x15

    if-ge p2, p0, :cond_de

    const-string p0, "ALTER TABLE articles ADD COLUMN logo_url TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_de
    const/16 p0, 0x17

    if-ge p2, p0, :cond_e7

    const-string p0, "ALTER TABLE articles ADD COLUMN video_card_style INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_e7
    const/16 p0, 0x18

    if-ge p2, p0, :cond_f0

    const-string p0, "ALTER TABLE articles ADD COLUMN feedback_reason_map TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_f0
    const/16 p0, 0x1a

    if-ge p2, p0, :cond_f9

    const-string p0, "ALTER TABLE articles ADD COLUMN emotions TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_f9
    const/16 p0, 0x1b

    if-ge p2, p0, :cond_125

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_id TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_name TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_logo TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_description TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_reason TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_last_update_time INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_subscribers INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_posts INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_125
    const/16 p0, 0x1c

    if-ge p2, p0, :cond_12e

    const-string p0, "ALTER TABLE articles ADD COLUMN publisher_infra_feedback TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_12e
    const/16 p0, 0x1d

    if-ge p2, p0, :cond_137

    const-string p0, "ALTER TABLE articles ADD COLUMN bg_image TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_137
    const/16 p0, 0x1e

    if-ge p2, p0, :cond_140

    const-string p0, "ALTER TABLE articles ADD COLUMN share_url TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_140
    const/16 p0, 0x1f

    if-ge p2, p0, :cond_149

    const-string p0, "ALTER TABLE articles ADD COLUMN downloaded_date_time INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_149
    const/16 p0, 0x22

    if-ge p2, p0, :cond_152

    const-string p0, "ALTER TABLE articles ADD COLUMN local_news_city_name TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_152
    const/16 p0, 0x24

    if-ge p2, p0, :cond_15b

    const-string p0, "ALTER TABLE articles ADD COLUMN is_headlines_carousel_article flag INTEGER"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_15b
    const/16 p0, 0x26

    if-ge p2, p0, :cond_164

    const-string p0, "ALTER TABLE articles ADD COLUMN podcast TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_164
    const/16 p0, 0x27

    if-ge p2, p0, :cond_16d

    const-string p0, "ALTER TABLE articles ADD COLUMN banner TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_16d
    const/16 p0, 0x28

    if-ge p2, p0, :cond_176

    const-string p0, "ALTER TABLE articles ADD COLUMN event_carousel TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_176
    const/16 p0, 0x29

    if-ge p2, p0, :cond_18e

    const-string p0, "ALTER TABLE articles RENAME TO articles2"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE articles (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, article_id TEXT NOT NULL, secondary_id TEXT, title TEXT NOT NULL, type TEXT NOT NULL, summary TEXT, original_img_url TEXT, insta_url TEXT, page_url TEXT, source_url TEXT, source_name TEXT, date_time INTEGER, request_id TEXT, more_id TEXT, hot_topic_id TEXT, category TEXT, recommend_type TEXT, infra_feedback TEXT, related_original_news_entry_id TEXT, category_name TEXT, category_id TEXT, share_count INTEGER, secondary_img_url TEXT, tertiary_img_url TEXT, opentype INTEGER DEFAULT -1, news_id TEXT, video_view_count INTEGER, video_upload_timestamp INTEGER, video_duration INTEGER, video_width INTEGER, video_height INTEGER, video_auto_play_flag INTEGER, like_count INTEGER, dislike_count INTEGER, emotions TEXT, logo_url TEXT, bg_image TEXT, video_card_style INTEGER, feedback_reason_map TEXT, publisher_id TEXT, publisher_name TEXT, publisher_logo TEXT, publisher_description TEXT, publisher_reason TEXT, publisher_last_update_time INTEGER, publisher_subscribers INTEGER, publisher_posts INTEGER, publisher_infra_feedback TEXT, share_url TEXT, downloaded_date_time INTEGER, stream_id TEXT NOT NULL, local_news_city_name TEXT, is_headlines_carousel_article flag INTEGER, podcast TEXT, banner TEXT,  event_carousel TEXT);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "INSERT INTO articles SELECT _id, article_id, secondary_id, title, type, summary, original_img_url, insta_url, page_url, source_url, source_name, date_time, request_id, more_id, hot_topic_id, category, recommend_type, infra_feedback, related_original_news_entry_id, category_name, category_id, share_count, secondary_img_url, tertiary_img_url, opentype, news_id, video_view_count, video_upload_timestamp, video_duration, video_width, video_height, video_auto_play_flag, like_count, dislike_count, emotions, logo_url, bg_image, video_card_style, feedback_reason_map, publisher_id, publisher_name, publisher_logo, publisher_description, publisher_reason, publisher_last_update_time, publisher_subscribers, publisher_posts, publisher_infra_feedback, share_url, downloaded_date_time, stream_id, local_news_city_name, is_headlines_carousel_article, podcast, NULL, NULL FROM articles2"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DROP TABLE articles2"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_18e
    const/16 p0, 0x2a

    if-ge p2, p0, :cond_197

    const-string p0, "ALTER TABLE articles ADD COLUMN trending_search_card TEXT"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_197
    :goto_197
    const-string p0, "CREATE TABLE images (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, article_id TEXT NOT NULL, image_url TEXT, video_url TEXT, thumbnail_url TEXT NOT NULL, description TEXT, width INTEGER, height INTEGER, stream_id TEXT NOT NULL );"

    const/16 v0, 0x9

    if-ge p2, v0, :cond_1a1

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_1b5

    :cond_1a1
    if-ne p2, v0, :cond_1b5

    const-string v0, "ALTER TABLE images RENAME TO imagesFNORD"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "INSERT INTO images SELECT * FROM imagesFNORD"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DROP TABLE  imagesFNORD"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1b5
    :goto_1b5
    if-ge p2, p3, :cond_1bc

    const-string p0, "CREATE TABLE feedback_reasons (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, reason_group TEXT NOT NULL, reason_map TEXT NOT NULL);"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1bc
    const/16 p0, 0x20

    if-ge p2, p0, :cond_1ca

    const-string p0, "DROP TABLE IF EXISTS citylist"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DELETE FROM articles WHERE type = \'local_news\'"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1ca
    const/16 p0, 0x21

    if-ge p2, p0, :cond_1d3

    const-string p0, "CREATE TABLE cities (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, city_index INTEGER NOT NULL, city_id TEXT NOT NULL, name TEXT NOT NULL, state TEXT NOT NULL, zip_code TEXT NOT NULL, origin INTEGER NOT NULL, selected_state INTEGER NOT NULL );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1d3
    const/16 p0, 0x23

    if-ge p2, p0, :cond_1dc

    const-string p0, "CREATE TABLE city_registrations (_id TEXT PRIMARY KEY ON CONFLICT IGNORE, city_id TEXT NOT NULL, name TEXT NOT NULL, state TEXT NOT NULL, zip_code TEXT NOT NULL, origin INTEGER NOT NULL, country_code TEXT NOT NULL, language_code TEXT NOT NULL, selected_state INTEGER NOT NULL );"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1dc
    const/16 p0, 0x25

    if-ge p2, p0, :cond_1ef

    const-string p0, "DROP TABLE IF EXISTS notifications"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DROP TABLE IF EXISTS active_notifications"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DROP TABLE IF EXISTS local_push_notifications"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1ef
    return-void

    :pswitch_1f0
    if-ge p2, v1, :cond_206

    const-string p0, "ALTER TABLE reading RENAME TO reading_old"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE reading (id INTEGER PRIMARY KEY AUTOINCREMENT, url TEXT UNIQUE NOT NULL, title TEXT NOT NULL, timestamp INTEGER NULL, image_path TEXT NULL, content_path TEXT NULL, content_mime_type TEXT NULL, transcoded INTEGER NOT NULL DEFAULT 0, filesize INTEGER NULL, visit_count INTEGER NOT NULL DEFAULT 0)"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "INSERT INTO reading SELECT * FROM reading_old WHERE url IS NOT NULL"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p0, "DROP TABLE reading_old"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_206
    if-ne p2, v1, :cond_20d

    const-string p0, "ALTER TABLE reading ADD filesize INTEGER NULL"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_20d
    if-lt p2, v1, :cond_21e

    const/4 p0, 0x4

    if-ge p2, p0, :cond_217

    const-string p0, "ALTER TABLE reading ADD content_mime_type TEXT NULL"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_217
    if-ge p2, v0, :cond_21e

    const-string p0, "ALTER TABLE reading ADD visit_count INTEGER NOT NULL DEFAULT 0"

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_21e
    return-void

    nop

    :pswitch_data_220
    .packed-switch 0x0
        :pswitch_1f0
        :pswitch_5c
    .end packed-switch
.end method
