.class public final Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;
.super Ljava/lang/Object;
.source "SecMediaShim.java"


# static fields
.field private static final FILES:Landroid/net/Uri;

.field private static final MS_PROJ:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "GrawMod"


# direct methods
.method static constructor <clinit>()V
    .registers 12

    .line 22
    const-string v0, "content://media/external/file"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->FILES:Landroid/net/Uri;

    .line 23
    const-string v10, "bucket_id"

    const-string v11, "media_type"

    const-string v1, "_id"

    const-string v2, "_data"

    const-string v3, "title"

    const-string v4, "mime_type"

    const-string v5, "datetaken"

    const-string v6, "date_modified"

    const-string v7, "orientation"

    const-string v8, "width"

    const-string v9, "height"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->MS_PROJ:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static contains([Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6

    .line 113
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 114
    :cond_4
    array-length v1, p0

    move v2, v0

    :goto_6
    if-ge v2, v1, :cond_15

    aget-object v3, p0, v2

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 115
    :cond_15
    return v0
.end method

.method private static empty([Ljava/lang/String;)Landroid/database/Cursor;
    .registers 4

    .line 119
    new-instance v0, Landroid/database/MatrixCursor;

    if-eqz p0, :cond_5

    goto :goto_d

    :cond_5
    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, p0, v1

    :goto_d
    invoke-direct {v0, p0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    return-object v0
.end method

.method public static isSecMedia(Landroid/net/Uri;)Z
    .registers 2

    .line 31
    if-eqz p0, :cond_10

    const-string v0, "secmedia"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return p0
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .registers 12

    .line 41
    const/4 v0, 0x0

    if-nez p3, :cond_5

    move-object v4, v0

    goto :goto_c

    :cond_5
    const-string v1, "android:query-arg-sql-selection"

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v4, v1

    .line 42
    :goto_c
    if-nez p3, :cond_10

    move-object v5, v0

    goto :goto_17

    :cond_10
    const-string v1, "android:query-arg-sql-selection-args"

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    move-object v5, v1

    .line 43
    :goto_17
    if-nez p3, :cond_1a

    goto :goto_20

    :cond_1a
    const-string v0, "android:query-arg-sql-sort-order"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_20
    move-object v6, v0

    .line 44
    move-object v2, p0

    move-object v7, p1

    move-object v3, p2

    invoke-static/range {v2 .. v7}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->run(Landroid/content/ContentResolver;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 7

    .line 36
    move-object v0, p5

    move-object p5, p1

    move-object p1, p2

    move-object p2, p3

    move-object p3, p4

    move-object p4, v0

    invoke-static/range {p0 .. p5}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->run(Landroid/content/ContentResolver;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method private static run(Landroid/content/ContentResolver;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Landroid/database/Cursor;
    .registers 11

    .line 49
    const-string v0, "GrawMod"

    .line 50
    invoke-virtual {p5}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-lt v1, v2, :cond_13

    invoke-virtual {p5}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    goto :goto_14

    :cond_13
    move-object v1, v3

    .line 53
    :goto_14
    const-string v2, "_data_draft"

    invoke-static {p1, v2}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->contains([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 54
    if-nez v2, :cond_23

    if-nez v1, :cond_23

    invoke-static {p1}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->empty([Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    .line 57
    :cond_23
    const/4 v2, 0x0

    if-eqz v1, :cond_2f

    .line 58
    nop

    .line 59
    const/4 p2, 0x1

    new-array p3, p2, [Ljava/lang/String;

    aput-object v1, p3, v2

    const-string p2, "_id=?"

    goto :goto_4c

    .line 61
    :cond_2f
    invoke-static {p2}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 62
    nop

    .line 63
    if-eqz p2, :cond_4b

    const-string v4, "burst_group_id"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_46

    const-string v4, "group_type"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4b

    :cond_46
    invoke-static {p1}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->empty([Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0

    .line 65
    :cond_4b
    move-object p2, v1

    :goto_4c
    if-nez p4, :cond_51

    const-string p4, "datetaken DESC, _id DESC"

    goto :goto_59

    :cond_51
    const-string v1, "datetime"

    const-string v4, "datetaken"

    invoke-virtual {p4, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p4

    .line 66
    :goto_59
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 67
    if-eqz p2, :cond_65

    const-string v4, "android:query-arg-sql-selection"

    invoke-virtual {v1, v4, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :cond_65
    if-eqz p3, :cond_6c

    const-string v4, "android:query-arg-sql-selection-args"

    invoke-virtual {v1, v4, p3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 69
    :cond_6c
    const-string p3, "android:query-arg-sql-sort-order"

    invoke-virtual {v1, p3, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string p3, "android:query-arg-limit"

    const/16 p4, 0x32

    invoke-virtual {v1, p3, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 71
    if-eqz p1, :cond_7b

    goto :goto_7d

    :cond_7b
    sget-object p1, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->MS_PROJ:[Ljava/lang/String;

    .line 72
    :goto_7d
    new-instance p3, Landroid/database/MatrixCursor;

    invoke-direct {p3, p1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 73
    :try_start_82
    sget-object p4, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->FILES:Landroid/net/Uri;

    sget-object v4, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->MS_PROJ:[Ljava/lang/String;

    invoke-virtual {p0, p4, v4, v1, v3}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    .line 74
    if-nez p0, :cond_92

    .line 80
    if-eqz p0, :cond_91

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_91
    .catch Ljava/lang/RuntimeException; {:try_start_82 .. :try_end_91} :catch_c0

    .line 74
    :cond_91
    return-object p3

    .line 75
    :cond_92
    :goto_92
    :try_start_92
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p4

    if-eqz p4, :cond_ae

    .line 76
    array-length p4, p1

    new-array p4, p4, [Ljava/lang/Object;

    .line 77
    move v1, v2

    :goto_9c
    array-length v3, p1

    if-ge v1, v3, :cond_aa

    aget-object v3, p1, v1

    invoke-static {p0, v3}, Lcom/samsung/android/app/galaxyraw/mod/SecMediaShim;->value(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, p4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_9c

    .line 78
    :cond_aa
    invoke-virtual {p3, p4}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V
    :try_end_ad
    .catchall {:try_start_92 .. :try_end_ad} :catchall_b4

    .line 79
    goto :goto_92

    .line 80
    :cond_ae
    if-eqz p0, :cond_b3

    :try_start_b0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_b3
    .catch Ljava/lang/RuntimeException; {:try_start_b0 .. :try_end_b3} :catch_c0

    .line 82
    :cond_b3
    goto :goto_e5

    .line 73
    :catchall_b4
    move-exception p1

    if-eqz p0, :cond_bf

    :try_start_b7
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_ba
    .catchall {:try_start_b7 .. :try_end_ba} :catchall_bb

    goto :goto_bf

    :catchall_bb
    move-exception p0

    :try_start_bc
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_bf
    :goto_bf
    throw p1
    :try_end_c0
    .catch Ljava/lang/RuntimeException; {:try_start_bc .. :try_end_c0} :catch_c0

    .line 80
    :catch_c0
    move-exception p0

    .line 81
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "SecMediaShim query failed: "

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " sel="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :goto_e5
    invoke-virtual {p3}, Landroid/database/MatrixCursor;->getCount()I

    move-result p0

    invoke-static {p5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "SecMediaShim: "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " row(s) for "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    return-object p3
.end method

.method private static translate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 88
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 89
    :cond_4
    nop

    .line 90
    const-string v0, "(is_hide != 1 OR is_hide is NULL)"

    const-string v1, "1=1"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 91
    const-string v0, "datetime"

    const-string v1, "datetaken"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 89
    return-object p0
.end method

.method private static value(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/Object;
    .registers 14

    .line 95
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x5

    const/16 v2, 0xa

    const/16 v3, 0x9

    const/16 v4, 0x8

    const/4 v5, 0x7

    const/4 v6, 0x6

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v11, 0x0

    sparse-switch v0, :sswitch_data_13c

    :cond_15
    goto/16 :goto_cf

    :sswitch_17
    const-string v0, "is_hide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0xd

    goto/16 :goto_d0

    :sswitch_23
    const-string v0, "media_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v2

    goto/16 :goto_d0

    :sswitch_2e
    const-string v0, "bucket_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v3

    goto/16 :goto_d0

    :sswitch_39
    const-string v0, "datetime"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v1

    goto/16 :goto_d0

    :sswitch_44
    const-string v0, "best_image"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0x10

    goto/16 :goto_d0

    :sswitch_50
    const-string v0, "group_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0xe

    goto/16 :goto_d0

    :sswitch_5c
    const-string v0, "is_trashed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0xc

    goto/16 :goto_d0

    :sswitch_68
    const-string v0, "width"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v5

    goto/16 :goto_d0

    :sswitch_73
    const-string v0, "title"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v7

    goto :goto_d0

    :sswitch_7d
    const-string v0, "is_cloud"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0xb

    goto :goto_d0

    :sswitch_88
    const-string v0, "_data"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v8

    goto :goto_d0

    :sswitch_92
    const-string v0, "_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v11

    goto :goto_d0

    :sswitch_9c
    const-string v0, "mime_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v9

    goto :goto_d0

    :sswitch_a6
    const-string v0, "sef_file_type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    const/16 p1, 0xf

    goto :goto_d0

    :sswitch_b1
    const-string v0, "media_id"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v10

    goto :goto_d0

    :sswitch_bb
    const-string v0, "height"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v4

    goto :goto_d0

    :sswitch_c5
    const-string v0, "orientation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    move p1, v6

    goto :goto_d0

    :goto_cf
    const/4 p1, -0x1

    :goto_d0
    packed-switch p1, :pswitch_data_182

    .line 108
    const/4 p0, 0x0

    return-object p0

    .line 107
    :pswitch_d5
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 106
    :pswitch_da
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 105
    :pswitch_df
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 104
    :pswitch_e8
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 103
    :pswitch_f1
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 102
    :pswitch_fa
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 101
    :pswitch_103
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 100
    :pswitch_10c
    invoke-interface {p0, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result p1

    if-eqz p1, :cond_11a

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    const-wide/16 v0, 0x3e8

    mul-long/2addr p0, v0

    goto :goto_11e

    :cond_11a
    invoke-interface {p0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    :goto_11e
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 99
    :pswitch_123
    invoke-interface {p0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 98
    :pswitch_128
    invoke-interface {p0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 97
    :pswitch_12d
    invoke-interface {p0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 96
    :pswitch_132
    invoke-interface {p0, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_13c
    .sparse-switch
        -0x55cd0a30 -> :sswitch_c5
        -0x48c76ed9 -> :sswitch_bb
        -0x35b0b8aa -> :sswitch_b1
        -0x2622420e -> :sswitch_a6
        -0xbaf5b9b -> :sswitch_9c
        0x171ba -> :sswitch_92
        0x569a889 -> :sswitch_88
        0x68a46e0 -> :sswitch_7d
        0x6942258 -> :sswitch_73
        0x6be2dc6 -> :sswitch_68
        0x19d4fbc2 -> :sswitch_5c
        0x4c7188fa -> :sswitch_50
        0x4dae2740 -> :sswitch_44
        0x6ae9bb7b -> :sswitch_39
        0x6d80e790 -> :sswitch_2e
        0x73a026b5 -> :sswitch_23
        0x7c173337 -> :sswitch_17
    .end sparse-switch

    :pswitch_data_182
    .packed-switch 0x0
        :pswitch_132
        :pswitch_132
        :pswitch_12d
        :pswitch_128
        :pswitch_123
        :pswitch_10c
        :pswitch_103
        :pswitch_fa
        :pswitch_f1
        :pswitch_e8
        :pswitch_df
        :pswitch_da
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
    .end packed-switch
.end method
