.class public final Lbp4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkg;


# instance fields
.field public final a:Lzo4;

.field public final b:Lzn4;

.field public final c:Lhp2;

.field public final d:Lokg;

.field public final e:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lzo4;Lzn4;Lhp2;Lokg;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lbp4;->e:Ljava/util/HashMap;

    iput-object p1, p0, Lbp4;->a:Lzo4;

    iput-object p2, p0, Lbp4;->b:Lzn4;

    iput-object p3, p0, Lbp4;->c:Lhp2;

    iput-object p4, p0, Lbp4;->d:Lokg;

    return-void
.end method


# virtual methods
.method public final a(Lvjd;Legd;)Lvjd;
    .registers 6

    invoke-static {p1}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_83

    invoke-virtual {p2}, Legd;->c()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lzi4;->E(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_83

    iget-object p0, p0, Lbp4;->b:Lzn4;

    iget-object p0, p0, Lzn4;->e:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_83

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_83

    invoke-virtual {p0}, Landroid/net/Uri;->getPort()I

    move-result v1

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v2

    if-ne v1, v2, :cond_83

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_83

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v1, "/media/"

    invoke-virtual {p0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_83

    invoke-virtual {p2}, Legd;->c()Landroid/net/Uri;

    move-result-object p0

    iget-object p2, p1, Lvjd;->I:Landroid/os/Bundle;

    if-nez p2, :cond_76

    if-eqz p0, :cond_83

    invoke-virtual {p1}, Lvjd;->a()Lujd;

    move-result-object p1

    invoke-static {p0}, Lsfe;->L(Landroid/net/Uri;)Landroid/os/Bundle;

    move-result-object p0

    iput-object p0, p1, Lujd;->H:Landroid/os/Bundle;

    new-instance p0, Lvjd;

    invoke-direct {p0, p1}, Lvjd;-><init>(Lujd;)V

    return-object p0

    :cond_76
    if-eqz p0, :cond_7d

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7e

    :cond_7d
    const/4 p0, 0x0

    :goto_7e
    const-string v0, "com.opera.android.media.MEDIA_URI"

    invoke-virtual {p2, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_83
    return-object p1
.end method

.method public final b()V
    .registers 6

    iget-object p0, p0, Lbp4;->a:Lzo4;

    iget-boolean v0, p0, Lzo4;->M:Z

    iget-object v1, p0, Lzo4;->k:Ljava/util/ArrayList;

    if-eqz v0, :cond_2c

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, p0, Lzo4;->N:Ljij;

    const/4 v3, 0x0

    invoke-static {v3, v0, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object v0

    new-instance v2, Lhij;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v2, v4}, Lhij;-><init>(I)V

    iput-object v2, p0, Lzo4;->N:Ljij;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lzo4;->N:Ljij;

    invoke-static {v3, v1, v2}, Lzo4;->B0(IILjij;)[I

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lzo4;->E0([I[I)V

    return-void

    :cond_2c
    new-instance v0, Lhij;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lhij;-><init>(I)V

    iput-object v0, p0, Lzo4;->N:Ljij;

    return-void
.end method

.method public final c(II)V
    .registers 3

    iget-object p0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {p0, p1, p2}, Lg83;->h0(II)V

    return-void
.end method

.method public final clear()V
    .registers 5

    iget-object v0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {v0}, Lg83;->f()V

    iget-object v0, p0, Lbp4;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object p0, p0, Lbp4;->b:Lzn4;

    iget-object v0, p0, Lzn4;->c:Ljava/util/HashSet;

    iget-object v1, p0, Lzn4;->d:Lcom/opera/android/http/server/HttpServer;

    iget-object v2, p0, Lzn4;->b:Ljava/util/HashSet;

    iget-boolean p0, p0, Lzn4;->g:Z

    if-eqz p0, :cond_17

    return-void

    :cond_17
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/opera/android/http/server/HttpServer;->a(Ljava/lang/String;)V

    goto :goto_1b

    :cond_2b
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_32
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_42

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/opera/android/http/server/HttpServer;->a(Ljava/lang/String;)V

    goto :goto_32

    :cond_42
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    return-void
.end method

.method public final d([Lmkg;IJ)V
    .registers 5

    invoke-virtual {p0, p1}, Lbp4;->i([Lmkg;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object p0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {p0, p2, p1, p3, p4}, Lzo4;->x(ILjava/util/List;J)V

    return-void
.end method

.method public final destroy()V
    .registers 1

    iget-object p0, p0, Lbp4;->b:Lzn4;

    invoke-virtual {p0}, Lzn4;->a()V

    return-void
.end method

.method public final e(Ljava/lang/String;)Landroid/net/Uri;
    .registers 2

    iget-object p0, p0, Lbp4;->e:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0
.end method

.method public final f()Lkod;
    .registers 3

    new-instance v0, Lap4;

    iget-object p0, p0, Lbp4;->d:Lokg;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final g(I[Lmkg;)V
    .registers 4

    invoke-virtual {p0, p2}, Lbp4;->i([Lmkg;)Ljava/util/ArrayList;

    move-result-object p2

    iget-object p0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {p0}, Lg83;->p()I

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p0, p2}, Lzo4;->r0(Ljava/util/List;)V

    return-void

    :cond_10
    const/4 v0, -0x1

    if-ne p1, v0, :cond_17

    invoke-virtual {p0, p2}, Lg83;->j0(Ljava/util/List;)V

    return-void

    :cond_17
    invoke-virtual {p0, p1, p2}, Lzo4;->b0(ILjava/util/List;)V

    return-void
.end method

.method public final h(Lod3;Z)V
    .registers 5

    iget-object p0, p0, Lbp4;->a:Lzo4;

    if-eqz p2, :cond_1b

    const/4 p2, 0x0

    :goto_5
    invoke-virtual {p0}, Lg83;->p()I

    move-result v0

    if-ge p2, v0, :cond_33

    invoke-virtual {p0, p2}, Lg83;->Q(I)Lqjd;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1, v0}, Lod3;->c(Ljava/lang/Integer;Lqjd;)V

    :cond_18
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_1b
    invoke-virtual {p0}, Lg83;->p()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_21
    if-ltz p2, :cond_33

    invoke-virtual {p0, p2}, Lg83;->Q(I)Lqjd;

    move-result-object v0

    if-eqz v0, :cond_30

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1, v0}, Lod3;->c(Ljava/lang/Integer;Lqjd;)V

    :cond_30
    add-int/lit8 p2, p2, -0x1

    goto :goto_21

    :cond_33
    return-void
.end method

.method public final i([Lmkg;)Ljava/util/ArrayList;
    .registers 35

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Ljava/util/ArrayList;

    array-length v3, v1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    array-length v3, v1

    const/4 v5, 0x0

    :goto_c
    if-ge v5, v3, :cond_198

    aget-object v6, v1, v5

    iget-object v7, v6, Lmkg;->a:Lvjd;

    iget-object v8, v6, Lmkg;->c:Landroid/graphics/Bitmap;

    iget-object v9, v6, Lmkg;->b:Legd;

    invoke-static {v7}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object v10

    iget-object v11, v7, Lvjd;->I:Landroid/os/Bundle;

    const/4 v12, 0x0

    if-eqz v11, :cond_26

    const-string v13, "com.opera.android.media.FILE_TYPE"

    invoke-virtual {v11, v13, v12}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_27

    :cond_26
    move-object v11, v12

    :goto_27
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2f

    iget-object v11, v9, Legd;->c:Ljava/lang/String;

    :cond_2f
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3d

    const-string v13, "application/octet-stream"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_55

    :cond_3d
    invoke-virtual {v10}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_55

    invoke-static {v13}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v11, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v13

    invoke-virtual {v13, v11}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :cond_55
    move-object v15, v11

    invoke-static {v10}, Lzi4;->E(Landroid/net/Uri;)Z

    move-result v11

    iget-object v13, v0, Lbp4;->b:Lzn4;

    if-eqz v11, :cond_af

    iget-object v11, v7, Lvjd;->I:Landroid/os/Bundle;

    move/from16 v23, v5

    const-wide/16 v4, -0x1

    if-eqz v11, :cond_6d

    const-string v14, "com.opera.android.media.FILE_LENGTH"

    invoke-virtual {v11, v14, v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    goto :goto_6f

    :cond_6d
    move-wide/from16 v16, v4

    :goto_6f
    iget-boolean v11, v13, Lzn4;->g:Z

    if-eqz v11, :cond_78

    move-object v10, v12

    move-object v4, v13

    move-object/from16 v19, v15

    goto :goto_ab

    :cond_78
    move-object/from16 v19, v15

    invoke-virtual {v13}, Lzn4;->b()Ljava/lang/String;

    move-result-object v15

    iget-object v11, v13, Lzn4;->b:Ljava/util/HashSet;

    invoke-virtual {v11, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v11, v13, Lzn4;->d:Lcom/opera/android/http/server/HttpServer;

    cmp-long v14, v16, v4

    if-nez v14, :cond_8c

    move-wide/from16 v17, v4

    goto :goto_8e

    :cond_8c
    move-wide/from16 v17, v16

    :goto_8e
    iget-wide v4, v11, Lcom/opera/android/http/server/HttpServer;->b:J

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v16

    move-wide/from16 v31, v4

    move-object v4, v13

    move-wide/from16 v13, v31

    invoke-static/range {v13 .. v19}, LJ/N;->Mq9zNq9U(JLjava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;)V

    iget-object v5, v4, Lzn4;->e:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5, v15}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    move-object v10, v5

    :goto_ab
    if-eqz v10, :cond_194

    :goto_ad
    move-object v14, v10

    goto :goto_b5

    :cond_af
    move/from16 v23, v5

    move-object v4, v13

    move-object/from16 v19, v15

    goto :goto_ad

    :goto_b5
    iget-object v5, v7, Lvjd;->a:Ljava/lang/CharSequence;

    iget-object v6, v6, Lmkg;->d:Ljava/lang/String;

    if-nez v6, :cond_c9

    iget-object v6, v0, Lbp4;->c:Lhp2;

    iget-wide v10, v6, Lhp2;->b:J

    const-wide/16 v15, 0x1

    add-long v12, v10, v15

    iput-wide v12, v6, Lhp2;->b:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    :cond_c9
    iget-object v7, v7, Lvjd;->m:Landroid/net/Uri;

    if-nez v7, :cond_104

    if-eqz v8, :cond_104

    iget-boolean v7, v4, Lzn4;->g:Z

    if-eqz v7, :cond_d5

    const/4 v4, 0x0

    goto :goto_ff

    :cond_d5
    invoke-virtual {v4}, Lzn4;->b()Ljava/lang/String;

    move-result-object v7

    iget-object v10, v4, Lzn4;->c:Ljava/util/HashSet;

    invoke-virtual {v10, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v10, v4, Lzn4;->d:Lcom/opera/android/http/server/HttpServer;

    iget-wide v10, v10, Lcom/opera/android/http/server/HttpServer;->b:J

    invoke-static {v10, v11, v7}, LJ/N;->MWJPnKV_(JLjava/lang/Object;)V

    iget-object v10, v4, Lzn4;->f:Ljava/util/concurrent/ExecutorService;

    new-instance v11, Lk3;

    const/16 v12, 0x17

    invoke-direct {v11, v4, v7, v8, v12}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v10, v11}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object v4, v4, Lzn4;->e:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    :goto_ff
    iget-object v7, v0, Lbp4;->e:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_104
    new-instance v4, Lfjd;

    invoke-direct {v4}, Lfjd;-><init>()V

    new-instance v7, Lijd;

    invoke-direct {v7}, Lijd;-><init>()V

    sget-object v18, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v10, Lh1b;->b:La1b;

    sget-object v20, Lcsh;->e:Lcsh;

    new-instance v10, Lkjd;

    invoke-direct {v10}, Lkjd;-><init>()V

    sget-object v30, Lnjd;->d:Lnjd;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lujd;

    invoke-direct {v11}, Lujd;-><init>()V

    if-eqz v5, :cond_12a

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_12b

    :cond_12a
    const/4 v5, 0x0

    :goto_12b
    iput-object v5, v11, Lujd;->a:Ljava/lang/CharSequence;

    invoke-static {v14}, Lsfe;->L(Landroid/net/Uri;)Landroid/os/Bundle;

    move-result-object v5

    iput-object v5, v11, Lujd;->H:Landroid/os/Bundle;

    new-instance v5, Lvjd;

    invoke-direct {v5, v11}, Lvjd;-><init>(Lujd;)V

    iget-object v11, v7, Lijd;->e:Ljava/lang/Object;

    check-cast v11, Landroid/net/Uri;

    if-eqz v11, :cond_146

    iget-object v11, v7, Lijd;->d:Ljava/lang/Object;

    check-cast v11, Ljava/util/UUID;

    if-nez v11, :cond_146

    const/4 v11, 0x0

    goto :goto_147

    :cond_146
    const/4 v11, 0x1

    :goto_147
    invoke-static {v11}, Lz4o;->H(Z)V

    new-instance v27, Lmjd;

    iget-object v11, v7, Lijd;->d:Ljava/lang/Object;

    check-cast v11, Ljava/util/UUID;

    if-eqz v11, :cond_15a

    new-instance v12, Ljjd;

    invoke-direct {v12, v7}, Ljjd;-><init>(Lijd;)V

    move-object/from16 v16, v12

    goto :goto_15c

    :cond_15a
    const/16 v16, 0x0

    :goto_15c
    const/16 v17, 0x0

    move-object/from16 v15, v19

    const/16 v19, 0x0

    const-wide v21, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v13, v27

    invoke-direct/range {v13 .. v22}, Lmjd;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljjd;Ldjd;Ljava/util/List;Ljava/lang/String;Lh1b;J)V

    new-instance v24, Lqjd;

    new-instance v7, Lhjd;

    invoke-direct {v7, v4}, Lgjd;-><init>(Lfjd;)V

    new-instance v4, Lljd;

    invoke-direct {v4, v10}, Lljd;-><init>(Lkjd;)V

    move-object/from16 v28, v4

    move-object/from16 v29, v5

    move-object/from16 v25, v6

    move-object/from16 v26, v7

    invoke-direct/range {v24 .. v30}, Lqjd;-><init>(Ljava/lang/String;Lhjd;Lmjd;Lljd;Lvjd;Lnjd;)V

    move-object/from16 v4, v24

    iget-object v5, v0, Lbp4;->d:Lokg;

    iget-object v7, v5, Lokg;->d:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, v5, Lokg;->e:Ljava/util/HashMap;

    invoke-virtual {v5, v6, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_194
    add-int/lit8 v5, v23, 0x1

    goto/16 :goto_c

    :cond_198
    return-object v2
.end method

.method public final isEmpty()Z
    .registers 1

    iget-object p0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {p0}, Lg83;->p()I

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final remove(I)V
    .registers 6

    iget-object v0, p0, Lbp4;->a:Lzo4;

    invoke-virtual {v0, p1}, Lg83;->Q(I)Lqjd;

    move-result-object v1

    iget-object v2, p0, Lbp4;->b:Lzn4;

    if-eqz v1, :cond_13

    iget-object v3, v1, Lqjd;->c:Lmjd;

    if-eqz v3, :cond_13

    iget-object v3, v3, Lmjd;->a:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Lzn4;->c(Landroid/net/Uri;)V

    :cond_13
    if-eqz v1, :cond_24

    iget-object p0, p0, Lbp4;->e:Ljava/util/HashMap;

    iget-object v1, v1, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    if-eqz p0, :cond_24

    invoke-virtual {v2, p0}, Lzn4;->c(Landroid/net/Uri;)V

    :cond_24
    invoke-virtual {v0, p1}, Lg83;->o(I)V

    return-void
.end method
