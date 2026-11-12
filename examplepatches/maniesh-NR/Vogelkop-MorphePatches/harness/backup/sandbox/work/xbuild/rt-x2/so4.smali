.class public final synthetic Lso4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxo4;
.implements Lvlf;
.implements Ln5o;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Ldid;
.implements Lvid;
.implements Lzpd;
.implements Lop5;
.implements Lyyk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lso4;->a:B

    iput-object p1, p0, Lso4;->c:Ljava/lang/Object;

    iput p2, p0, Lso4;->b:I

    iput-object p3, p0, Lso4;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 5

    .line 12
    iput-byte p4, p0, Lso4;->a:B

    iput-object p1, p0, Lso4;->c:Ljava/lang/Object;

    iput-object p2, p0, Lso4;->d:Ljava/lang/Object;

    iput p3, p0, Lso4;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;)V
    .registers 8

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lpyl;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget v2, v0, Lpyl;->b:I

    iget p0, p0, Lso4;->b:I

    if-ne v2, p0, :cond_52

    if-eqz p1, :cond_4c

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_1b
    if-ge v4, v2, :cond_2b

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lbre;

    iget-object v5, v5, Lbre;->a:Ljava/lang/String;

    invoke-virtual {p0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_2b
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_2f
    :goto_2f
    if-ge v3, v2, :cond_45

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lbre;

    iget-object v5, v4, Lbre;->a:Ljava/lang/String;

    invoke-virtual {p0, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2f

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_45
    iget-object p0, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Lau9;

    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_4c
    iget-object p0, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Lhu5;

    if-nez p0, :cond_53

    :cond_52
    return-void

    :cond_53
    const/4 p1, 0x0

    iput-object p1, v0, Lpyl;->f:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lhu5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 5

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lnpd;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, Lnod;

    check-cast p1, Lcom/google/common/util/concurrent/ListenableFuture;

    :try_start_a
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le4j;

    const-string v2, "SessionResult must not be null"

    invoke-static {p1, v2}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/util/concurrent/CancellationException; {:try_start_a .. :try_end_15} :catch_2e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_a .. :try_end_15} :catch_16
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_15} :catch_16

    goto :goto_3a

    :catch_16
    move-exception p1

    const-string v2, "Session operation failed"

    invoke-static {v2, p1}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v2, Le4j;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/UnsupportedOperationException;

    if-eqz p1, :cond_28

    const/4 p1, -0x6

    goto :goto_29

    :cond_28
    const/4 p1, -0x1

    :goto_29
    invoke-direct {v2, p1}, Le4j;-><init>(I)V

    move-object p1, v2

    goto :goto_3a

    :catch_2e
    move-exception p1

    const-string v2, "Session operation cancelled"

    invoke-static {v2, p1}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p1, Le4j;

    const/4 v2, 0x1

    invoke-direct {p1, v2}, Le4j;-><init>(I)V

    :goto_3a
    iget p0, p0, Lso4;->b:I

    invoke-static {v0, v1, p0, p1}, Lxqd;->Y0(Lnpd;Lnod;ILe4j;)V

    return-void
.end method

.method public final b(Lnod;)V
    .registers 21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v1, Lso4;->c:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Laqd;

    iget-object v0, v1, Lso4;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lmid;

    iget-object v0, v4, Lmid;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string v0, "onAddQueueItem(): Media ID shouldn\'t be empty"

    invoke-static {v0}, Lw7d;->K(Ljava/lang/String;)V

    return-void

    :cond_1c
    sget v0, Lnac;->a:I

    iget-object v0, v4, Lmid;->a:Ljava/lang/String;

    new-instance v5, Lfjd;

    invoke-direct {v5}, Lfjd;-><init>()V

    sget-object v6, Lh1b;->b:La1b;

    sget-object v6, Lcsh;->e:Lcsh;

    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v6, Lh1b;->b:La1b;

    sget-object v6, Lcsh;->e:Lcsh;

    new-instance v6, Lkjd;

    invoke-direct {v6}, Lkjd;-><init>()V

    sget-object v7, Lnjd;->d:Lnjd;

    if-nez v0, :cond_3a

    const-string v0, ""

    :cond_3a
    move-object v8, v0

    new-instance v0, Lua7;

    const/16 v7, 0x17

    const/4 v14, 0x0

    invoke-direct {v0, v7, v14}, Lua7;-><init>(BZ)V

    iget-object v7, v4, Lmid;->i:Landroid/net/Uri;

    iput-object v7, v0, Lua7;->b:Ljava/lang/Object;

    new-instance v13, Lnjd;

    invoke-direct {v13, v0}, Lnjd;-><init>(Lua7;)V

    iget-object v7, v4, Lmid;->b:Ljava/lang/CharSequence;

    new-instance v9, Lujd;

    invoke-direct {v9}, Lujd;-><init>()V

    iget-object v0, v4, Lmid;->c:Ljava/lang/CharSequence;

    iput-object v0, v9, Lujd;->f:Ljava/lang/CharSequence;

    iget-object v0, v4, Lmid;->d:Ljava/lang/CharSequence;

    iput-object v0, v9, Lujd;->g:Ljava/lang/CharSequence;

    iget-object v0, v4, Lmid;->g:Landroid/net/Uri;

    iput-object v0, v9, Lujd;->m:Landroid/net/Uri;

    const/4 v10, 0x0

    invoke-static {v10}, Lnac;->c(Lyjh;)Lxjh;

    move-result-object v0

    iput-object v0, v9, Lujd;->i:Lxjh;

    iget-object v0, v4, Lmid;->e:Landroid/graphics/Bitmap;

    if-nez v0, :cond_6c

    move-object v0, v10

    goto :goto_97

    :cond_6c
    iget-object v11, v4, Lmid;->f:[B

    if-nez v11, :cond_95

    :try_start_70
    new-instance v11, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v11}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_75} :catch_8f

    :try_start_75
    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v0, v12, v14, v11}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    iput-object v0, v4, Lmid;->f:[B
    :try_end_80
    .catchall {:try_start_75 .. :try_end_80} :catchall_84

    :try_start_80
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_83
    .catch Ljava/io/IOException; {:try_start_80 .. :try_end_83} :catch_8f

    goto :goto_95

    :catchall_84
    move-exception v0

    move-object v12, v0

    :try_start_86
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_89
    .catchall {:try_start_86 .. :try_end_89} :catchall_8a

    goto :goto_8e

    :catchall_8a
    move-exception v0

    :try_start_8b
    invoke-virtual {v12, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8e
    throw v12
    :try_end_8f
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_8f} :catch_8f

    :catch_8f
    move-exception v0

    const-string v11, "Failed to compress MediaDescriptionCompat artwork"

    invoke-static {v11, v0}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_95
    :goto_95
    iget-object v0, v4, Lmid;->f:[B

    :goto_97
    const/4 v11, 0x3

    if-eqz v0, :cond_a1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v9, v0, v12}, Lujd;->b([BLjava/lang/Integer;)V

    :cond_a1
    iget-object v0, v4, Lmid;->h:Landroid/os/Bundle;

    if-eqz v0, :cond_aa

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10, v0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    :cond_aa
    if-eqz v10, :cond_f6

    const-string v0, "android.media.extra.BT_FOLDER_TYPE"

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f6

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v4, v15, v17

    if-eqz v4, :cond_ec

    const-wide/16 v17, 0x1

    cmp-long v4, v15, v17

    if-nez v4, :cond_c6

    const/4 v11, 0x1

    goto :goto_ed

    :cond_c6
    const-wide/16 v17, 0x2

    cmp-long v4, v15, v17

    if-nez v4, :cond_ce

    const/4 v11, 0x2

    goto :goto_ed

    :cond_ce
    const-wide/16 v17, 0x3

    cmp-long v4, v15, v17

    if-eqz v4, :cond_ed

    const-wide/16 v11, 0x4

    cmp-long v4, v15, v11

    if-nez v4, :cond_dc

    const/4 v11, 0x4

    goto :goto_ed

    :cond_dc
    const-wide/16 v11, 0x5

    cmp-long v4, v15, v11

    if-nez v4, :cond_e4

    const/4 v11, 0x5

    goto :goto_ed

    :cond_e4
    const-wide/16 v11, 0x6

    cmp-long v4, v15, v11

    if-nez v4, :cond_ec

    const/4 v11, 0x6

    goto :goto_ed

    :cond_ec
    move v11, v14

    :cond_ed
    :goto_ed
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v9, Lujd;->p:Ljava/lang/Integer;

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_f6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, v9, Lujd;->q:Ljava/lang/Boolean;

    if-eqz v10, :cond_112

    const-string v0, "androidx.media3.session.EXTRAS_KEY_MEDIA_TYPE_COMPAT"

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_112

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v11

    long-to-int v4, v11

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v9, Lujd;->G:Ljava/lang/Integer;

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_112
    if-eqz v10, :cond_12d

    const-string v0, "androidx.media.utils.extras.CUSTOM_BROWSER_ACTION_ID_LIST"

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12d

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v0

    invoke-static {v0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v0

    iput-object v0, v9, Lujd;->I:Lh1b;

    :cond_12d
    if-eqz v10, :cond_143

    const-string v0, "androidx.media3.mediadescriptioncompat.title"

    invoke-virtual {v10, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_143

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, v9, Lujd;->a:Ljava/lang/CharSequence;

    iput-object v7, v9, Lujd;->e:Ljava/lang/CharSequence;

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_145

    :cond_143
    iput-object v7, v9, Lujd;->a:Ljava/lang/CharSequence;

    :goto_145
    if-eqz v10, :cond_14f

    invoke-virtual {v10}, Landroid/os/BaseBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14f

    iput-object v10, v9, Lujd;->H:Landroid/os/Bundle;

    :cond_14f
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, v9, Lujd;->r:Ljava/lang/Boolean;

    new-instance v12, Lvjd;

    invoke-direct {v12, v9}, Lvjd;-><init>(Lujd;)V

    new-instance v7, Lqjd;

    new-instance v9, Lhjd;

    invoke-direct {v9, v5}, Lgjd;-><init>(Lfjd;)V

    new-instance v11, Lljd;

    invoke-direct {v11, v6}, Lljd;-><init>(Lkjd;)V

    const/4 v10, 0x0

    invoke-direct/range {v7 .. v13}, Lqjd;-><init>(Ljava/lang/String;Lhjd;Lmjd;Lljd;Lvjd;Lnjd;)V

    iget-object v0, v3, Laqd;->f:Lnpd;

    invoke-static {v7}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lnpd;->k(Lnod;Lcsh;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v4, Lro9;

    iget v1, v1, Lso4;->b:I

    invoke-direct {v4, v3, v2, v1}, Lro9;-><init>(Laqd;Lnod;I)V

    new-instance v1, Lvr9;

    invoke-direct {v1, v0, v4, v14}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v2, Lm97;->a:Lm97;

    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public final c(Lssa;I)V
    .registers 10

    iget-byte v0, p0, Lso4;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lso4;->d:Ljava/lang/Object;

    iget v3, p0, Lso4;->b:I

    iget-object p0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast p0, Lgid;

    packed-switch v0, :pswitch_data_60

    check-cast v2, Ljava/util/List;

    iget-object p0, p0, Lgid;->c:Llid;

    new-instance v0, Lk14;

    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object v4

    const/4 v5, 0x0

    :goto_19
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_2f

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqjd;

    invoke-virtual {v6, v1}, Lqjd;->c(Z)Landroid/os/Bundle;

    move-result-object v6

    invoke-virtual {v4, v6}, Lv0b;->c(Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    :cond_2f
    invoke-virtual {v4}, Lz0b;->g()Lcsh;

    move-result-object v1

    invoke-direct {v0, v1}, Lk14;-><init>(Ljava/util/List;)V

    invoke-interface {p1, p0, p2, v3, v0}, Lssa;->v0(Lksa;IILandroid/os/IBinder;)V

    return-void

    :pswitch_3a
    check-cast v2, Lqjd;

    iget-object v0, p0, Lgid;->n:Lm4j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lm4j;->a:Ln4j;

    iget v0, v0, Ln4j;->c:I

    iget-object p0, p0, Lgid;->c:Llid;

    const/4 v4, 0x2

    if-lt v0, v4, :cond_52

    invoke-virtual {v2, v1}, Lqjd;->c(Z)Landroid/os/Bundle;

    move-result-object v0

    invoke-interface {p1, p0, p2, v3, v0}, Lssa;->P0(Lksa;IILandroid/os/Bundle;)V

    goto :goto_5e

    :cond_52
    add-int/lit8 v0, v3, 0x1

    invoke-virtual {v2, v1}, Lqjd;->c(Z)Landroid/os/Bundle;

    move-result-object v1

    invoke-interface {p1, p0, p2, v0, v1}, Lssa;->r(Lksa;IILandroid/os/Bundle;)V

    invoke-interface {p1, p0, p2, v3}, Lssa;->v(Lksa;II)V

    :goto_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x5
        :pswitch_3a
    .end packed-switch
.end method

.method public final execute()Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, Ldp2;

    iget-object v0, v0, Lks3;->d:Ljava/lang/Object;

    check-cast v0, Lx77;

    iget p0, p0, Lso4;->b:I

    add-int/lit8 p0, p0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Lx77;->n(Ldp2;IZ)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lwz5;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/CharSequence;

    check-cast p1, Lkotlin/Unit;

    iget-object p1, v0, Lwz5;->a:Ljava/lang/String;

    iget-object v2, v0, Lwz5;->c:Ljava/lang/String;

    new-instance v3, Lnhj;

    invoke-direct {v3}, Lnhj;-><init>()V

    iput-object v0, v3, Lnhj;->a:Landroid/content/Context;

    iput-object p1, v3, Lnhj;->b:Ljava/lang/String;

    iput-object v1, v3, Lnhj;->e:Ljava/lang/CharSequence;

    iget p0, p0, Lso4;->b:I

    invoke-static {p0, v0}, Landroidx/core/graphics/drawable/IconCompat;->c(ILandroid/content/Context;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p0

    iput-object p0, v3, Lnhj;->h:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    filled-new-array {p0}, [Landroid/content/Intent;

    move-result-object p0

    iput-object p0, v3, Lnhj;->c:[Landroid/content/Intent;

    iget-object p0, v3, Lnhj;->e:Ljava/lang/CharSequence;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/4 p1, 0x0

    if-nez p0, :cond_101

    iget-object p0, v3, Lnhj;->c:[Landroid/content/Intent;

    if-eqz p0, :cond_fb

    array-length p0, p0

    if-eqz p0, :cond_fb

    const-class p0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v0, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/ShortcutManager;

    invoke-virtual {v3}, Lnhj;->a()Landroid/content/pm/ShortcutInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/pm/ShortcutManager;->createShortcutResultIntent(Landroid/content/pm/ShortcutInfo;)Landroid/content/Intent;

    move-result-object p0

    if-nez p0, :cond_55

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    :cond_55
    iget-object v0, v3, Lnhj;->c:[Landroid/content/Intent;

    array-length v1, v0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    aget-object v0, v0, v1

    const-string v1, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, v3, Lnhj;->e:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, v3, Lnhj;->h:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz v0, :cond_fa

    iget-object v1, v3, Lnhj;->a:Landroid/content/Context;

    iget v3, v0, Landroidx/core/graphics/drawable/IconCompat;->a:I

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-ne v3, v5, :cond_bc

    iget-object v3, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    if-eqz v3, :cond_bc

    check-cast v3, Ljava/lang/String;

    const-string v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_bc

    const/4 v7, -0x1

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v2

    const-string v9, "/"

    invoke-virtual {v8, v9, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v10

    aget-object v10, v10, v4

    invoke-virtual {v8, v9, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v2

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v4

    const-string v6, "0_resource_name_obfuscated"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_bc

    invoke-virtual {v0}, Landroidx/core/graphics/drawable/IconCompat;->f()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroidx/core/graphics/drawable/IconCompat;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v8, v10, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    iget v6, v0, Landroidx/core/graphics/drawable/IconCompat;->e:I

    if-eq v6, v3, :cond_bc

    iput v3, v0, Landroidx/core/graphics/drawable/IconCompat;->e:I

    :cond_bc
    iget v3, v0, Landroidx/core/graphics/drawable/IconCompat;->a:I

    if-eq v3, v2, :cond_f1

    if-eq v3, v5, :cond_d4

    const/4 v1, 0x5

    if-ne v3, v1, :cond_ce

    iget-object p1, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p1}, Landroidx/core/graphics/drawable/IconCompat;->a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_f5

    :cond_ce
    const-string p0, "Icon type not supported for intent shortcuts"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p1

    :cond_d4
    :try_start_d4
    invoke-virtual {v0}, Landroidx/core/graphics/drawable/IconCompat;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.intent.extra.shortcut.ICON_RESOURCE"

    iget v3, v0, Landroidx/core/graphics/drawable/IconCompat;->e:I

    invoke-static {v1, v3}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_e7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_d4 .. :try_end_e7} :catch_e8

    return-object p0

    :catch_e8
    move-exception p0

    const-string v1, "Can\'t find package "

    iget-object v0, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    invoke-static {v1, v0, p0}, Lsjn;->l(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-object p1

    :cond_f1
    iget-object p1, v0, Landroidx/core/graphics/drawable/IconCompat;->b:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    :goto_f5
    const-string v0, "android.intent.extra.shortcut.ICON"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_fa
    return-object p0

    :cond_fb
    const-string p0, "Shortcut must have an intent"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p1

    :cond_101
    const-string p0, "Shortcut must have a non-empty label"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p1
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 5

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, [Lcom/google/android/gms/cast/MediaQueueItem;

    iget-object v0, v0, Lzo4;->l:[I

    array-length v2, v0

    iget p0, p0, Lso4;->b:I

    if-ge p0, v2, :cond_12

    aget p0, v0, p0

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    const/4 v0, 0x0

    invoke-virtual {p1, v1, p0, v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueInsertItems([Lcom/google/android/gms/cast/MediaQueueItem;ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 5

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, Lzzb;

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, Ltzb;

    iget v2, v0, Lzzb;->d:I

    iget p0, p0, Lso4;->b:I

    if-eq v2, p0, :cond_f

    return-void

    :cond_f
    invoke-virtual {v0}, Lzzb;->H()V

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v1, v1, Ltzb;->a:Ljava/lang/String;

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v1, "language: %s, exception: %s"

    invoke-static {p0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Failed to install language"

    invoke-static {p1, p0}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lzzb;->I()V

    return-void
.end method

.method public final run(J)V
    .registers 6

    iget-object v0, p0, Lso4;->c:Ljava/lang/Object;

    check-cast v0, [B

    iget-object v1, p0, Lso4;->d:Ljava/lang/Object;

    check-cast v1, [B

    sget-object v2, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    iget p0, p0, Lso4;->b:I

    invoke-static {p1, p2, v0, p0, v1}, LJ/N;->Mf7HZHqV(JLjava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 7

    iget-byte p1, p0, Lso4;->a:B

    iget-object v0, p0, Lso4;->d:Ljava/lang/Object;

    iget v1, p0, Lso4;->b:I

    iget-object p0, p0, Lso4;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_6c

    check-cast p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    check-cast v0, Ldlm;

    iget-object p1, v0, Ldlm;->a:Lclm;

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz p2, :cond_4b

    iget-boolean v3, p1, Lclm;->a:Z

    if-eqz v3, :cond_4b

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object v3

    iget-object v3, v3, Lrlm;->c:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnlm;

    invoke-static {v3}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->H0(Lnlm;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_4b

    iget-object v3, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;->s:Lpt1;

    if-eqz v3, :cond_33

    move-object v2, v3

    :cond_33
    iget-object v2, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lvs;

    iget-object v2, v2, Lvs;->d:Ljava/lang/Object;

    check-cast v2, Lvs;

    iget-object v2, v2, Lvs;->d:Ljava/lang/Object;

    check-cast v2, Lb7k;

    iget-object v2, v2, Lb7k;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_4b
    invoke-virtual {v0, v1, v2, p2}, Lrlm;->h(ILjava/lang/String;Z)V

    iget-boolean p1, p1, Lclm;->a:Z

    if-eqz p1, :cond_54

    if-nez p2, :cond_57

    :cond_54
    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->J0()V

    :cond_57
    return-void

    :pswitch_58
    check-cast p0, Lcn5;

    check-cast v0, Ldn5;

    iget-boolean p1, v0, Ldn5;->e:Z

    if-eq p2, p1, :cond_6b

    iput-boolean p2, v0, Ldn5;->e:Z

    iget-object p0, p0, Lcn5;->c:Ljl4;

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lx93;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_58
    .end packed-switch
.end method
