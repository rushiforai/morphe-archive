.class public Lir5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkr5;
.implements Lv18;
.implements Lyn8;
.implements Ljr9;
.implements Lw7e;
.implements Llo7;
.implements Lrr9;
.implements Lf8n;
.implements Lhvh;


# static fields
.field public static volatile a:Lir5;

.field public static b:Lb30;


# direct methods
.method public static c(Lh1b;J)[B
    .registers 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx36;

    invoke-virtual {v1}, Lx36;->c()Landroid/os/Bundle;

    move-result-object v2

    iget-object v1, v1, Lx36;->d:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_39

    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v1

    invoke-static {v1}, Lz4o;->H(Z)V

    sget-object v1, Lx36;->x:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    :cond_39
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_3d
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "c"

    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v0, "d"

    invoke-virtual {p0, v0, p1, p2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->marshall()[B

    move-result-object p0

    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    return-object p0
.end method

.method public static e(Landroid/content/Context;Lj2b;ZJ)V
    .registers 11

    sget-object v0, Lj2b;->c:Lj2b;

    if-ne p1, v0, :cond_8

    const-string p1, "https://passwords.google.com/options"

    :goto_6
    move-object v2, p1

    goto :goto_b

    :cond_8
    const-string p1, "https://takeout.google.com"

    goto :goto_6

    :goto_b
    new-instance v3, Lrxh;

    const p1, 0x7f14086a

    invoke-direct {v3, p1}, Lrxh;-><init>(I)V

    sget-object v5, Llqm;->d:Llqm;

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/import_data/ImportChromeDataActivity;

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "extra_try_again_partly"

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "extra_imported_partly"

    invoke-virtual {p0, p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic i(Landroid/content/Context;Lj2b;)V
    .registers 5

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-static {p0, p1, v0, v1, v2}, Lir5;->e(Landroid/content/Context;Lj2b;ZJ)V

    return-void
.end method


# virtual methods
.method public final a(Lk43;Z)V
    .registers 3

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    return-object p1
.end method

.method public final b(Llv0;)V
    .registers 2

    return-void
.end method

.method public final d(Lorb;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p1

    const-string v1, "id"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v3, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1e4

    const-string v5, "publisher"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_27

    sget-object v7, Levj;->d:Ldvj;

    invoke-virtual {v0, v5}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v5

    invoke-virtual {v7, v5}, Ldvj;->t(Lorb;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Levj;

    goto :goto_28

    :cond_27
    const/4 v5, 0x0

    :goto_28
    if-eqz v5, :cond_1dd

    const-string v7, "description"

    invoke-virtual {v0, v7, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "thumbnail"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    const-string v11, "width & height can not be null on Thumbnail."

    const-string v12, "format"

    const-string v13, "preview_url"

    const-string v14, "url"

    const-string v15, "height"

    const/16 p0, 0x0

    const-string v6, "width"

    if-eqz v9, :cond_70

    invoke-virtual {v0, v8}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v9

    invoke-virtual {v9, v6}, Lorb;->g(Ljava/lang/String;)I

    move-result v16

    invoke-virtual {v9, v15}, Lorb;->g(Ljava/lang/String;)I

    move-result v17

    if-eqz v16, :cond_6c

    if-eqz v17, :cond_6c

    invoke-virtual {v9, v14, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v13, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v9, v12, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v9, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    new-instance v9, Lm20;

    move-object/from16 v17, v4

    const/4 v4, 0x2

    invoke-direct {v9, v10, v4}, Lm20;-><init>(Ljava/lang/String;B)V

    goto :goto_74

    :cond_6c
    invoke-static {v11}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object p0

    :cond_70
    move-object/from16 v17, v4

    move-object/from16 v9, p0

    :goto_74
    const-string v4, "thumbnail can\'t be empty for a Post"

    if-eqz v9, :cond_1d5

    const-string v9, "longitude"

    invoke-virtual {v0, v9}, Lorb;->j(Ljava/lang/String;)J

    const-string v9, "latitude"

    invoke-virtual {v0, v9}, Lorb;->j(Ljava/lang/String;)J

    const-string v9, "crawler"

    invoke-virtual {v0, v9}, Lorb;->f(Ljava/lang/String;)Z

    const-string v9, "like_count"

    invoke-virtual {v0, v9}, Lorb;->g(Ljava/lang/String;)I

    const-string v9, "dislike_count"

    invoke-virtual {v0, v9}, Lorb;->g(Ljava/lang/String;)I

    const-string v9, "comment_count"

    invoke-virtual {v0, v9}, Lorb;->g(Ljava/lang/String;)I

    const-string v9, "share_count"

    invoke-virtual {v0, v9}, Lorb;->g(Ljava/lang/String;)I

    const-string v9, "liked"

    invoke-virtual {v0, v9}, Lorb;->f(Ljava/lang/String;)Z

    const-string v9, "disliked"

    invoke-virtual {v0, v9}, Lorb;->f(Ljava/lang/String;)Z

    const-string v9, "favored"

    invoke-virtual {v0, v9}, Lorb;->f(Ljava/lang/String;)Z

    const-string v9, "video"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    move-object/from16 v18, v4

    if-eqz v10, :cond_14b

    invoke-virtual {v0, v9}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v9

    invoke-virtual {v9, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v4, v9, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_143

    invoke-virtual {v9, v6}, Lorb;->g(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v9, v15}, Lorb;->g(Ljava/lang/String;)I

    move-result v20

    move-object/from16 v21, v5

    const-string v5, "has_audio"

    move-object/from16 v22, v7

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    if-eqz v10, :cond_13b

    if-eqz v20, :cond_13b

    const-string v5, "size"

    invoke-virtual {v9, v5}, Lorb;->j(Ljava/lang/String;)J

    const-string v5, "duration"

    invoke-virtual {v9, v5}, Lorb;->g(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v10, p0

    invoke-virtual {v9, v12, v10}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v10, "source_type"

    invoke-virtual {v9, v10, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v10, "source_video_id"

    invoke-virtual {v9, v10, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v9, v14, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_129

    invoke-virtual {v9, v8}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v4

    invoke-virtual {v4, v6}, Lorb;->g(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v15}, Lorb;->g(Ljava/lang/String;)I

    move-result v8

    if-eqz v6, :cond_124

    if-eqz v8, :cond_124

    invoke-virtual {v4, v14, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v13, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v4, v12, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v4, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Lm20;

    const/4 v4, 0x2

    invoke-direct {v1, v6, v4}, Lm20;-><init>(Ljava/lang/String;B)V

    move-object v4, v1

    const/4 v1, 0x0

    goto :goto_12b

    :cond_124
    invoke-static {v11}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    const/4 v1, 0x0

    return-object v1

    :cond_129
    const/4 v1, 0x0

    move-object v4, v1

    :goto_12b
    if-eqz v4, :cond_137

    new-instance v6, Lkog;

    invoke-direct {v6, v4, v10, v5}, Lkog;-><init>(Lm20;Ljava/lang/String;I)V

    invoke-virtual {v6, v9}, Lou9;->b(Lorb;)V

    move-object v10, v6

    goto :goto_151

    :cond_137
    invoke-static/range {v18 .. v18}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_13b
    move-object/from16 v1, p0

    const-string v0, "width & height can not be null on Video."

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_143
    move-object/from16 v1, p0

    const-string v0, "id can\'t be empty for a Video"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_14b
    move-object/from16 v21, v5

    move-object/from16 v22, v7

    const/4 v7, 0x0

    const/4 v10, 0x0

    :goto_151
    if-eqz v10, :cond_1ce

    const-string v1, "board"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_168

    sget-object v4, Ltk3;->e:Lujp;

    invoke-virtual {v0, v1}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v1

    invoke-virtual {v4, v1}, Lujp;->m(Lorb;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltk3;

    goto :goto_169

    :cond_168
    const/4 v1, 0x0

    :goto_169
    const-string v4, "state"

    const/16 v5, 0x64

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    if-eqz v1, :cond_1c7

    const-string v1, "original_type"

    invoke-virtual {v0, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "source_url"

    invoke-virtual {v0, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "share_url"

    invoke-virtual {v0, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "create_time"

    invoke-virtual {v0, v1}, Lorb;->j(Ljava/lang/String;)J

    move-result-wide v8

    const-string v1, "most_viral_time"

    invoke-virtual {v0, v1}, Lorb;->j(Ljava/lang/String;)J

    move/from16 v19, v7

    move-object v7, v10

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "tags"

    invoke-virtual {v0, v1}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v1

    if-eqz v1, :cond_1b8

    move/from16 v4, v19

    :goto_19e
    iget-object v2, v1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v4, v2, :cond_1b8

    sget-object v2, Lgbl;->b:Ldvj;

    invoke-virtual {v1, v4}, Lvpb;->c(I)Lorb;

    move-result-object v3

    invoke-virtual {v2, v3}, Ldvj;->t(Lorb;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgbl;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_19e

    :cond_1b8
    new-instance v3, Llog;

    move-object/from16 v4, v17

    move-object/from16 v5, v21

    move-object/from16 v6, v22

    invoke-direct/range {v3 .. v10}, Llog;-><init>(Ljava/lang/String;Levj;Ljava/lang/String;Lkog;JLjava/util/ArrayList;)V

    invoke-virtual {v3, v0}, Lou9;->b(Lorb;)V

    return-object v3

    :cond_1c7
    const-string v0, "board can\'t be empty for a Post"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    const/4 v1, 0x0

    return-object v1

    :cond_1ce
    const/4 v1, 0x0

    const-string v0, "video can\'t be empty for a Post"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_1d5
    move-object/from16 v1, p0

    move-object/from16 v18, v4

    invoke-static/range {v18 .. v18}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_1dd
    const/4 v1, 0x0

    const-string v0, "author can\'t be empty for a Post"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_1e4
    const/4 v1, 0x0

    const-string v0, "id can\'t be empty for a Post"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public final f(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    return-void
.end method

.method public final g(JJ)J
    .registers 10

    const/16 p0, 0x20

    shr-long v0, p1, p0

    long-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    shr-long v1, p3, p0

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    cmpg-float v0, v0, v1

    const-wide v1, 0xffffffffL

    if-gtz v0, :cond_31

    and-long v3, p1, v1

    long-to-int v0, v3

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    and-long v3, p3, v1

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_31

    const-wide p0, 0x3f8000003f800000L    # 0.007812501848093234

    return-wide p0

    :cond_31
    invoke-static {p1, p2, p3, p4}, Li41;->n(JJ)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p2

    int-to-long p2, p2

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v3, p1

    shl-long/2addr p2, p0

    and-long/2addr v3, v1

    or-long/2addr p2, v3

    return-wide p2
.end method

.method public final h(Lk43;)V
    .registers 2

    return-void
.end method

.method public final m()V
    .registers 1

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 2

    const/4 p0, 0x0

    const-string p1, "In-progress recording shouldn\'t be null"

    invoke-static {p1, p0}, Ljpo;->n(Ljava/lang/String;Z)V

    const/4 p0, 0x0

    throw p0
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/util/List;

    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Attempted to finalize in-progress recording, but no recording is in progress."

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public final p(Lyt7;)V
    .registers 2

    return-void
.end method

.method public final v(Lq18;)V
    .registers 2

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 4

    new-instance p0, Lgra;

    const-class v0, Lxy9;

    const-class v1, Ljava/io/InputStream;

    invoke-virtual {p1, v0, v1}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object p1

    invoke-direct {p0, p1}, Lgra;-><init>(Lv7e;)V

    return-object p0
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    new-instance p0, Ljbf;

    const/16 v0, 0x11

    const-string v1, "score"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0
.end method
