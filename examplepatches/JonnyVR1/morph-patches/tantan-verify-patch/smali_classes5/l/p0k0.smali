.class public Ll/p0k0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p0k0$b;,
        Ll/p0k0$a;
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    const-string v0, "raw"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic B(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->s0(Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method

.method public static synthetic C(Ll/p0k0$b;Ljava/util/List;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOAD_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u4e0a\u4f20\u56fe\u7247-\u7ed3\u675f"

    .line 6
    .line 7
    iput-object v0, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    iput-object p1, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic D(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic E(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->n0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/p0k0$b;Ljava/util/List;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOAD_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u4e0a\u4f20\u89c6\u9891-\u7ed3\u675f"

    .line 6
    .line 7
    iput-object v0, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    iput-object p1, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic G(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic H(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/p0k0;->g0(Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic I(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic J(Ll/p0k0$b;Ll/bkj0;)Ll/p0k0$b;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 13
    .line 14
    iput-object p1, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 17
    .line 18
    iput-object p1, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Ll/p0k0$b;->d:Z

    .line 22
    .line 23
    new-instance p0, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 24
    .line 25
    const-string p1, "\u68c0\u6d4b\u5230\u654f\u611f\u4fe1\u606f\uff0c\u4e0a\u4f20\u5931\u8d25"

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/safety/IllegalPictureException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public static synthetic K(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 4
    .line 5
    const-string v0, "normal"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic L(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/p0k0;->h0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic M(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic N(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->w0(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p0k0;->t0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method

.method public static synthetic Q(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->A0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic R(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->k0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic S(Ll/p0k0;Ll/p0k0$b;Lcom/p1/mobile/putong/data/Envelope;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->d0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Envelope;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic U(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->C0(Ll/p0k0$b;Lrx/subjects/a;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V(Ll/p0k0;Ll/p0k0$a;Ll/p0k0$b;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->e0(Ll/p0k0$a;Ll/p0k0$b;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->F0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->y0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic b(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->p0(Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->o0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic d(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->z0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic f(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->q0(Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/p0k0$b;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->R:Ll/s5m;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/b0k0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/b0k0;-><init>(Ll/p0k0$b;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic h(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/android/app/Act;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p0k0;->u0(Ll/p0k0$a;Lcom/p1/mobile/android/app/Act;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/tantan/core/base/R$string;->m:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic k(Ll/p0k0;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p0k0;->f0(Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic l(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->B0(Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->r0(Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method

.method public static synthetic n(Ll/p0k0;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p0k0;->i0(Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic o(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->x0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic p(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->m0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic q(Ll/p0k0$b;Ljava/lang/Throwable;)Ljava/util/List;
    .locals 0

    .line 1
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 2
    .line 3
    iput-object p1, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 6
    .line 7
    iput-object p1, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    const-string p1, "\u4e0a\u4f20\u56fe\u7247-\u5931\u8d25"

    .line 10
    .line 11
    iput-object p1, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Ll/p0k0$b;->d:Z

    .line 15
    .line 16
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic r(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->D0(Ll/p0k0$b;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Ll/p0k0$b;Ljava/lang/Throwable;)Ll/p0k0$b;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic t(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->v0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic u(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic v(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/p0k0;->j0(Ll/p0k0$b;Lrx/subjects/a;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic w(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->l0(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->E0(Lrx/subjects/a;Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic y(Ll/p0k0$b;Ljava/lang/Throwable;)Ljava/util/List;
    .locals 0

    .line 1
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 2
    .line 3
    iput-object p1, p0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 6
    .line 7
    iput-object p1, p0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    const-string p1, "\u4e0a\u4f20\u89c6\u9891-\u5931\u8d25"

    .line 10
    .line 11
    iput-object p1, p0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Ll/p0k0$b;->d:Z

    .line 15
    .line 16
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic z(Ll/p0k0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p0k0$b;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final synthetic A0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u4e0a\u4f20\u89c6\u9891-\u5f00\u59cb"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic B0(Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 2
    .line 3
    .line 4
    return-object p2
.end method

.method public final synthetic C0(Ll/p0k0$b;Lrx/subjects/a;Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    const-string v2, "preprocessed"

    .line 11
    .line 12
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    filled-new-array {p3}, [Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    const-string v0, "user-profile"

    .line 33
    .line 34
    const-string v1, "profile"

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {p3, v1, v0, v2}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    :goto_0
    new-instance v0, Ll/g0k0;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Ll/g0k0;-><init>(Ll/p0k0$b;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    new-instance v0, Ll/h0k0;

    .line 59
    .line 60
    invoke-direct {v0, p1}, Ll/h0k0;-><init>(Ll/p0k0$b;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    new-instance v0, Ll/i0k0;

    .line 68
    .line 69
    invoke-direct {v0, p0, p2, p1}, Ll/i0k0;-><init>(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public final synthetic D0(Ll/p0k0$b;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/i1y;

    .line 2
    .line 3
    iget-object p1, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, p1, v1}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/pzj0;

    .line 18
    .line 19
    invoke-direct {p1, p0, p3, p2}, Ll/pzj0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic E0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u8ba2\u9605\u7ed3\u675f-\u5b8c\u6210"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic F0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    iget-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const-string p3, "\u4e0a\u4f20\u5931\u8d25"

    .line 14
    .line 15
    iput-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    const-string p3, "\u8ba2\u9605\u7ed3\u675f-\u5931\u8d25"

    .line 18
    .line 19
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final G0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;",
            "Ll/p0k0$b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zzj0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/zzj0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p3, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/j0k0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/j0k0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/k0k0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/k0k0;-><init>(Ll/p0k0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/p0k0;->b:Ll/kcg0;

    .line 36
    .line 37
    invoke-virtual {p0, p3, p4}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p4, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, p4, p3}, Ll/p0k0;->L0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    instance-of p1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    new-instance p1, Ll/vel0;

    .line 55
    .line 56
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-direct {p1, p2}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-wide p1, p1, Ll/vel0;->b:J

    .line 66
    .line 67
    const-wide/16 v0, 0x3e80

    .line 68
    .line 69
    cmp-long v0, p1, v0

    .line 70
    .line 71
    if-ltz v0, :cond_1

    .line 72
    .line 73
    const-string p1, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u957f\u4e86"

    .line 74
    .line 75
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object p2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 79
    .line 80
    iput-object p2, p4, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 81
    .line 82
    iput-object p1, p4, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p3, p4}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    const-wide/16 v0, 0xbb8

    .line 89
    .line 90
    cmp-long p1, p1, v0

    .line 91
    .line 92
    if-gez p1, :cond_2

    .line 93
    .line 94
    const-string p1, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u77ed\u4e86"

    .line 95
    .line 96
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget-object p2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 100
    .line 101
    iput-object p2, p4, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 102
    .line 103
    iput-object p1, p4, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, p3, p4}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-virtual {p0, p4, p3}, Ll/p0k0;->M0(Ll/p0k0$b;Lrx/subjects/a;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method public H0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/p0k0;->b:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/p0k0;->b:Ll/kcg0;

    .line 15
    .line 16
    return-void
.end method

.method public I0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/p0k0$b;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    iput-object v1, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, v0, Ll/p0k0$b;->d:Z

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    iput-object v1, v0, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput-boolean v1, v0, Ll/p0k0$b;->e:Z

    .line 20
    .line 21
    const-string v1, "\u91cd\u8bd5\u4e0a\u4f20"

    .line 22
    .line 23
    iput-object v1, v0, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/p0k0;->G0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public J0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v3, v0

    .line 6
    check-cast v3, Ll/p0k0$b;

    .line 7
    .line 8
    if-nez v3, :cond_0

    .line 9
    .line 10
    const-string p0, "\u8bf7\u4f7f\u7528\u6b63\u786e\u7684\u65b9\u5f0f\u4e0a\u4f20"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 17
    .line 18
    iput-object v0, v3, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, v3, Ll/p0k0$b;->d:Z

    .line 22
    .line 23
    const-string v0, "\u62c9\u8d77\u9009\u62e9\u7167\u7247"

    .line 24
    .line 25
    iput-object v0, v3, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p3, v3}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ll/p0k0$a;->d(Ll/p0k0$a;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p2}, Ll/p0k0$a;->e(Ll/p0k0$a;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/high16 v2, 0x42200000    # 40.0f

    .line 39
    .line 40
    const v4, 0x3f4ccccd    # 0.8f

    .line 41
    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    if-ne v0, v1, :cond_1

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {}, Ll/bnl0;->y0()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    sub-int/2addr v4, v2

    .line 71
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    invoke-static {p2}, Ll/p0k0$a;->d(Ll/p0k0$a;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-static {}, Ll/bnl0;->y0()I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    sub-int/2addr v4, v2

    .line 143
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Mm(Lcom/p1/mobile/android/app/Act;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    goto :goto_0

    .line 176
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-instance v1, Ll/ozj0;

    .line 209
    .line 210
    move-object v2, p0

    .line 211
    move-object v5, p1

    .line 212
    move-object v6, p2

    .line 213
    move-object v4, p3

    .line 214
    invoke-direct/range {v1 .. v6}, Ll/ozj0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v5, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public final declared-synchronized K0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;",
            "Ll/p0k0$b;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 3
    .line 4
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p2, Ll/p0k0$b;->f:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iput-boolean v2, p2, Ll/p0k0$b;->f:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 23
    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    iput-boolean v2, p2, Ll/p0k0$b;->f:Z

    .line 27
    .line 28
    :cond_2
    :goto_0
    invoke-virtual {p2}, Ll/p0k0$b;->a()Ll/p0k0$b;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public final L0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Ll/p0k0$b;Lrx/subjects/a;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Ll/p0k0$b;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/p0k0$a;->b(Ll/p0k0$a;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->isBeforeCheck()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    new-instance v4, Ll/wyj0;

    .line 38
    .line 39
    invoke-direct {v4}, Ll/wyj0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v4, Ll/ezj0;

    .line 47
    .line 48
    invoke-direct {v4, p0, p4}, Ll/ezj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v4}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v4, Ll/fzj0;

    .line 56
    .line 57
    invoke-direct {v4, p0, p2, v3}, Ll/fzj0;-><init>(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v4}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v3, Ll/gzj0;

    .line 65
    .line 66
    invoke-direct {v3, p0, p4}, Ll/gzj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v3, Ll/hzj0;

    .line 74
    .line 75
    invoke-direct {v3, p0, p3, p4}, Ll/hzj0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    new-instance v2, Ll/izj0;

    .line 84
    .line 85
    invoke-direct {v2}, Ll/izj0;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v2, Ll/jzj0;

    .line 93
    .line 94
    invoke-direct {v2, p0, p4}, Ll/jzj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v2, Ll/kzj0;

    .line 110
    .line 111
    invoke-direct {v2, p0, p4}, Ll/kzj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {p2}, Ll/p0k0$a;->a(Ll/p0k0$a;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_2

    .line 123
    .line 124
    new-instance v2, Ll/lzj0;

    .line 125
    .line 126
    invoke-direct {v2, p0, p2, p1, p4}, Ll/lzj0;-><init>(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/android/app/Act;Lrx/subjects/a;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    :cond_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-nez p1, :cond_4

    .line 138
    .line 139
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_4

    .line 148
    .line 149
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->isBeforeCheck()Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-nez v2, :cond_3

    .line 160
    .line 161
    new-instance v2, Ll/mzj0;

    .line 162
    .line 163
    invoke-direct {v2}, Ll/mzj0;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    new-instance v2, Ll/xyj0;

    .line 171
    .line 172
    invoke-direct {v2, p0, p4}, Ll/xyj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    new-instance v2, Ll/yyj0;

    .line 180
    .line 181
    invoke-direct {v2, p0, p2, v0}, Ll/yyj0;-><init>(Ll/p0k0;Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/zyj0;

    .line 189
    .line 190
    invoke-direct {v1, p0, p4}, Ll/zyj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    move-object v1, v0

    .line 198
    goto :goto_1

    .line 199
    :cond_4
    new-instance p1, Ll/azj0;

    .line 200
    .line 201
    invoke-direct {p1}, Ll/azj0;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    new-instance p2, Ll/bzj0;

    .line 209
    .line 210
    invoke-direct {p2, p0, p4}, Ll/bzj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 211
    .line 212
    .line 213
    new-instance v0, Ll/czj0;

    .line 214
    .line 215
    invoke-direct {v0, p0, p3, p4}, Ll/czj0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 216
    .line 217
    .line 218
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iput-object p1, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 227
    .line 228
    return-void
.end method

.method public final M0(Ll/p0k0$b;Lrx/subjects/a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p0k0$b;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/l0k0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/l0k0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/m0k0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p2}, Ll/m0k0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/n0k0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2}, Ll/n0k0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/o0k0;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/o0k0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/tyj0;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/tyj0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/uyj0;

    .line 59
    .line 60
    invoke-direct {v1, p0, p2}, Ll/uyj0;-><init>(Ll/p0k0;Lrx/subjects/a;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/vyj0;

    .line 64
    .line 65
    invoke-direct {v2, p0, p1, p2}, Ll/vyj0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 77
    .line 78
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/data/Picture;ZLjava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final Y(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p0k0$a;",
            "Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;",
            "Ll/p0k0$b;",
            ")",
            "Lrx/c<",
            "Ll/p0k0$b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 6
    .line 7
    if-ne p2, v1, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/wzj0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/wzj0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/xzj0;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/xzj0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 29
    .line 30
    if-ne p2, v1, :cond_1

    .line 31
    .line 32
    new-instance p2, Ll/yzj0;

    .line 33
    .line 34
    invoke-direct {p2}, Ll/yzj0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v0, Ll/a0k0;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1, p3}, Ll/a0k0;-><init>(Ll/p0k0;Ll/p0k0$a;Ll/p0k0$b;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    return-object v0
.end method

.method public final Z(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;",
            "Ll/p0k0$b;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    .line 9
    invoke-virtual {p5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v2, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-static {}, Ll/bnl0;->y0()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/high16 v2, 0x42700000    # 60.0f

    .line 25
    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-int/2addr v0, v2

    .line 31
    invoke-static {p2}, Ll/p0k0$a;->g(Ll/p0k0$a;)Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 36
    .line 37
    if-ne v2, v3, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v1, 0x0

    .line 41
    :goto_0
    const v2, 0x3f4ccccd    # 0.8f

    .line 42
    .line 43
    .line 44
    invoke-static {p1, p5, v2, v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p5

    .line 48
    new-instance v0, Ll/nzj0;

    .line 49
    .line 50
    move-object v1, p0

    .line 51
    move-object v4, p1

    .line 52
    move-object v5, p2

    .line 53
    move-object v2, p3

    .line 54
    move-object v3, p4

    .line 55
    invoke-direct/range {v0 .. v5}, Ll/nzj0;-><init>(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4, p5, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public a0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/p0k0$a;",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v5, v0

    .line 6
    check-cast v5, Ll/p0k0$b;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 9
    .line 10
    iput-object v0, v5, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, v5, Ll/p0k0$b;->d:Z

    .line 14
    .line 15
    const-string v0, "\u88c1\u526a\u7167\u7247"

    .line 16
    .line 17
    iput-object v0, v5, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p3, v5}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, v5, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "file://"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_0

    .line 47
    .line 48
    new-instance v6, Ljava/io/File;

    .line 49
    .line 50
    invoke-direct {v6, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    move-object v1, p0

    .line 60
    move-object v2, p1

    .line 61
    move-object v3, p2

    .line 62
    move-object v4, p3

    .line 63
    invoke-virtual/range {v1 .. v6}, Ll/p0k0;->Z(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Ljava/io/File;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    move-object v1, p0

    .line 68
    move-object v2, p1

    .line 69
    move-object v3, p2

    .line 70
    move-object v4, p3

    .line 71
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p1, ".jpg"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->H1(Landroid/content/Context;)Ljava/io/File;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-nez p2, :cond_1

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/io/File;->mkdir()Z

    .line 103
    .line 104
    .line 105
    :cond_1
    new-instance v6, Ljava/io/File;

    .line 106
    .line 107
    invoke-direct {v6, p1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-nez p0, :cond_2

    .line 115
    .line 116
    const/4 p0, 0x0

    .line 117
    invoke-virtual {v2, p0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    new-instance p1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 125
    .line 126
    sget-object p2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 127
    .line 128
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 133
    .line 134
    .line 135
    iget-object p2, v5, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 136
    .line 137
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    move-object v6, v5

    .line 152
    move-object v5, v4

    .line 153
    move-object v4, v3

    .line 154
    move-object v3, v2

    .line 155
    move-object v2, v1

    .line 156
    new-instance v1, Ll/syj0;

    .line 157
    .line 158
    invoke-direct/range {v1 .. v6}, Ll/syj0;-><init>(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;)V

    .line 159
    .line 160
    .line 161
    move-object v2, v3

    .line 162
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    new-instance p2, Ll/dzj0;

    .line 167
    .line 168
    invoke-direct {p2, v2}, Ll/dzj0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_2
    invoke-virtual/range {v1 .. v6}, Ll/p0k0;->Z(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Ljava/io/File;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/CoreData;Ll/p0k0$b;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p3, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 7
    .line 8
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 11
    .line 12
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 15
    .line 16
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 17
    .line 18
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 19
    .line 20
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 21
    .line 22
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 23
    .line 24
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "repeat"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v1, "WITH_REPEAT_MAIN_PICTURE"

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0, v1}, Ll/p0k0;->X(Lcom/p1/mobile/putong/data/Picture;ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "net"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const-string v1, "WITH_NET_MAIN_PICTURE"

    .line 48
    .line 49
    invoke-virtual {p0, p1, v0, v1}, Ll/p0k0;->X(Lcom/p1/mobile/putong/data/Picture;ZLjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 55
    .line 56
    const-string v1, "low"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const-string v2, "WITH_LOW"

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0, v2}, Ll/p0k0;->X(Lcom/p1/mobile/putong/data/Picture;ZLjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->audit:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const-string v1, "NOT_VERIFICATION"

    .line 76
    .line 77
    invoke-virtual {p0, p1, v0, v1}, Ll/p0k0;->X(Lcom/p1/mobile/putong/data/Picture;ZLjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 81
    .line 82
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_0

    .line 87
    .line 88
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 89
    .line 90
    const/4 p1, 0x0

    .line 91
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Ljava/lang/String;

    .line 96
    .line 97
    iput-object p0, p3, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public c0()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic d0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Envelope;)Ll/p0k0$b;
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 6
    .line 7
    const/16 v1, 0xc8

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 12
    .line 13
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 20
    .line 21
    iget-object v0, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, v0, p2, p1}, Ll/p0k0;->b0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/CoreData;Ll/p0k0$b;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-object p1
.end method

.method public final synthetic e0(Ll/p0k0$a;Ll/p0k0$b;Ll/p0k0$b;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p3, p3, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ll/p0k0$a;->f(Ll/p0k0$a;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string p1, "editProfile"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {p1}, Ll/p0k0$a;->f(Ll/p0k0$a;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, p3, v1, p1}, Ll/dkb;->G9(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 p3, 0x0

    .line 32
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    const-wide/16 v0, 0x5

    .line 37
    .line 38
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1, v2, p3}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p3, Ll/c0k0;

    .line 45
    .line 46
    invoke-direct {p3, p0, p2}, Ll/c0k0;-><init>(Ll/p0k0;Ll/p0k0$b;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/d0k0;

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ll/d0k0;-><init>(Ll/p0k0$b;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public final synthetic f0(Ll/p0k0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g0(Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p5, -0x1

    .line 2
    const/4 v0, 0x1

    .line 3
    if-ne p6, p5, :cond_0

    .line 4
    .line 5
    const-string p5, "path"

    .line 6
    .line 7
    invoke-virtual {p7, p5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p5

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    .line 14
    move-result-object p6

    .line 15
    const-string p7, "preprocessed"

    .line 16
    .line 17
    invoke-static {p7}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p7

    .line 21
    iput-object p7, p6, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 22
    .line 23
    invoke-static {p5}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p5

    .line 27
    iput-object p5, p6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 28
    .line 29
    new-instance p5, Ll/sim;

    .line 30
    .line 31
    iget-object p7, p6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p7}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p7

    .line 37
    invoke-direct {p5, p7}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p7, Lcom/p1/mobile/putong/data/Dimension;

    .line 41
    .line 42
    iget-object p5, p5, Ll/sim;->d:[I

    .line 43
    .line 44
    invoke-direct {p7, p5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 45
    .line 46
    .line 47
    iput-object p7, p6, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 48
    .line 49
    const-string p5, "image/jpeg"

    .line 50
    .line 51
    iput-object p5, p6, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 54
    .line 55
    .line 56
    new-instance p5, Ll/qzj0;

    .line 57
    .line 58
    invoke-direct {p5}, Ll/qzj0;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p5

    .line 65
    new-instance p7, Ll/rzj0;

    .line 66
    .line 67
    invoke-direct {p7, p0}, Ll/rzj0;-><init>(Ll/p0k0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p7}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p7

    .line 74
    invoke-virtual {p5, p7}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    move-result-object p5

    .line 78
    iput-object p5, p0, Ll/p0k0;->b:Ll/kcg0;

    .line 79
    .line 80
    iput-object p6, p2, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    sget-object p5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 83
    .line 84
    iput-object p5, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 85
    .line 86
    const-string p5, ""

    .line 87
    .line 88
    iput-object p5, p2, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 89
    .line 90
    iput-boolean v0, p2, Ll/p0k0$b;->e:Z

    .line 91
    .line 92
    const-string p5, "\u88c1\u526a\u7167\u7247-\u6210\u529f"

    .line 93
    .line 94
    iput-object p5, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p3, p4, p2, p1}, Ll/p0k0;->L0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 104
    .line 105
    iput-object p3, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 106
    .line 107
    const-string p3, "\u88c1\u526a\u7167\u7247-\u53d6\u6d88"

    .line 108
    .line 109
    iput-object p3, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 115
    .line 116
    .line 117
    :goto_0
    return v0
.end method

.method public final synthetic h0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    move-object p5, p6

    .line 5
    invoke-virtual/range {p0 .. p5}, Ll/p0k0;->Z(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i0(Ll/p0k0$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0k0;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j0(Ll/p0k0$b;Lrx/subjects/a;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p5, -0x1

    .line 2
    const/4 v0, 0x1

    .line 3
    if-ne p6, p5, :cond_1

    .line 4
    .line 5
    sget-object p5, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p7, p5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object p5

    .line 11
    check-cast p5, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-static {p5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p6

    .line 17
    if-eqz p6, :cond_0

    .line 18
    .line 19
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 20
    .line 21
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 22
    .line 23
    const-string p3, "\u9009\u62e9\u7167\u7247-\u5f02\u5e38"

    .line 24
    .line 25
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :cond_0
    const/4 p6, 0x0

    .line 32
    invoke-virtual {p5, p6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    check-cast p5, Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    iput-object p5, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 39
    .line 40
    sget-object p5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH_PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 41
    .line 42
    iput-object p5, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 43
    .line 44
    const-string p5, ""

    .line 45
    .line 46
    iput-object p5, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 47
    .line 48
    iput-boolean v0, p1, Ll/p0k0$b;->e:Z

    .line 49
    .line 50
    const-string p5, "\u9009\u62e9\u5a92\u4f53-\u6210\u529f"

    .line 51
    .line 52
    iput-object p5, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, p3, p4, p2, p1}, Ll/p0k0;->G0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/16 p3, 0x1001

    .line 59
    .line 60
    if-ne p6, p3, :cond_2

    .line 61
    .line 62
    sget-object p3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 63
    .line 64
    sget p4, Lcom/tantan/core/base/R$string;->J:I

    .line 65
    .line 66
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-static {p3}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 74
    .line 75
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 76
    .line 77
    const-string p3, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u957f\u4e86"

    .line 78
    .line 79
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    const/16 p3, 0x1002

    .line 86
    .line 87
    if-ne p6, p3, :cond_3

    .line 88
    .line 89
    sget-object p3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 90
    .line 91
    sget p4, Lcom/tantan/core/base/R$string;->K:I

    .line 92
    .line 93
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-static {p3}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 101
    .line 102
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 103
    .line 104
    const-string p3, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u77ed\u4e86"

    .line 105
    .line 106
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 113
    .line 114
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 115
    .line 116
    const-string p3, "\u9009\u62e9\u5a92\u4f53-\u53d6\u6d88"

    .line 117
    .line 118
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 124
    .line 125
    .line 126
    :goto_0
    return v0
.end method

.method public final synthetic k0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u5148\u68c0\u6d4b\u6d41\u7a0b-\u542f\u52a8"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l0(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->Y(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic m0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->BEFORE_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u5148\u68c0\u6d4b\u6d41\u7a0b-\u7ed3\u675f"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic n0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)Ll/p0k0$b;
    .locals 1

    .line 1
    instance-of v0, p3, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 13
    .line 14
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 15
    .line 16
    const/4 p3, 0x1

    .line 17
    iput-boolean p3, p1, Ll/p0k0$b;->d:Z

    .line 18
    .line 19
    iget-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    const-string p3, "\u4e0a\u4f20\u5931\u8d25"

    .line 28
    .line 29
    iput-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    const-string p3, "\u5148\u68c0\u6d4b\u6d41\u7a0b-\u5931\u8d25"

    .line 32
    .line 33
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 36
    .line 37
    .line 38
    return-object p1
.end method

.method public final synthetic o0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->UPLOADING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u4e0a\u4f20\u56fe\u7247-\u5f00\u59cb"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic p0(Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 2
    .line 3
    .line 4
    return-object p2
.end method

.method public final synthetic q0(Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 4

    .line 1
    iget-object v0, p2, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "user-profile"

    .line 12
    .line 13
    const-string v2, "profile"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-static {v0, v2, v1, v3}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/tzj0;

    .line 24
    .line 25
    invoke-direct {v1, p2}, Ll/tzj0;-><init>(Ll/p0k0$b;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/uzj0;

    .line 33
    .line 34
    invoke-direct {v1, p2}, Ll/uzj0;-><init>(Ll/p0k0$b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/vzj0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1, p2}, Ll/vzj0;-><init>(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final synthetic r0(Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u6dfb\u52a0\u6807\u7b7e-\u5b8c\u6210"

    .line 6
    .line 7
    iput-object v0, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p3, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic s0(Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p1, Ll/p0k0$b;->d:Z

    .line 10
    .line 11
    const-string v0, "\u6dfb\u52a0\u6807\u7b7e-\u53d6\u6d88"

    .line 12
    .line 13
    iput-object v0, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p3, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 3

    .line 1
    iget-object v0, p2, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/e0k0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2, p3, p4}, Ll/e0k0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/f0k0;

    .line 13
    .line 14
    invoke-direct {v2, p0, p2, p3, p4}, Ll/f0k0;-><init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {p1, v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic u0(Ll/p0k0$a;Lcom/p1/mobile/android/app/Act;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/p0k0$a;->c(Ll/p0k0$a;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance p1, Ll/szj0;

    .line 12
    .line 13
    invoke-direct {p1, p0, p2, p4, p3}, Ll/szj0;-><init>(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 22
    .line 23
    iput-object p2, p4, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 24
    .line 25
    const-string p2, "\u6dfb\u52a0\u6807\u7b7e-\u5b8c\u6210"

    .line 26
    .line 27
    iput-object p2, p4, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p2, p4, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-static {p1}, Ll/p0k0$a;->c(Ll/p0k0$a;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {p0, p3, p4}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p4}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final synthetic v0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_CHECKING:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u540e\u68c0\u6d4b\u6d41\u7a0b-\u542f\u52a8"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic w0(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/p0k0;->Y(Ll/p0k0$a;Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;Ll/p0k0$b;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic x0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->AFTER_DONE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u540e\u68c0\u6d4b\u6d41\u7a0b-\u7ed3\u675f"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y0(Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object v0, p2, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    const-string v0, "\u8ba2\u9605\u7ed3\u675f-\u5b8c\u6210"

    .line 6
    .line 7
    iput-object v0, p2, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic z0(Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 2
    .line 3
    iput-object p3, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 4
    .line 5
    iget-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const-string p3, "\u4e0a\u4f20\u5931\u8d25"

    .line 14
    .line 15
    iput-object p3, p1, Ll/p0k0$b;->c:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    const-string p3, "\u8ba2\u9605\u7ed3\u675f-\u5931\u8d25"

    .line 18
    .line 19
    iput-object p3, p1, Ll/p0k0$b;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p2, p1}, Ll/p0k0;->K0(Lrx/subjects/a;Ll/p0k0$b;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
