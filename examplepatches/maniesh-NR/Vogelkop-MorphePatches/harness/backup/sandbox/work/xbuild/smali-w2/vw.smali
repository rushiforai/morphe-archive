.class public final synthetic Lvw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;
.implements Lbcf;
.implements Lfjc;
.implements Lvlf;
.implements Lqnb;
.implements Lvid;
.implements Lvqd;
.implements Lop5;
.implements Li82;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    .line 12
    iput-byte p1, p0, Lvw;->a:B

    iput-object p2, p0, Lvw;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lvw;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lvw;->a:B

    iput-object p1, p0, Lvw;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lvw;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLp35;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lvw;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lvw;->b:Z

    iput-object p2, p0, Lvw;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Ljuj;

    iget-boolean p0, p0, Lvw;->b:Z

    invoke-virtual {v0, p0}, Ljuj;->G0(Z)V

    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Lpf2;

    iget-boolean p0, p0, Lvw;->b:Z

    check-cast p1, Lxkg;

    invoke-virtual {p1, v0, p0}, Lgk9;->A(Lpf2;Z)V

    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 5

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Lyw;

    new-instance v1, Lww;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-static {v2, p1}, Lvs;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object p1

    iget-boolean p0, p0, Lvw;->b:Z

    invoke-direct {v1, v0, p1, p0}, Lww;-><init>(Lyw;Lvs;Z)V

    return-object v1
.end method

.method public final d(Loqe;)Lj82;
    .registers 5

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    instance-of v1, p1, Lmre;

    if-nez v1, :cond_22

    instance-of v1, p1, Ldre;

    if-nez v1, :cond_22

    instance-of v1, p1, Lrre;

    if-nez v1, :cond_22

    instance-of v1, p1, Ld9i;

    if-nez v1, :cond_22

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lmsh;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    const/4 p0, 0x0

    return-object p0

    :cond_22
    iget-boolean p0, p0, Lvw;->b:Z

    invoke-static {p1, v0, p0}, Lpue;->e(Loqe;Ljava/lang/String;Z)Lpue;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lvw;->a:B

    iget-boolean v1, p0, Lvw;->b:Z

    iget-object p0, p0, Lvw;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c

    check-cast p0, Lshg;

    check-cast p1, Leig;

    iget-object p0, p0, Lshg;->a:Lgql;

    invoke-interface {p1, p0, v1}, Leig;->K(Lgql;I)V

    return-void

    :pswitch_13
    check-cast p0, Lrb3;

    check-cast p1, Leig;

    invoke-interface {p1, p0, v1}, Leig;->K(Lgql;I)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x2
        :pswitch_13
    .end packed-switch
.end method

.method public final l(Lnpd;Lnod;I)Ljava/lang/Object;
    .registers 16

    iget-byte p3, p0, Lvw;->a:B

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v2, -0x1

    iget-boolean v3, p0, Lvw;->b:Z

    iget-object p0, p0, Lvw;->c:Ljava/lang/Object;

    packed-switch p3, :pswitch_data_4e

    move-object v6, p0

    check-cast v6, Lcsh;

    if-eqz v3, :cond_19

    :goto_14
    move-object v4, p1

    move-object v5, p2

    move-wide v8, v0

    move v7, v2

    goto :goto_26

    :cond_19
    iget-object p0, p1, Lnpd;->t:Lxkg;

    invoke-virtual {p0}, Lxkg;->f0()I

    move-result v2

    iget-object p0, p1, Lnpd;->t:Lxkg;

    invoke-virtual {p0}, Lxkg;->getCurrentPosition()J

    move-result-wide v0

    goto :goto_14

    :goto_26
    invoke-virtual/range {v4 .. v9}, Lnpd;->p(Lnod;Lcsh;IJ)Lc5j;

    move-result-object p0

    return-object p0

    :pswitch_2b
    move-object v4, p1

    move-object v5, p2

    check-cast p0, Lqjd;

    invoke-static {p0}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object p0

    if-eqz v3, :cond_3c

    :goto_35
    move v3, v2

    move-object v2, p0

    move-wide v10, v0

    move-object v0, v4

    move-object v1, v5

    move-wide v4, v10

    goto :goto_49

    :cond_3c
    iget-object p1, v4, Lnpd;->t:Lxkg;

    invoke-virtual {p1}, Lxkg;->f0()I

    move-result v2

    iget-object p1, v4, Lnpd;->t:Lxkg;

    invoke-virtual {p1}, Lxkg;->getCurrentPosition()J

    move-result-wide v0

    goto :goto_35

    :goto_49
    invoke-virtual/range {v0 .. v5}, Lnpd;->p(Lnod;Lcsh;IJ)Lc5j;

    move-result-object p0

    return-object p0

    :pswitch_data_4e
    .packed-switch 0x8
        :pswitch_2b
    .end packed-switch
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 9

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Lbt2;

    iget-object v1, p2, Lg3o;->a:Ld3o;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Ld3o;->i(I)Lr9b;

    move-result-object v2

    iget v2, v2, Lr9b;->d:I

    if-nez v2, :cond_19

    iget-object v3, v0, Lbt2;->b:Landroid/view/ViewGroup;

    iget-object v0, v0, Lbt2;->i:Lus2;

    const-wide/16 v4, 0x64

    invoke-virtual {v3, v0, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_19
    iget-boolean p0, p0, Lvw;->b:Z

    if-nez p0, :cond_3b

    const/16 p0, 0x207

    invoke-virtual {v1, p0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget p0, p0, Lr9b;->d:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_34

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    sub-int/2addr v2, p0

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p2

    :cond_34
    const-string p0, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_3b
    return-object p2
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    check-cast p1, Ljava/lang/Void;

    invoke-static {v0}, Lz7h;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "proxy_retention"

    iget-boolean p0, p0, Lvw;->b:Z

    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final run()V
    .registers 16

    iget-byte v0, p0, Lvw;->a:B

    const/16 v1, 0xd

    const-string v2, "fireGetHeaders"

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_19a

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Lfnb;

    iget-boolean p0, p0, Lvw;->b:Z

    iget-object v6, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/ByteBuffer;

    iget-wide v6, v0, Lfnb;->f:J

    const-wide/16 v8, -0x1

    cmp-long v10, v6, v8

    const-string v11, "Read upload data length %d exceeds expected length %d"

    if-eqz v10, :cond_59

    iget-wide v12, v0, Lfnb;->g:J

    sub-long/2addr v6, v12

    iget-object v10, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {v10}, Ljava/nio/Buffer;->remaining()I

    move-result v10

    int-to-long v12, v10

    cmp-long v6, v6, v12

    if-gez v6, :cond_59

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    iget-wide v1, v0, Lfnb;->g:J

    iget-object v3, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/Buffer;->remaining()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-wide v2, v0, Lfnb;->f:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v11, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lfnb;->c(Ljava/lang/Exception;)V

    goto/16 :goto_119

    :cond_59
    iget-object v6, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    move-result v6

    if-nez v6, :cond_6f

    if-nez p0, :cond_6f

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Bytes read can\'t be zero except for last chunk!"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lfnb;->c(Ljava/lang/Exception;)V

    goto/16 :goto_119

    :cond_6f
    iget-wide v6, v0, Lfnb;->g:J

    iget-object v10, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    move-object v12, v0

    check-cast v12, Lnnb;

    move v13, v5

    :goto_77
    invoke-virtual {v10}, Ljava/nio/Buffer;->hasRemaining()Z

    move-result v14

    if-eqz v14, :cond_85

    iget-object v14, v12, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {v14, v10}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v14

    add-int/2addr v13, v14

    goto :goto_77

    :cond_85
    iget-object v10, v12, Lnnb;->l:Ljava/io/OutputStream;

    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V

    int-to-long v13, v13

    add-long/2addr v6, v13

    iput-wide v6, v0, Lfnb;->g:J

    iget-wide v13, v0, Lfnb;->f:J

    cmp-long v10, v6, v13

    if-ltz v10, :cond_105

    cmp-long v8, v13, v8

    if-nez v8, :cond_bd

    if-eqz p0, :cond_105

    iget-object p0, v12, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    if-eqz p0, :cond_ab

    iget-object p0, v12, Lnnb;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v5, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-eqz p0, :cond_ab

    iget-object p0, v12, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V

    :cond_ab
    iget-object p0, v12, Lnnb;->m:Lpnb;

    iput v1, p0, Lpnb;->l:I

    new-instance v0, Lhnb;

    invoke-direct {v0, p0, v5}, Lhnb;-><init>(Lpnb;B)V

    new-instance v1, Lgnb;

    invoke-direct {v1, p0, v0, v4}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    invoke-virtual {p0, v2, v1}, Lpnb;->c(Ljava/lang/String;Ljava/lang/Runnable;)V

    goto :goto_119

    :cond_bd
    cmp-long p0, v13, v6

    if-nez p0, :cond_e4

    iget-object p0, v12, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    if-eqz p0, :cond_d2

    iget-object p0, v12, Lnnb;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v5, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-eqz p0, :cond_d2

    iget-object p0, v12, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V

    :cond_d2
    iget-object p0, v12, Lnnb;->m:Lpnb;

    iput v1, p0, Lpnb;->l:I

    new-instance v0, Lhnb;

    invoke-direct {v0, p0, v5}, Lhnb;-><init>(Lpnb;B)V

    new-instance v1, Lgnb;

    invoke-direct {v1, p0, v0, v4}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    invoke-virtual {p0, v2, v1}, Lpnb;->c(Ljava/lang/String;Ljava/lang/Runnable;)V

    goto :goto_119

    :cond_e4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    iget-wide v1, v0, Lfnb;->g:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-wide v2, v0, Lfnb;->f:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v11, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lfnb;->c(Ljava/lang/Exception;)V

    goto :goto_119

    :cond_105
    iget-object p0, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/ByteBuffer;

    iget-object p0, v0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    new-instance p0, Lcnb;

    invoke-direct {p0, v0, v5}, Lcnb;-><init>(Lfnb;B)V

    const-string v1, "readFromProvider"

    invoke-virtual {v0, p0, v1}, Lfnb;->b(Lqnb;Ljava/lang/String;)V

    :goto_119
    return-void

    :pswitch_11a
    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, Lnnb;

    iget-boolean p0, p0, Lvw;->b:Z

    iget-object v6, v0, Lfnb;->d:Ltom;

    iget-object v7, v6, Ltom;->b:Ljava/lang/Object;

    check-cast v7, Lorg/chromium/net/UploadDataProvider;

    invoke-virtual {v7}, Lorg/chromium/net/UploadDataProvider;->getLength()J

    move-result-wide v7

    iput-wide v7, v0, Lfnb;->f:J

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-nez v11, :cond_155

    iget-object p0, v0, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    if-eqz p0, :cond_143

    iget-object p0, v0, Lnnb;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v5, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-eqz p0, :cond_143

    iget-object p0, v0, Lnnb;->k:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V

    :cond_143
    iget-object p0, v0, Lnnb;->m:Lpnb;

    iput v1, p0, Lpnb;->l:I

    new-instance v0, Lhnb;

    invoke-direct {v0, p0, v5}, Lhnb;-><init>(Lpnb;B)V

    new-instance v1, Lgnb;

    invoke-direct {v1, p0, v0, v4}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    invoke-virtual {p0, v2, v1}, Lpnb;->c(Ljava/lang/String;Ljava/lang/Runnable;)V

    goto :goto_199

    :cond_155
    const/16 v1, 0x2000

    if-lez v11, :cond_168

    const-wide/16 v11, 0x2000

    cmp-long v2, v7, v11

    if-gez v2, :cond_168

    long-to-int v2, v7

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    goto :goto_16e

    :cond_168
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, v0, Lfnb;->e:Ljava/nio/ByteBuffer;

    :goto_16e
    iget-wide v7, v0, Lfnb;->f:J

    cmp-long v2, v7, v9

    iget-object v5, v0, Lnnb;->i:Ljava/net/HttpURLConnection;

    if-lez v2, :cond_17a

    invoke-virtual {v5, v7, v8}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(J)V

    goto :goto_17d

    :cond_17a
    invoke-virtual {v5, v1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    :goto_17d
    if-eqz p0, :cond_191

    new-instance p0, Lcnb;

    invoke-direct {p0, v0, v3}, Lcnb;-><init>(Lfnb;B)V

    iget-object v1, v0, Lnnb;->m:Lpnb;

    new-instance v2, Lgnb;

    invoke-direct {v2, v1, p0, v4}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    const-string p0, "startRead"

    invoke-virtual {v0, v2, p0}, Lfnb;->a(Lgnb;Ljava/lang/String;)V

    goto :goto_199

    :cond_191
    iget-object p0, v0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-virtual {v6, v0}, Ltom;->rewind(Lorg/chromium/net/UploadDataSink;)V

    :goto_199
    return-void

    :pswitch_data_19a
    .packed-switch 0x5
        :pswitch_11a
    .end packed-switch
.end method

.method public final run(J)V
    .registers 5

    iget-object v0, p0, Lvw;->c:Ljava/lang/Object;

    check-cast v0, [B

    sget-object v1, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    .line 410
    iget-boolean p0, p0, Lvw;->b:Z

    invoke-static {p1, p2, v0, p0}, LJ/N;->MulYy5b7(JLjava/lang/Object;I)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 9

    iget-object p1, p0, Lvw;->c:Ljava/lang/Object;

    check-cast p1, Lp35;

    iget-boolean p0, p0, Lvw;->b:Z

    if-eqz p0, :cond_b

    invoke-virtual {p1}, Lp35;->H0()V

    :cond_b
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iget-object p2, p1, Lp35;->r:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :cond_19
    :goto_19
    if-ge v3, v0, :cond_33

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lo35;

    iget-object v5, v4, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_19

    add-int/lit8 v2, v2, 0x1

    iget-object v4, v4, Lo35;->a:Lr25;

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_33
    iget-object p2, p1, Lp35;->w:Lac1;

    iput v2, p2, Lac1;->b:I

    invoke-virtual {p2}, Lac1;->k()V

    iget-object p2, p1, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    new-array v0, v1, [Lr25;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lr25;

    invoke-static {p0}, Lz4o;->r([Lr25;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "exit_clear_data_categories"

    invoke-virtual {p2, v0, p0}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lp35;->G0()V

    return-void
.end method
