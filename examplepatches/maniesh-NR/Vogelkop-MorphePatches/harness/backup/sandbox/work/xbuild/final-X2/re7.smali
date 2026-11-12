.class public final Lre7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Z

.field public final a:Lxf7;

.field public final b:I

.field public c:Ljava/lang/String;

.field public d:Landroid/net/Uri;

.field public e:Landroid/net/Uri;

.field public f:I

.field public g:I

.field public h:Z

.field public i:J

.field public j:J

.field public k:J

.field public l:J

.field public final m:Ljava/lang/String;

.field public n:Z

.field public final o:J

.field public p:Ljava/lang/String;

.field public q:J

.field public r:J

.field public s:Z

.field public final t:Lcom/opera/android/downloads/DownloadItem;

.field public final u:Lh7f;

.field public v:I

.field public w:Z

.field public x:Lcx3;

.field public y:Lcom/opera/api/Callback;

.field public z:Z


# direct methods
.method public constructor <init>(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;II)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lre7;->u:Lh7f;

    iput-object p1, p0, Lre7;->a:Lxf7;

    iput p5, p0, Lre7;->b:I

    iput-object p3, p0, Lre7;->e:Landroid/net/Uri;

    const/4 p3, 0x0

    iput-boolean p3, p0, Lre7;->s:Z

    const/4 p5, 0x4

    iput p5, p0, Lre7;->f:I

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->c()Ljava/lang/String;

    move-result-object p5

    iput-object p5, p0, Lre7;->m:Ljava/lang/String;

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->b()J

    move-result-wide v0

    iput-wide v0, p0, Lre7;->j:J

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->i()J

    move-result-wide v0

    iput-wide v0, p0, Lre7;->i:J

    iput-object p2, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    iget-object p5, p1, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v0

    iget-wide v2, p5, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v2, v3, v0, v1}, LJ/N;->MNFDpvSY(JJ)I

    move-result p5

    if-eqz p5, :cond_39

    const/4 p3, 0x1

    :cond_39
    invoke-virtual {p0, p4, p3}, Lre7;->B(IZ)V

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide p3

    invoke-virtual {p1}, Lxf7;->a()Z

    move-result p1

    if-eqz p1, :cond_49

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    goto :goto_4b

    :cond_49
    const-wide/16 v0, 0x0

    :goto_4b
    or-long/2addr p3, v0

    iput-wide p3, p0, Lre7;->o:J

    invoke-interface {p2, p0}, Lcom/opera/android/downloads/DownloadItem;->j(Lre7;)Z

    return-void
.end method


# virtual methods
.method public final A(II)V
    .registers 3

    iput p2, p0, Lre7;->g:I

    iget p2, p0, Lre7;->f:I

    if-eq p2, p1, :cond_1e

    iput p1, p0, Lre7;->f:I

    iget-object p1, p0, Lre7;->u:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_e
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1e

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqe7;

    invoke-interface {p2, p0}, Lqe7;->a(Lre7;)V

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public final B(IZ)V
    .registers 15

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/16 v2, 0x1e

    const/16 v3, 0xf

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    if-eqz p2, :cond_1d

    iget-object v7, p0, Lre7;->a:Lxf7;

    iget-object v7, v7, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    invoke-interface {v6}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v8

    iget-wide v10, v7, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v10, v11, v8, v9}, LJ/N;->MNFDpvSY(JJ)I

    move-result v7

    if-ne v7, v1, :cond_2b

    goto :goto_2d

    :cond_1d
    if-ne p1, v0, :cond_2b

    invoke-interface {v6}, Lcom/opera/android/downloads/DownloadItem;->e()I

    move-result v7

    if-eq v7, v3, :cond_2d

    if-eq v7, v2, :cond_2d

    const/16 v8, 0x1f

    if-eq v7, v8, :cond_2d

    :cond_2b
    move v7, v5

    goto :goto_2e

    :cond_2d
    :goto_2d
    move v7, v4

    :goto_2e
    iput-boolean v7, p0, Lre7;->w:Z

    if-ne p1, v4, :cond_37

    const/4 p1, 0x4

    invoke-virtual {p0, p1, v5}, Lre7;->A(II)V

    return-void

    :cond_37
    if-eqz p2, :cond_3d

    invoke-virtual {p0, v1, v5}, Lre7;->A(II)V

    return-void

    :cond_3d
    if-eqz p1, :cond_7f

    if-eq p1, v1, :cond_7b

    if-eq p1, v0, :cond_44

    return-void

    :cond_44
    invoke-interface {v6}, Lcom/opera/android/downloads/DownloadItem;->e()I

    move-result p1

    invoke-interface {v6}, Lcom/opera/android/downloads/DownloadItem;->l()Z

    move-result p2

    if-eq p1, v0, :cond_6f

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x11

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x16

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x19

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x1b

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x13

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x14

    if-eq p1, v3, :cond_6f

    const/16 v3, 0x1d

    if-eq p1, v3, :cond_6f

    if-eq p1, v2, :cond_6f

    move v4, v5

    :cond_6f
    if-eqz p2, :cond_77

    if-nez v4, :cond_77

    invoke-virtual {p0, v1, p1}, Lre7;->A(II)V

    return-void

    :cond_77
    invoke-virtual {p0, v0, p1}, Lre7;->A(II)V

    return-void

    :cond_7b
    invoke-virtual {p0, v0, v5}, Lre7;->A(II)V

    return-void

    :cond_7f
    invoke-virtual {p0, v4, v5}, Lre7;->A(II)V

    return-void
.end method

.method public final C()Z
    .registers 4

    iget-boolean v0, p0, Lre7;->A:Z

    const/4 v1, 0x1

    if-nez v0, :cond_31

    iget v0, p0, Lre7;->f:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_2f

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->e()I

    move-result p0

    if-eqz p0, :cond_31

    if-eq p0, v1, :cond_31

    if-eq p0, v2, :cond_31

    const/16 v0, 0x8

    if-eq p0, v0, :cond_31

    const/16 v0, 0xb

    if-eq p0, v0, :cond_31

    const/16 v0, 0x11

    if-eq p0, v0, :cond_31

    const/16 v0, 0x19

    if-eq p0, v0, :cond_31

    packed-switch p0, :pswitch_data_32

    packed-switch p0, :pswitch_data_3c

    packed-switch p0, :pswitch_data_48

    :cond_2f
    const/4 p0, 0x0

    return p0

    :cond_31
    :pswitch_31
    return v1

    :pswitch_data_32
    .packed-switch 0xd
        :pswitch_31
        :pswitch_31
        :pswitch_31
    .end packed-switch

    :pswitch_data_3c
    .packed-switch 0x13
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
    .end packed-switch

    :pswitch_data_48
    .packed-switch 0x1b
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
    .end packed-switch
.end method

.method public final a()Z
    .registers 2

    invoke-virtual {p0}, Lre7;->e()Ldd7;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lre7;->e()Ldd7;

    move-result-object p0

    invoke-virtual {p0}, Ldd7;->d()Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final b()V
    .registers 3

    iget v0, p0, Lre7;->f:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    invoke-virtual {p0}, Lre7;->n()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lre7;->u()V

    :cond_e
    invoke-virtual {p0}, Lre7;->w()V

    return-void
.end method

.method public final c()Lnc0;
    .registers 3

    sget-object v0, Llg7;->a:[[I

    invoke-static {p0}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object p0

    invoke-static {p0}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_38

    sget-object p0, Lnc0;->j:Lnc0;

    return-object p0

    :pswitch_20
    sget-object p0, Lnc0;->h:Lnc0;

    return-object p0

    :pswitch_23
    sget-object p0, Lnc0;->i:Lnc0;

    return-object p0

    :pswitch_26
    sget-object p0, Lnc0;->f:Lnc0;

    return-object p0

    :pswitch_29
    sget-object p0, Lnc0;->g:Lnc0;

    return-object p0

    :pswitch_2c
    sget-object p0, Lnc0;->b:Lnc0;

    return-object p0

    :pswitch_2f
    sget-object p0, Lnc0;->c:Lnc0;

    return-object p0

    :pswitch_32
    sget-object p0, Lnc0;->d:Lnc0;

    return-object p0

    :pswitch_35
    sget-object p0, Lnc0;->e:Lnc0;

    return-object p0

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
    .end packed-switch
.end method

.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 3

    iget p0, p0, Lre7;->g:I

    if-eqz p0, :cond_6f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_67

    const/16 v0, 0xc

    if-eq p0, v0, :cond_63

    const/16 v0, 0x10

    if-eq p0, v0, :cond_5f

    const/16 v0, 0x12

    if-eq p0, v0, :cond_5b

    const/16 v0, 0x1a

    if-eq p0, v0, :cond_57

    const/4 v0, 0x4

    if-eq p0, v0, :cond_53

    const/4 v0, 0x5

    if-eq p0, v0, :cond_4f

    const/4 v0, 0x6

    if-eq p0, v0, :cond_4b

    const/4 v0, 0x7

    if-eq p0, v0, :cond_47

    const/16 v0, 0x9

    if-eq p0, v0, :cond_43

    const/16 v0, 0xa

    if-eq p0, v0, :cond_3f

    const/16 v0, 0x17

    if-eq p0, v0, :cond_3b

    const/16 v0, 0x18

    if-eq p0, v0, :cond_37

    const p0, 0x7f1405ad

    goto :goto_6a

    :cond_37
    const p0, 0x7f1405ed

    goto :goto_6a

    :cond_3b
    const p0, 0x7f1405f1

    goto :goto_6a

    :cond_3f
    const p0, 0x7f1405de

    goto :goto_6a

    :cond_43
    const p0, 0x7f1405f0

    goto :goto_6a

    :cond_47
    const p0, 0x7f1405e2

    goto :goto_6a

    :cond_4b
    const p0, 0x7f1405ea

    goto :goto_6a

    :cond_4f
    const p0, 0x7f1405e5

    goto :goto_6a

    :cond_53
    const p0, 0x7f1405dd

    goto :goto_6a

    :cond_57
    const p0, 0x7f1405f2

    goto :goto_6a

    :cond_5b
    const p0, 0x7f1405ee

    goto :goto_6a

    :cond_5f
    const p0, 0x7f1405e8

    goto :goto_6a

    :cond_63
    const p0, 0x7f1405e3

    goto :goto_6a

    :cond_67
    const p0, 0x7f1405e7

    :goto_6a
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_6f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Ldd7;
    .registers 4

    invoke-virtual {p0}, Lre7;->g()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    new-instance p0, Ljava/io/File;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v0, Lbkh;

    invoke-direct {v0, p0}, Lbkh;-><init>(Ljava/io/File;)V

    return-object v0

    :cond_23
    iget-object p0, p0, Lre7;->a:Lxf7;

    iget-object p0, p0, Lxf7;->d:Lag7;

    iget-object p0, p0, Lag7;->b:Landroid/content/Context;

    invoke-static {p0, v0}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object p0

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lre7;->c:Ljava/lang/String;

    if-nez v0, :cond_b

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->g()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    return-object v0
.end method

.method public final g()Landroid/net/Uri;
    .registers 5

    iget-object v0, p0, Lre7;->e:Landroid/net/Uri;

    if-nez v0, :cond_47

    iget-object v0, p0, Lre7;->d:Landroid/net/Uri;

    if-eqz v0, :cond_47

    iget-object v1, p0, Lre7;->c:Ljava/lang/String;

    if-eqz v1, :cond_47

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lre7;->d:Landroid/net/Uri;

    if-eqz v0, :cond_2b

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lre7;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lre7;->e:Landroid/net/Uri;

    goto :goto_47

    :cond_2b
    invoke-static {v1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :try_start_33
    iget-object v1, p0, Lre7;->a:Lxf7;

    iget-object v1, v1, Lxf7;->d:Lag7;

    iget-object v1, v1, Lag7;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lre7;->m:Ljava/lang/String;

    iget-object v3, p0, Lre7;->c:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lre7;->e:Landroid/net/Uri;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_47} :catch_47

    :catch_47
    :cond_47
    :goto_47
    iget-object p0, p0, Lre7;->e:Landroid/net/Uri;

    return-object p0
.end method

.method public final h()Ljava/io/File;
    .registers 1

    iget-object p0, p0, Lre7;->a:Lxf7;

    iget-object p0, p0, Lxf7;->d:Lag7;

    iget-object p0, p0, Lag7;->b:Landroid/content/Context;

    invoke-static {p0}, Ls29;->e(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public final i()Z
    .registers 5

    iget-wide v0, p0, Lre7;->j:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final j()Z
    .registers 2

    invoke-virtual {p0}, Lre7;->m()Z

    move-result v0

    if-nez v0, :cond_c

    iget-boolean p0, p0, Lre7;->w:Z

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    const/4 p0, 0x1

    return p0
.end method

.method public final k()Z
    .registers 2

    iget p0, p0, Lre7;->f:I

    const/4 v0, 0x4

    if-ne p0, v0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final l()Z
    .registers 2

    iget p0, p0, Lre7;->f:I

    const/4 v0, 0x4

    if-eq p0, v0, :cond_a

    const/4 v0, 0x3

    if-eq p0, v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final m()Z
    .registers 2

    iget p0, p0, Lre7;->f:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    return v0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final n()Z
    .registers 6

    iget v0, p0, Lre7;->f:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    iget-object v0, p0, Lre7;->a:Lxf7;

    iget-object v0, v0, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v3, v4, v1, v2}, LJ/N;->MNFDpvSY(JJ)I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final o()Z
    .registers 3

    iget-object v0, p0, Lre7;->e:Landroid/net/Uri;

    const-string v1, "content"

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_f
    iget-object p0, p0, Lre7;->d:Landroid/net/Uri;

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final p()Z
    .registers 2

    iget-boolean v0, p0, Lre7;->n:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lre7;->h:Z

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lre7;->m()Z

    move-result p0

    if-eqz p0, :cond_10

    :cond_e
    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final q()Z
    .registers 2

    iget-boolean v0, p0, Lre7;->n:Z

    if-eqz v0, :cond_a

    iget-boolean p0, p0, Lre7;->h:Z

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final r()V
    .registers 3

    iget-object v0, p0, Lre7;->u:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqe7;

    invoke-interface {v1, p0}, Lqe7;->e(Lre7;)V

    goto :goto_6

    :cond_16
    iget-object v0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v0}, Lcom/opera/android/downloads/DownloadItem;->remove()V

    const/4 v0, 0x0

    iput-object v0, p0, Lre7;->y:Lcom/opera/api/Callback;

    const/4 v0, 0x2

    iput v0, p0, Lre7;->f:I

    const/4 v0, 0x0

    iput v0, p0, Lre7;->g:I

    return-void
.end method

.method public final s()V
    .registers 6

    iget-object v0, p0, Lre7;->a:Lxf7;

    iget-object v0, v0, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v1

    const/4 p0, 0x1

    iget-wide v3, v0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v3, v4, v1, v2, p0}, LJ/N;->MUhg9A8g(JJI)V

    return-void
.end method

.method public final t(Lqe7;)V
    .registers 2

    iget-object p0, p0, Lre7;->u:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final u()V
    .registers 6

    const/4 v0, 0x0

    iput v0, p0, Lre7;->v:I

    iget-object v0, p0, Lre7;->a:Lxf7;

    iget-object v0, v0, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object p0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p0}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v3, v4, v1, v2}, LJ/N;->MCe2yFpu(JJ)V

    return-void
.end method

.method public final v()V
    .registers 4

    invoke-virtual {p0}, Lre7;->g()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Lre7;->y:Lcom/opera/api/Callback;

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_2b

    :cond_1c
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_2b

    :cond_24
    iget-object v0, p0, Lre7;->y:Lcom/opera/api/Callback;

    const-string v1, ""

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_2b
    const/4 v0, 0x0

    iput-object v0, p0, Lre7;->y:Lcom/opera/api/Callback;

    return-void
.end method

.method public final w()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lre7;->n:Z

    iget-object v1, p0, Lre7;->y:Lcom/opera/api/Callback;

    if-nez v1, :cond_a

    iput-boolean v0, p0, Lre7;->z:Z

    goto :goto_d

    :cond_a
    invoke-virtual {p0}, Lre7;->v()V

    :goto_d
    iget-object v0, p0, Lre7;->u:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_13
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqe7;

    invoke-interface {v1, p0}, Lqe7;->c(Lre7;)V

    goto :goto_13

    :cond_23
    return-void
.end method

.method public final x(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lre7;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v0, p1}, Lcom/opera/android/downloads/DownloadItem;->a(Ljava/lang/String;)V

    iput-object p1, p0, Lre7;->c:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lre7;->e:Landroid/net/Uri;

    :cond_12
    return-void
.end method

.method public final y(I)V
    .registers 4

    invoke-virtual {p0}, Lre7;->h()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lre7;->d:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    iput-object v0, p0, Lre7;->d:Landroid/net/Uri;

    const/4 v0, 0x0

    iput-object v0, p0, Lre7;->e:Landroid/net/Uri;

    :cond_15
    iget-object v0, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v0, p1}, Lcom/opera/android/downloads/DownloadItem;->o(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lre7;->h:Z

    return-void
.end method

.method public final z(Z)V
    .registers 3

    iget-boolean v0, p0, Lre7;->A:Z

    if-eq v0, p1, :cond_1c

    iput-boolean p1, p0, Lre7;->A:Z

    iget-object p1, p0, Lre7;->u:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_c
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqe7;

    invoke-interface {v0, p0}, Lqe7;->d(Lre7;)V

    goto :goto_c

    :cond_1c
    return-void
.end method
