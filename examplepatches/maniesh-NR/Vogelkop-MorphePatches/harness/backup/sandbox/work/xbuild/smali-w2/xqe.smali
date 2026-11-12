.class public final Lxqe;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:[Ljava/lang/String;

.field public static final j:[Ljava/lang/String;


# instance fields
.field public final a:Li32;

.field public final b:Lh7f;

.field public c:Luy8;

.field public final d:Landroid/content/Context;

.field public final e:Lqre;

.field public final f:[Ljava/lang/String;

.field public g:Ljava/util/List;

.field public final h:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 55

    const-string v53, "banner"

    const-string v54, "event_carousel"

    const-string v1, "article_id"

    const-string v2, "secondary_id"

    const-string v3, "title"

    const-string v4, "type"

    const-string v5, "summary"

    const-string v6, "original_img_url"

    const-string v7, "insta_url"

    const-string v8, "page_url"

    const-string v9, "source_url"

    const-string v10, "source_name"

    const-string v11, "date_time"

    const-string v12, "request_id"

    const-string v13, "more_id"

    const-string v14, "hot_topic_id"

    const-string v15, "category"

    const-string v16, "recommend_type"

    const-string v17, "infra_feedback"

    const-string v18, "related_original_news_entry_id"

    const-string v19, "category_name"

    const-string v20, "share_count"

    const-string v21, "secondary_img_url"

    const-string v22, "tertiary_img_url"

    const-string v23, "category_id"

    const-string v24, "opentype"

    const-string v25, "news_id"

    const-string v26, "video_view_count"

    const-string v27, "video_upload_timestamp"

    const-string v28, "video_duration"

    const-string v29, "video_width"

    const-string v30, "video_height"

    const-string v31, "video_auto_play_flag"

    const-string v32, "like_count"

    const-string v33, "dislike_count"

    const-string v34, "logo_url"

    const-string v35, "video_card_style"

    const-string v36, "feedback_reason_map"

    const-string v37, "emotions"

    const-string v38, "publisher_id"

    const-string v39, "publisher_name"

    const-string v40, "publisher_logo"

    const-string v41, "publisher_description"

    const-string v42, "publisher_reason"

    const-string v43, "publisher_last_update_time"

    const-string v44, "publisher_subscribers"

    const-string v45, "publisher_posts"

    const-string v46, "publisher_infra_feedback"

    const-string v47, "bg_image"

    const-string v48, "share_url"

    const-string v49, "downloaded_date_time"

    const-string v50, "local_news_city_name"

    const-string v51, "is_headlines_carousel_article"

    const-string v52, "podcast"

    filled-new-array/range {v1 .. v54}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lxqe;->i:[Ljava/lang/String;

    const-string v6, "width"

    const-string v7, "height"

    const-string v1, "article_id"

    const-string v2, "image_url"

    const-string v3, "video_url"

    const-string v4, "thumbnail_url"

    const-string v5, "description"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lxqe;->j:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lqre;Lkqd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lxqe;->b:Lh7f;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lxqe;->h:Ljava/util/ArrayList;

    new-instance v0, Li32;

    invoke-direct {v0, p0, p2, p4}, Li32;-><init>(Lxqe;Lumi;Lkqd;)V

    iput-object v0, p0, Lxqe;->a:Li32;

    iput-object p1, p0, Lxqe;->d:Landroid/content/Context;

    iput-object p3, p0, Lxqe;->e:Lqre;

    iget-object p1, p3, Lqre;->a:Ljava/lang/String;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lxqe;->f:[Ljava/lang/String;

    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;Lqre;Lwqe;)Lmsh;
    .registers 11

    iget-object v0, p2, Lqre;->a:Ljava/lang/String;

    filled-new-array {p1, v0}, [Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {p0}, Lare;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    const-string v4, "article_id=? AND stream_id=?"

    const/4 v6, 0x0

    sget-object v3, Lxqe;->i:[Ljava/lang/String;

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_49

    :try_start_19
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3f

    :cond_1f
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lj7c;->c(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_39

    invoke-static {p0, p2, p1, p3}, Lxqe;->m(Landroid/content/Context;Lqre;Landroid/database/Cursor;Lwqe;)Loqe;

    move-result-object v0

    instance-of v1, v0, Lmsh;

    if-eqz v1, :cond_39

    check-cast v0, Lmsh;
    :try_end_35
    .catchall {:try_start_19 .. :try_end_35} :catchall_43

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0

    :cond_39
    :try_start_39
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_3d
    .catchall {:try_start_39 .. :try_end_3d} :catchall_43

    if-nez v0, :cond_1f

    :cond_3f
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_49

    :catchall_43
    move-exception v0

    move-object p0, v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p0

    :cond_49
    :goto_49
    const/4 p0, 0x0

    return-object p0
.end method

.method public static d(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;)V
    .registers 5

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_4
    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loqe;

    instance-of v1, v0, Lere;

    if-eqz v1, :cond_1c

    check-cast v0, Lere;

    iget-object v0, v0, Lere;->f:Ljava/util/List;

    invoke-static {p0, p1, v0}, Lxqe;->d(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;)V

    goto :goto_4

    :cond_1c
    instance-of v1, v0, Lmsh;

    if-eqz v1, :cond_4

    move-object v1, v0

    check-cast v1, Lmsh;

    invoke-virtual {v1}, Lmsh;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_31
    return-void
.end method

.method public static e(Landroid/content/Context;Lqre;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 14

    iget-object p1, p1, Lqre;->a:Ljava/lang/String;

    filled-new-array {p2, p1}, [Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p0}, Lare;->c(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    const-string v3, "article_id=? AND stream_id=?"

    const/4 v5, 0x0

    sget-object v2, Lxqe;->j:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_70

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_6d

    :cond_1f
    const/4 p1, 0x3

    :try_start_20
    invoke-static {p0, p1}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x2

    invoke-static {p0, v0}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    if-nez p2, :cond_3a

    if-nez v0, :cond_40

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_67

    :cond_3a
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_67

    :cond_40
    if-eqz p4, :cond_67

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v6

    const/4 v1, 0x5

    invoke-static {p0, v1}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v7

    const/4 v1, 0x6

    invoke-static {p0, v1}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v8

    new-instance v2, Lhre;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v0}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct/range {v2 .. v8}, Lhre;-><init>(Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;II)V

    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_67
    .catch Ljava/lang/IllegalArgumentException; {:try_start_20 .. :try_end_67} :catch_67

    :catch_67
    :cond_67
    :goto_67
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-nez p1, :cond_1f

    :cond_6d
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_70
    return-void
.end method

.method public static f(Landroid/database/Cursor;I)I
    .registers 3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0

    :cond_b
    const-string p0, "Value cannot be NULL"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static g(Landroid/database/Cursor;I)J
    .registers 3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    int-to-long p0, p0

    return-wide p0

    :cond_c
    const-string p0, "Value cannot be NULL"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public static h(Landroid/database/Cursor;I)Ljava/lang/Integer;
    .registers 3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static i(Landroid/database/Cursor;I)Ljava/lang/String;
    .registers 3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(Landroid/database/Cursor;I)Ljava/lang/String;
    .registers 3

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const-string p0, "Value cannot be NULL"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static m(Landroid/content/Context;Lqre;Landroid/database/Cursor;Lwqe;)Loqe;
    .registers 60

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x3

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lj7c;->c(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    const/16 v4, 0x35

    const/16 v6, 0xc

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v3, :cond_8c

    if-ne v3, v9, :cond_88

    :try_start_1c
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object v7, v2

    invoke-static {v1, v9}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v4}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    move-object v8, v7

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :cond_37
    :goto_37
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11

    if-eqz v11, :cond_5c

    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v11

    if-nez v11, :cond_59

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_59

    invoke-static/range {p0 .. p3}, Lxqe;->m(Landroid/content/Context;Lqre;Landroid/database/Cursor;Lwqe;)Loqe;

    move-result-object v11

    if-eqz v11, :cond_37

    check-cast v11, Lmsh;

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_37

    :cond_59
    invoke-interface {v1}, Landroid/database/Cursor;->moveToPrevious()Z

    :cond_5c
    new-instance v0, Lere;

    sget-object v1, Lnb8;->Companion:Lmb8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v4, :cond_81

    sget-object v9, Lrpb;->d:Lqpb;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lmb8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v9, v4, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnb8;

    move-object v4, v8

    move-object v8, v1

    move-object v1, v4

    :goto_7d
    move-object v4, v6

    move-object/from16 v6, p1

    goto :goto_84

    :cond_81
    move-object v1, v8

    const/4 v8, 0x0

    goto :goto_7d

    :goto_84
    invoke-direct/range {v0 .. v8}, Lere;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqre;Ljava/util/ArrayList;Lnb8;)V
    :try_end_87
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_87} :catch_88

    return-object v0

    :catch_88
    :cond_88
    const/16 v41, 0x0

    goto/16 :goto_6b0

    :cond_8c
    :try_start_8c
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v3, 0x18

    invoke-static {v1, v3}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v20

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x5

    invoke-static {v1, v7}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v7

    const/16 v11, 0xb

    invoke-static {v1, v11}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v12

    const/4 v11, 0x6

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v21

    const/4 v11, 0x7

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v22

    const/16 v11, 0x8

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v23

    const/16 v11, 0x2f

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v24

    const/16 v11, 0x9

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v25

    const/16 v11, 0xa

    invoke-static {v1, v11}, Lxqe;->g(Landroid/database/Cursor;I)J

    move-result-wide v26

    const/16 v11, 0x30

    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_d8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    goto :goto_dc

    :cond_d8
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    :goto_dc
    move-wide/from16 v28, v14

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v14

    const/16 v6, 0xd

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v15

    const/16 v6, 0xe

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v16

    const/16 v6, 0xf

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v17

    const/16 v6, 0x10

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v18

    const/16 v6, 0x11

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v19

    const/16 v6, 0x12

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v6

    const/16 v11, 0x16

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v30

    const/16 v11, 0x13

    invoke-static {v1, v11}, Lxqe;->h(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v31

    const/16 v11, 0x1f

    invoke-static {v1, v11}, Lxqe;->h(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v32

    const/16 v11, 0x20

    invoke-static {v1, v11}, Lxqe;->h(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v33

    const/16 v11, 0x23

    invoke-static {v1, v11}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v11

    const/16 v2, 0x34

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v4}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4
    :try_end_12e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8c .. :try_end_12e} :catch_69d

    if-eqz v11, :cond_16c

    move/from16 v35, v8

    :try_start_132
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v11, "not_interested"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    if-nez v11, :cond_141

    const/4 v10, 0x0

    goto :goto_146

    :cond_141
    new-instance v10, Lvpb;

    invoke-direct {v10, v11}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_146
    if-eqz v10, :cond_14d

    invoke-static {v10}, Lo0g;->N(Lvpb;)Ljava/util/ArrayList;

    move-result-object v10

    goto :goto_14e

    :cond_14d
    const/4 v10, 0x0

    :goto_14e
    const-string v11, "report"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    if-nez v8, :cond_158

    const/4 v11, 0x0

    goto :goto_15d

    :cond_158
    new-instance v11, Lvpb;

    invoke-direct {v11, v8}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_15d
    if-eqz v11, :cond_164

    invoke-static {v11}, Lo0g;->N(Lvpb;)Ljava/util/ArrayList;

    move-result-object v8

    goto :goto_165

    :cond_164
    const/4 v8, 0x0

    :goto_165
    new-instance v11, Landroid/util/Pair;

    invoke-direct {v11, v10, v8}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_16a
    .catch Lorg/json/JSONException; {:try_start_132 .. :try_end_16a} :catch_16e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_132 .. :try_end_16a} :catch_69d

    move-object v8, v11

    goto :goto_16f

    :cond_16c
    move/from16 v35, v8

    :catch_16e
    const/4 v8, 0x0

    :goto_16f
    const/16 v10, 0x24

    :try_start_171
    invoke-static {v1, v10}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_17b

    move-object/from16 v37, v3

    const/4 v3, 0x0

    goto :goto_19f

    :cond_17b
    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/util/ArrayList;

    array-length v9, v10

    invoke-direct {v11, v9}, Ljava/util/ArrayList;-><init>(I)V

    array-length v9, v10

    move-object/from16 v37, v3

    move/from16 v3, v35

    :goto_18c
    if-ge v3, v9, :cond_19e

    aget-object v38, v10, v3

    move/from16 v39, v3

    invoke-static/range {v38 .. v38}, Llsh;->d(Ljava/lang/String;)Llsh;

    move-result-object v3

    if-eqz v3, :cond_19b

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_19b
    add-int/lit8 v3, v39, 0x1

    goto :goto_18c

    :cond_19e
    move-object v3, v11

    :goto_19f
    const/16 v9, 0x17

    invoke-static {v1, v9}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v9
    :try_end_1a5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_171 .. :try_end_1a5} :catch_69d

    const/4 v10, -0x1

    const/4 v11, 0x4

    move-object/from16 v38, v3

    const-string v3, "image_gallery"

    if-ne v9, v10, :cond_1c1

    :try_start_1ad
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1b8

    move-object/from16 v34, v6

    move/from16 v39, v11

    goto :goto_1d6

    :cond_1b8
    if-eqz v21, :cond_2d9

    if-eqz v22, :cond_2d9

    move-object/from16 v34, v6

    const/16 v39, 0x3

    goto :goto_1d6

    :cond_1c1
    invoke-static {v11}, Lvep;->B(I)[I

    move-result-object v10

    array-length v11, v10

    move-object/from16 v34, v6

    move/from16 v6, v35

    :goto_1ca
    if-ge v6, v11, :cond_687

    aget v39, v10, v6

    move/from16 v40, v6

    invoke-static/range {v39 .. v39}, Lvep;->g(I)B

    move-result v6

    if-ne v6, v9, :cond_64d

    :goto_1d6
    new-instance v10, Lp12;

    move-object v11, v10

    invoke-direct/range {v11 .. v19}, Lp12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V

    move-object/from16 v19, v11

    const/16 v6, 0x31

    invoke-static {v1, v6}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v6

    const/16 v9, 0x33

    invoke-static {v1, v9}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_204

    sget-object v10, Lxlg;->Companion:Lwlg;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1f1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1ad .. :try_end_1f1} :catch_69d

    :try_start_1f1
    sget-object v11, Lrpb;->d:Lqpb;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v10}, Lwlg;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v10

    check-cast v10, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v11, v9, v10}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lxlg;
    :try_end_202
    .catch Lo2j; {:try_start_1f1 .. :try_end_202} :catch_204
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1f1 .. :try_end_202} :catch_204

    move-object v12, v9

    goto :goto_205

    :catch_204
    :cond_204
    const/4 v12, 0x0

    :goto_205
    :try_start_205
    const-string v9, "multi_image"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2a8

    const/16 v0, 0x14

    invoke-static {v1, v0}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x15

    invoke-static {v1, v2}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    move-object v2, v0

    new-instance v0, Ljre;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    move-wide/from16 v10, v26

    move-object/from16 v26, v6

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static/range {v24 .. v24}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-eqz v31, :cond_23f

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move/from16 v16, v13

    goto :goto_241

    :cond_23f
    move/from16 v16, v35

    :goto_241
    if-eqz v32, :cond_24a

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move/from16 v17, v13

    goto :goto_24c

    :cond_24a
    move/from16 v17, v35

    :goto_24c
    if-eqz v33, :cond_255

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move/from16 v18, v13

    goto :goto_257

    :cond_255
    move/from16 v18, v35

    :goto_257
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    if-eqz v8, :cond_268

    iget-object v1, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    move-object/from16 v24, v1

    goto :goto_26a

    :cond_268
    const/16 v24, 0x0

    :goto_26a
    if-eqz v8, :cond_28a

    iget-object v1, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    move-wide/from16 v14, v28

    move-object/from16 v28, v12

    move-wide v12, v14

    move-object v8, v3

    move-object/from16 v3, v25

    move-object/from16 v25, v1

    move-object/from16 v27, p1

    move-object v2, v5

    move-object/from16 v23, v19

    move-object/from16 v15, v30

    move-object/from16 v14, v34

    move-object/from16 v19, v38

    move/from16 v5, v39

    move-object/from16 v1, v37

    goto :goto_2a3

    :cond_28a
    move-wide/from16 v1, v28

    move-object/from16 v28, v12

    move-wide v12, v1

    move-object v8, v3

    move-object/from16 v3, v25

    const/16 v25, 0x0

    move-object/from16 v27, p1

    move-object v2, v5

    move-object/from16 v23, v19

    move-object/from16 v15, v30

    move-object/from16 v14, v34

    move-object/from16 v1, v37

    move-object/from16 v19, v38

    move/from16 v5, v39

    :goto_2a3
    invoke-direct/range {v0 .. v28}, Ljre;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;)V

    goto/16 :goto_341

    :cond_2a8
    move-object/from16 v9, v25

    move-wide/from16 v10, v26

    move-wide/from16 v14, v28

    move-object/from16 v26, v6

    move-object/from16 v28, v12

    move-object/from16 v12, v30

    move-object/from16 v6, p1

    move-object/from16 v30, v19

    move-object/from16 v19, v38

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_343

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v6, v13, v1, v2}, Lxqe;->e(Landroid/content/Context;Lqre;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d9

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2de

    :cond_2d9
    const/4 v10, 0x0

    :goto_2da
    const/16 v41, 0x0

    goto/16 :goto_6a1

    :cond_2de
    new-instance v0, Lire;

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    move-object/from16 v18, v2

    move-object v2, v5

    invoke-static/range {v24 .. v24}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    if-eqz v31, :cond_2f4

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_2f6

    :cond_2f4
    move/from16 v3, v35

    :goto_2f6
    if-eqz v32, :cond_2fe

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move v13, v7

    goto :goto_300

    :cond_2fe
    move/from16 v13, v35

    :goto_300
    if-eqz v33, :cond_309

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move-wide v15, v14

    move v14, v7

    goto :goto_30c

    :cond_309
    move-wide v15, v14

    move/from16 v14, v35

    :goto_30c
    if-eqz v8, :cond_317

    iget-object v7, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/util/List;

    move-object/from16 v17, v20

    move-object/from16 v20, v7

    goto :goto_31b

    :cond_317
    move-object/from16 v17, v20

    const/16 v20, 0x0

    :goto_31b
    if-eqz v8, :cond_33b

    iget-object v7, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/util/List;

    move-object/from16 v21, v7

    :goto_323
    move-object/from16 v23, v6

    move-wide v6, v10

    move-object v11, v12

    move-object/from16 v22, v26

    move-object/from16 v24, v28

    move-object/from16 v10, v34

    move v12, v3

    move-object v3, v9

    move-wide v8, v15

    move-object/from16 v16, v17

    move-object/from16 v15, v19

    move-object/from16 v19, v30

    move-object/from16 v17, v1

    move-object/from16 v1, v37

    goto :goto_33e

    :cond_33b
    const/16 v21, 0x0

    goto :goto_323

    :goto_33e
    invoke-direct/range {v0 .. v24}, Lire;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;)V

    :goto_341
    move-object v10, v0

    goto :goto_2da

    :cond_343
    move-object v3, v9

    const-string v9, "video"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    move-object/from16 v16, v3

    const/16 v3, 0x21

    if-eqz v9, :cond_494

    const/16 v2, 0x19

    invoke-static {v1, v2}, Lxqe;->g(Landroid/database/Cursor;I)J

    move-result-wide v17

    const/16 v2, 0x1a

    invoke-static {v1, v2}, Lxqe;->g(Landroid/database/Cursor;I)J

    move-result-wide v27

    const/16 v2, 0x1b

    invoke-static {v1, v2}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v2

    const/16 v4, 0x1c

    invoke-static {v1, v4}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v4

    const/16 v7, 0x1d

    invoke-static {v1, v7}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v25

    const/16 v7, 0x1e

    invoke-static {v1, v7}, Lxqe;->h(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v7

    if-nez v7, :cond_37c

    const/16 v7, 0xff

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :cond_37c
    invoke-static {v1, v3}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    const/16 v9, 0x22

    invoke-static {v1, v9}, Lxqe;->h(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v9

    if-nez v9, :cond_38c

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :cond_38c
    move/from16 v21, v2

    const/16 v2, 0x25

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v43

    const/16 v2, 0x26

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v44

    const/16 v2, 0x27

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v45

    if-eqz v43, :cond_3d2

    if-eqz v44, :cond_3d2

    if-eqz v45, :cond_3d2

    const/16 v2, 0x28

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v46

    const/16 v2, 0x29

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v47

    const/16 v2, 0x2a

    invoke-static {v1, v2}, Lxqe;->g(Landroid/database/Cursor;I)J

    move-result-wide v48

    const/16 v2, 0x2b

    invoke-static {v1, v2}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v50

    const/16 v2, 0x2c

    invoke-static {v1, v2}, Lxqe;->f(Landroid/database/Cursor;I)I

    move-result v51

    const/16 v2, 0x2d

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v52

    new-instance v42, Lw9h;

    invoke-direct/range {v42 .. v52}, Lw9h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIILjava/lang/String;)V

    move-object/from16 v29, v42

    goto :goto_3d4

    :cond_3d2
    const/16 v29, 0x0

    :goto_3d4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_3d9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_205 .. :try_end_3d9} :catch_69d

    const/4 v2, 0x0

    :try_start_3da
    invoke-static {v0, v6, v13, v1, v2}, Lxqe;->e(Landroid/content/Context;Lqre;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3e8

    move-object v10, v2

    move-object/from16 v41, v10

    goto/16 :goto_6a1

    :cond_3e8
    new-instance v0, Lure;

    move-object/from16 v36, v24

    move/from16 v24, v4

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    sget-object v13, Lwqm;->a:[Ljava/lang/String;
    :try_end_3f4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3da .. :try_end_3f4} :catch_490

    move-object/from16 v41, v2

    move-object v2, v5

    :try_start_3f7
    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-static/range {v36 .. v36}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    if-eqz v31, :cond_406

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v13

    goto :goto_408

    :cond_406
    move/from16 v13, v35

    :goto_408
    if-eqz v32, :cond_40f

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v22

    goto :goto_411

    :cond_40f
    move/from16 v22, v35

    :goto_411
    if-eqz v33, :cond_41e

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Integer;->intValue()I

    move-result v23

    move-wide/from16 v31, v10

    move-object v11, v9

    move-wide v9, v14

    move/from16 v15, v23

    goto :goto_424

    :cond_41e
    move-wide/from16 v31, v10

    move-object v11, v9

    move-wide v9, v14

    move/from16 v15, v35

    :goto_424
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v3}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-eqz v8, :cond_43b

    iget-object v14, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v14, Ljava/util/List;

    move-wide/from16 v32, v31

    move-object/from16 v31, v14

    goto :goto_43f

    :cond_43b
    move-wide/from16 v32, v31

    move-object/from16 v31, v41

    :goto_43f
    if-eqz v8, :cond_46e

    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    move/from16 v23, v21

    move/from16 v14, v22

    move-wide/from16 v21, v27

    move-object/from16 v27, v3

    move-object/from16 v3, v16

    move-object/from16 v16, v19

    move-wide/from16 v53, v17

    move-object/from16 v17, v20

    move-wide/from16 v19, v53

    move-object/from16 v53, v26

    move/from16 v26, v7

    move-wide/from16 v54, v32

    move-object/from16 v32, v8

    move-object/from16 v33, v53

    move-wide/from16 v7, v54

    :goto_463
    move/from16 v28, v11

    move-object/from16 v11, v34

    move-object/from16 v34, p1

    move-object/from16 v18, v1

    move-object/from16 v1, v37

    goto :goto_48b

    :cond_46e
    move-object/from16 v14, v26

    move/from16 v26, v7

    move-wide/from16 v7, v32

    move-object/from16 v33, v14

    move/from16 v23, v21

    move/from16 v14, v22

    move-wide/from16 v21, v27

    move-object/from16 v32, v41

    move-object/from16 v27, v3

    move-object/from16 v3, v16

    move-object/from16 v16, v19

    move-wide/from16 v53, v17

    move-object/from16 v17, v20

    move-wide/from16 v19, v53

    goto :goto_463

    :goto_48b
    invoke-direct/range {v0 .. v34}, Lure;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;JJIIIILandroid/net/Uri;ILw9h;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;)V

    goto/16 :goto_64b

    :catch_490
    move-object/from16 v41, v2

    goto/16 :goto_69f

    :cond_494
    move-wide/from16 v53, v14

    move-object v15, v12

    move-wide/from16 v12, v53

    move-object/from16 v36, v24

    move-object/from16 v14, v34

    const/16 v41, 0x0

    const-string v0, "top_news"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54b

    invoke-static {v1, v3}, Lxqe;->j(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2e

    invoke-static {v1, v2}, Lxqe;->i(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x32

    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_543

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v6, 0x1

    if-ne v1, v6, :cond_4c3

    move v9, v6

    :goto_4c1
    move-object v1, v0

    goto :goto_4c6

    :cond_4c3
    move/from16 v9, v35

    goto :goto_4c1

    :goto_4c6
    new-instance v0, Lrre;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v22, v26

    move/from16 v26, v9

    invoke-static/range {v36 .. v36}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-eqz v31, :cond_4e9

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v17

    goto :goto_4eb

    :cond_4e9
    move/from16 v17, v35

    :goto_4eb
    if-eqz v32, :cond_4f2

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v18

    goto :goto_4f4

    :cond_4f2
    move/from16 v18, v35

    :goto_4f4
    if-eqz v33, :cond_507

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Integer;->intValue()I

    move-result v21

    move/from16 v53, v21

    move-object/from16 v21, v3

    move-object/from16 v3, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v53

    goto :goto_511

    :cond_507
    move-object/from16 v21, v3

    move-object/from16 v3, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v35

    :goto_511
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    if-eqz v8, :cond_521

    iget-object v2, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    move-object/from16 v23, v2

    goto :goto_523

    :cond_521
    move-object/from16 v23, v41

    :goto_523
    if-eqz v8, :cond_53b

    iget-object v2, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    move-object/from16 v24, v2

    :goto_52b
    move-object/from16 v27, p1

    move-object v2, v5

    move-object/from16 v8, v21

    move-object/from16 v25, v22

    move-object/from16 v22, v30

    move/from16 v5, v39

    move-object/from16 v21, v1

    move-object/from16 v1, v37

    goto :goto_53e

    :cond_53b
    move-object/from16 v24, v41

    goto :goto_52b

    :goto_53e
    invoke-direct/range {v0 .. v28}, Lrre;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Landroid/net/Uri;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;ZLqre;Lxlg;)V

    goto/16 :goto_64b

    :cond_543
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_54b
    move-object/from16 v3, v16

    move-object/from16 v1, v37

    const-string v0, "roundup"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_57a

    if-eqz v28, :cond_69f

    new-instance v0, Ld9i;

    move-object/from16 v16, v3

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static/range {v36 .. v36}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    move-wide v5, v10

    move-wide v7, v12

    move-object/from16 v2, v16

    move-object/from16 v12, v28

    move-object/from16 v10, v30

    move-object/from16 v11, p1

    invoke-direct/range {v0 .. v12}, Ld9i;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;JJLandroid/net/Uri;Lp12;Lqre;Lxlg;)V

    goto/16 :goto_64b

    :cond_57a
    const-string v0, "banner"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a8

    if-eqz v2, :cond_69f

    new-instance v0, Lfre;

    sget-object v1, Ljb8;->Companion:Lib8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lrpb;->d:Lqpb;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lib8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v3, v2, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljb8;

    move-object/from16 v6, p1

    move-wide v1, v10

    move-wide v3, v12

    move-object/from16 v5, v30

    invoke-direct/range {v0 .. v7}, Lfre;-><init>(JJLp12;Lqre;Ljb8;)V

    goto/16 :goto_64b

    :cond_5a8
    new-instance v0, Lmsh;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-static/range {v22 .. v22}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    sget-object v9, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v23 .. v23}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    move-object/from16 v16, v9

    invoke-static/range {v36 .. v36}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-eqz v31, :cond_5c9

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v17

    goto :goto_5cb

    :cond_5c9
    move/from16 v17, v35

    :goto_5cb
    if-eqz v32, :cond_5d2

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v18

    goto :goto_5d4

    :cond_5d2
    move/from16 v18, v35

    :goto_5d4
    if-eqz v33, :cond_5e5

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Integer;->intValue()I

    move-result v21

    move/from16 v53, v21

    move-object/from16 v21, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v53

    goto :goto_5ed

    :cond_5e5
    move-object/from16 v21, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v35

    :goto_5ed
    if-eqz v8, :cond_5f8

    move-object/from16 p0, v0

    iget-object v0, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    move-object/from16 v22, v0

    goto :goto_5fc

    :cond_5f8
    move-object/from16 p0, v0

    move-object/from16 v22, v41

    :goto_5fc
    if-eqz v8, :cond_605

    iget-object v0, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    move-object/from16 v23, v0

    goto :goto_607

    :cond_605
    move-object/from16 v23, v41

    :goto_607
    sget-object v0, Lnb8;->Companion:Lmb8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v4, :cond_636

    sget-object v8, Lrpb;->d:Lqpb;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lmb8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v8, v4, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnb8;

    move-object/from16 v27, v0

    move-object/from16 v25, p1

    move-object v4, v2

    move-object v2, v5

    move-object/from16 v8, v21

    move-object/from16 v24, v26

    move-object/from16 v26, v28

    move-object/from16 v21, v30

    move/from16 v5, v39

    move-object/from16 v0, p0

    goto :goto_648

    :cond_636
    move-object/from16 v27, v41

    move-object/from16 v0, p0

    move-object/from16 v25, p1

    move-object v4, v2

    move-object v2, v5

    move-object/from16 v8, v21

    move-object/from16 v24, v26

    move-object/from16 v26, v28

    move-object/from16 v21, v30

    move/from16 v5, v39

    :goto_648
    invoke-direct/range {v0 .. v27}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    :goto_64b
    move-object v10, v0

    goto :goto_6a1

    :cond_64d
    move-object/from16 v6, v25

    move-object/from16 v25, v16

    move-object/from16 v16, v6

    move-object/from16 v36, v24

    move-object/from16 v24, v15

    move-object/from16 v53, v19

    move-object/from16 v19, v14

    move-wide/from16 v14, v26

    move-object/from16 v26, v17

    move-object/from16 v27, v18

    move-wide/from16 v17, v28

    move-object/from16 v29, v30

    move-object/from16 v28, v53

    add-int/lit8 v30, v40, 0x1

    move-object/from16 v6, v25

    move-object/from16 v25, v16

    move-object/from16 v16, v6

    move/from16 v6, v30

    move-object/from16 v30, v29

    move-wide/from16 v53, v14

    move-object/from16 v14, v19

    move-object/from16 v15, v24

    move-object/from16 v19, v28

    move-object/from16 v24, v36

    move-wide/from16 v28, v17

    move-object/from16 v17, v26

    move-object/from16 v18, v27

    move-wide/from16 v26, v53

    goto/16 :goto_1ca

    :cond_687
    const/16 v41, 0x0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Bad open type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_69d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3f7 .. :try_end_69d} :catch_69f

    :catch_69d
    const/16 v41, 0x0

    :catch_69f
    :cond_69f
    :goto_69f
    move-object/from16 v10, v41

    :goto_6a1
    if-eqz v10, :cond_6b0

    invoke-virtual {v10}, Lmsh;->b()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, p3

    invoke-interface {v1, v0}, Lwqe;->n(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6b0

    return-object v10

    :cond_6b0
    :goto_6b0
    return-object v41
.end method

.method public static p(Lqre;Lmsh;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/ContentValues;
    .registers 16

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iget-object v1, p1, Loqe;->b:Ljava/lang/String;

    iget-object v2, p1, Lmsh;->x:Ljava/util/List;

    const-string v3, "title"

    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "news_id"

    iget-object v3, p1, Lmsh;->s:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p1, Lmsh;->v:Lp12;

    iget-object v3, v1, Lp12;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v4, "article_id"

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "type"

    iget-object v5, p1, Loqe;->c:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "summary"

    const-string v5, ""

    invoke-virtual {v0, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p1, Lmsh;->i:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "original_img_url"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v1, Lp12;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v5, "request_id"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v5, p1, Lmsh;->o:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v5, "date_time"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-wide v5, p1, Lmsh;->p:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v5, "downloaded_date_time"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget v3, p1, Lmsh;->t:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v5, "share_count"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v3, p0, Lqre;->a:Ljava/lang/String;

    iget-object p0, p0, Lqre;->a:Ljava/lang/String;

    const-string v5, "stream_id"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v3, p1, Lmsh;->j:I

    invoke-static {v3}, Lvep;->g(I)B

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v6, "opentype"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v3, p1, Lmsh;->k:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v6, "insta_url"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p1, Lmsh;->l:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v6, "page_url"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p1, Lmsh;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v6, "like_count"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v3, p1, Lmsh;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v6, "dislike_count"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v3, p1, Lmsh;->u:Ljava/util/List;

    if-eqz v3, :cond_be

    const-string v6, ","

    invoke-static {v6, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "emotions"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_be
    iget-object v3, p1, Lmsh;->m:Landroid/net/Uri;

    if-eqz v3, :cond_cb

    const-string v6, "source_url"

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_cb
    iget-object v3, p1, Lmsh;->n:Landroid/net/Uri;

    if-eqz v3, :cond_d8

    const-string v6, "share_url"

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d8
    iget-object v3, p1, Lmsh;->h:Ljava/lang/String;

    if-eqz v3, :cond_e1

    const-string v6, "source_name"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_e1
    iget-object v3, p1, Lmsh;->q:Ljava/lang/String;

    if-eqz v3, :cond_ea

    const-string v6, "category_name"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_ea
    iget-object v3, p1, Lmsh;->r:Ljava/lang/String;

    if-eqz v3, :cond_f3

    const-string v6, "category_id"

    invoke-virtual {v0, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_f3
    instance-of v3, p1, Ljre;

    if-eqz v3, :cond_112

    move-object p0, p1

    check-cast p0, Ljre;

    iget-object p3, p0, Ljre;->D:Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v3, "secondary_img_url"

    invoke-virtual {v0, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Ljre;->E:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p3, "tertiary_img_url"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2cc

    :cond_112
    instance-of v3, p1, Lire;

    const-string v6, "thumbnail_url"

    if-eqz v3, :cond_1aa

    move-object v3, p1

    check-cast v3, Lire;

    iget-object v7, v3, Lmsh;->v:Lp12;

    iget-object v7, v7, Lp12;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, v3, Lire;->D:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_127
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_149

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/Uri;

    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v10, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v5, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_127

    :cond_149
    iget-object v3, v3, Lire;->E:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_14f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2cc

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lhre;

    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v9, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v5, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v10, v8, Lhre;->a:Landroid/net/Uri;

    if-eqz v10, :cond_173

    const-string v11, "image_url"

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v11, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_173
    iget-object v10, v8, Lhre;->b:Landroid/net/Uri;

    if-eqz v10, :cond_180

    const-string v11, "video_url"

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v11, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_180
    iget-object v10, v8, Lhre;->c:Landroid/net/Uri;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v6, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "description"

    iget-object v11, v8, Lhre;->d:Ljava/lang/String;

    invoke-virtual {v9, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v10, v8, Lhre;->e:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v11, "width"

    invoke-virtual {v9, v11, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v8, v8, Lhre;->f:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v10, "height"

    invoke-virtual {v9, v10, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_14f

    :cond_1aa
    instance-of v3, p1, Lure;

    const-string v7, "logo_url"

    if-eqz v3, :cond_28e

    move-object v3, p1

    check-cast v3, Lure;

    iget-wide v8, v3, Lure;->E:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const-string v9, "video_view_count"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-wide v8, v3, Lure;->F:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const-string v9, "video_upload_timestamp"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget v8, v3, Lure;->G:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "video_duration"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v8, v3, Lure;->H:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "video_width"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v8, v3, Lure;->I:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "video_height"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v8, v3, Lure;->J:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "video_auto_play_flag"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v8, v3, Lure;->K:Landroid/net/Uri;

    if-eqz v8, :cond_200

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_200
    iget v7, v3, Lure;->L:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v8, "video_card_style"

    invoke-virtual {v0, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v7, v3, Lure;->M:Lw9h;

    if-eqz v7, :cond_260

    const-string v8, "publisher_id"

    iget-object v9, v7, Lw9h;->a:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "publisher_name"

    iget-object v9, v7, Lw9h;->b:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "publisher_logo"

    iget-object v9, v7, Lw9h;->c:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v8, v7, Lw9h;->d:Ljava/lang/String;

    if-eqz v8, :cond_22d

    const-string v9, "publisher_description"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_22d
    iget-object v8, v7, Lw9h;->e:Ljava/lang/String;

    if-eqz v8, :cond_236

    const-string v9, "publisher_reason"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_236
    iget-wide v8, v7, Lw9h;->f:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const-string v9, "publisher_last_update_time"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget v8, v7, Lw9h;->g:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "publisher_subscribers"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget v8, v7, Lw9h;->h:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "publisher_posts"

    invoke-virtual {v0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v7, v7, Lw9h;->i:Ljava/lang/String;

    if-eqz v7, :cond_260

    const-string v8, "publisher_infra_feedback"

    invoke-virtual {v0, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_260
    iget-object v7, v3, Lure;->D:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_266
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2cc

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    iget-object v9, v3, Lmsh;->v:Lp12;

    iget-object v9, v9, Lp12;->b:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {v10, v4, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v5, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v10, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_266

    :cond_28e
    instance-of p0, p1, Lrre;

    if-eqz p0, :cond_2aa

    move-object p0, p1

    check-cast p0, Lrre;

    iget-object p3, p0, Lrre;->D:Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, v7, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean p0, p0, Lrre;->E:Z

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string p3, "is_headlines_carousel_article"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_2cc

    :cond_2aa
    instance-of p0, p1, Lfre;

    if-eqz p0, :cond_2cc

    move-object p0, p1

    check-cast p0, Lfre;

    iget-object p0, p0, Lfre;->D:Ljb8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p3, Lrpb;->d:Lqpb;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Ljb8;->Companion:Lib8;

    invoke-virtual {v3}, Lib8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    check-cast v3, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p3, p0, v3}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    const-string p3, "banner"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2cc
    :goto_2cc
    iget-object p0, p1, Lmsh;->B:Lnb8;

    if-eqz p0, :cond_2e6

    sget-object p3, Lrpb;->d:Lqpb;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lnb8;->Companion:Lmb8;

    invoke-virtual {v3}, Lmb8;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    check-cast v3, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p3, p0, v3}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    const-string p3, "event_carousel"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2e6
    iget-object p0, v1, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_2f1

    const-string p3, "more_id"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2f1
    iget-object p0, v1, Lp12;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_2fc

    const-string p3, "hot_topic_id"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2fc
    iget-object p0, v1, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_307

    const-string p3, "category"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_307
    iget-object p0, v1, Lp12;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_312

    const-string p3, "recommend_type"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_312
    iget-object p0, v1, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_31d

    const-string p3, "infra_feedback"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_31d
    iget-object p0, v1, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_328

    const-string p3, "related_original_news_entry_id"

    invoke-virtual {v0, p3, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_328
    if-eqz p2, :cond_32f

    const-string p0, "secondary_id"

    invoke-virtual {v0, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_32f
    iget-object p0, p1, Lmsh;->w:Ljava/util/List;

    if-nez p0, :cond_335

    if-eqz v2, :cond_36e

    :cond_335
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const/4 p3, 0x0

    if-eqz p0, :cond_350

    const-string v1, "not_interested"

    invoke-static {p0}, Lo0g;->M0(Ljava/util/List;)Lvpb;

    move-result-object p0

    :try_start_343
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p2, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_34a
    .catch Lorg/json/JSONException; {:try_start_343 .. :try_end_34a} :catch_34b

    goto :goto_350

    :catch_34b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object p3

    :cond_350
    :goto_350
    if-eqz v2, :cond_365

    const-string p0, "report"

    invoke-static {v2}, Lo0g;->M0(Ljava/util/List;)Lvpb;

    move-result-object v1

    :try_start_358
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_35f
    .catch Lorg/json/JSONException; {:try_start_358 .. :try_end_35f} :catch_360

    goto :goto_365

    :catch_360
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object p3

    :cond_365
    :goto_365
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "feedback_reason_map"

    invoke-virtual {v0, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_36e
    iget-object p0, p1, Lmsh;->y:Ljava/lang/String;

    if-eqz p0, :cond_377

    const-string p2, "local_news_city_name"

    invoke-virtual {v0, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_377
    iget-object p0, p1, Lmsh;->z:Lxlg;

    if-eqz p0, :cond_391

    sget-object p1, Lrpb;->d:Lqpb;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lxlg;->Companion:Lwlg;

    invoke-virtual {p2}, Lwlg;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, p0, p2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "podcast"

    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_391
    return-object v0
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .registers 2

    iget-object v0, p0, Lxqe;->g:Ljava/util/List;

    if-nez v0, :cond_6

    iget-object v0, p0, Lxqe;->h:Ljava/util/ArrayList;

    :cond_6
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final b(Ljava/util/List;Z)V
    .registers 5

    iget-object v0, p0, Lxqe;->g:Ljava/util/List;

    if-nez v0, :cond_9

    iget-object v0, p0, Lxqe;->a:Li32;

    invoke-virtual {v0}, Lldk;->i()V

    :cond_9
    iget-object v0, p0, Lxqe;->g:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0, v0}, Lxqe;->o(Ljava/util/List;)V

    invoke-virtual {p0, v1}, Lxqe;->l(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-virtual {p0, p2}, Lxqe;->k(Z)V

    return-void
.end method

.method public final k(Z)V
    .registers 10

    iget-object p0, p0, Lxqe;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La53;

    iget-object v0, v0, La53;->a:Lwue;

    iget-object v1, v0, Lwue;->b:Ltw2;

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lxqe;

    invoke-virtual {v1}, Lxqe;->a()Ljava/util/List;

    move-result-object v1

    iget-object v0, v0, Lwue;->a:Lh7f;

    new-instance v2, Lg7f;

    invoke-direct {v2, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_25
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrw8;

    iget-object v3, v0, Lrw8;->d:Leq6;

    iget-object v3, v3, Leq6;->a:Ljava/lang/Object;

    check-cast v3, Lxw8;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_49

    if-eqz p1, :cond_49

    iget-object v4, v3, Lxw8;->j:Lf92;

    iget-object v5, v3, Lxw8;->l:Ljava/lang/Object;

    iget-object v6, v3, Lxw8;->k:Lv82;

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Lf92;->e(Ljava/lang/Object;Loqe;Lw82;)V

    :cond_49
    invoke-virtual {v0, v1}, Lrw8;->b(Ljava/util/List;)Lg95;

    move-result-object v0

    iget-object v3, v3, Lxw8;->x:Lww8;

    iget-object v4, v3, Lww8;->b:Lwr9;

    iput-object v0, v4, Lwr9;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lww8;->a(Z)V

    goto :goto_25

    :cond_58
    return-void
.end method

.method public final l(Ljava/util/List;)V
    .registers 5

    iget-object p0, p0, Lxqe;->c:Luy8;

    if-eqz p0, :cond_66

    iget-boolean v0, p0, Luy8;->j:Z

    if-eqz v0, :cond_66

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_c
    :goto_c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_63

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loqe;

    instance-of v1, v0, Lmsh;

    if-eqz v1, :cond_22

    check-cast v0, Lmsh;

    invoke-virtual {p0, v0}, Luy8;->g(Lmsh;)V

    goto :goto_c

    :cond_22
    instance-of v1, v0, Lere;

    if-eqz v1, :cond_c

    iget-object v1, p0, Luy8;->H:Lk5o;

    check-cast v0, Lere;

    iget-object v1, v1, Lk5o;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v2, v0, Lere;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "carousel"

    iget-object v2, v0, Loqe;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, v0, Lere;->i:Lnb8;

    if-eqz v1, :cond_4d

    if-eqz v2, :cond_4d

    iget-object v1, v2, Lnb8;->i:Ljava/lang/String;

    iget-object v2, p0, Luy8;->F:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v2, p0, Luy8;->G:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_4d
    iget-object v0, v0, Lere;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_53
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmsh;

    invoke-virtual {p0, v1}, Luy8;->g(Lmsh;)V

    goto :goto_53

    :cond_63
    invoke-virtual {p0}, Luy8;->n()V

    :cond_66
    return-void
.end method

.method public final n(Ljava/lang/Runnable;)V
    .registers 2

    iget-object p0, p0, Lxqe;->a:Li32;

    invoke-virtual {p0, p1}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final o(Ljava/util/List;)V
    .registers 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lxqe;->a:Li32;

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method
