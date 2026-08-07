.class public Ll/tr90;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static h:Ljava/lang/String; = "data_from_edit"

.field public static i:Ljava/lang/String; = "data_from_tag_instance"

.field public static j:Ljava/lang/String; = "data_from_marry"

.field public static k:Ljava/lang/String; = "data_from_pick"

.field public static l:Ljava/lang/String; = "data_from_explore"

.field public static m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;

.field public static final o:Ljava/lang/String;

.field public static final p:Ljava/lang/String;

.field public static final q:Ljava/lang/String;

.field public static final r:Ljava/lang/String;

.field public static s:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/IdealInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public final c:Lv/VText;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Z

.field public final e:Z

.field public f:Ll/t4m;

.field public g:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com"

    .line 11
    .line 12
    :goto_0
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-optimization-tags/index.html?speed=true&_bid=1004745&hideNavigationBar=1&hideNotch=1&preview=true&picIdxList=%s&showAddTagBtn=false&datingTagsFrom=%s#/tagEditing"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/tr90;->m:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-optimization-MBTI/index.html?speed=true&_bid=1004746&hideNavigationBar=1&hideNotch=1#/personalityIntroduction?ownresult=false&mbti="

    .line 21
    .line 22
    sput-object v0, Ll/tr90;->n:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-optimization-MBTI/index.html?speed=true&_bid=1004746&hideNavigationBar=1&hideNotch=1&from=%s"

    .line 25
    .line 26
    sput-object v0, Ll/tr90;->o:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-ideal-type/index.html?speed=true&_bid=1005037&hideNavigationBar=1&hideNotch=1#/"

    .line 29
    .line 30
    sput-object v0, Ll/tr90;->p:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-ideal-type/index.html?speed=true&_bid=1005037&hideNavigationBar=1&hideNotch=1&uid=$#/all"

    .line 33
    .line 34
    sput-object v0, Ll/tr90;->q:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/certification-benefits/index.html?speed=true&_bid=1005355&hideNavigationBar=1&hideNotch=1&likedByLimit=%s&from=%s&receiveLikeNum=%s#/"

    .line 37
    .line 38
    sput-object v0, Ll/tr90;->r:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    sput-object v0, Ll/tr90;->s:Ll/pf60;

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V
    .locals 1
    .param p2    # Lv/VText;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xra;->r()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput-boolean v0, p0, Ll/tr90;->d:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/tr90;->e:Z

    .line 11
    .line 12
    iput-object p1, p0, Ll/tr90;->b:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-object p2, p0, Ll/tr90;->c:Lv/VText;

    .line 15
    .line 16
    return-void
.end method

.method public static A(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/tr90;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 8

    .line 1
    sget-object v0, Ll/tr90;->r:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->y6()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m6()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v1, p1, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const/4 v6, 0x1

    .line 40
    const/4 v7, 0x0

    .line 41
    const-string v2, ""

    .line 42
    .line 43
    const/4 v4, 0x1

    .line 44
    const/4 v5, 0x1

    .line 45
    move-object v1, p0

    .line 46
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance p1, Ll/or90;

    .line 51
    .line 52
    invoke-direct {p1, p2}, Ll/or90;-><init>(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 2
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 44
    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v1, Ll/pr90;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/pr90;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v1, Ll/qr90;

    .line 64
    .line 65
    invoke-direct {v1, v0}, Ll/qr90;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Ll/rr90;

    .line 77
    .line 78
    invoke-direct {v0, p0, p2}, Ll/rr90;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/sr90;

    .line 82
    .line 83
    invoke-direct {p2, p0, p3}, Ll/sr90;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static E(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x2710

    .line 2
    .line 3
    if-le p0, v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    div-int/2addr p0, v0

    .line 11
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p0, "w"

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/16 v0, 0x3e8

    .line 25
    .line 26
    if-le p0, v0, :cond_1

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    div-int/2addr p0, v0

    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, "k"

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic a(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->isHit:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

    .line 11
    .line 12
    .line 13
    throw p0

    .line 14
    :cond_1
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_1
    instance-of p1, p2, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 20
    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    check-cast p2, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p1, p0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->s:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->Y0:I

    .line 46
    .line 47
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 48
    .line 49
    .line 50
    :cond_3
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ProfileCountInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->profile:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Runnable;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sk()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 27
    .line 28
    const-string p1, "question"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->r4(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static synthetic f(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-interface {p3, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Pf(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic g(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-interface {p3, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Pf(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic i(Ll/tr90;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tr90;->w(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    const-string v1, "\u5979"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const-string v1, "\u4ed6"

    .line 19
    .line 20
    :goto_0
    invoke-static {p0, v1}, Ll/tr90;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->I0:I

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->S:I

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/nr90;

    .line 49
    .line 50
    invoke-direct {v2, p2, p0, p1}, Ll/nr90;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dkb;->e8()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-static {p0}, Ll/ey0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-static {p0}, Ll/ey0;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/tq8;->F()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "\u62c9\u9ed1\u540e\uff0c"

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, "\u4e0d\u80fd\u5bf9\u4f60\u53d1\u9001\u6d88\u606f\u3001\u6253\u62db\u547c\u3001\u8d44\u6599\u7559\u8a00\u3001\u70b9\u8d5e\u3001\u8bc4\u8bba\uff0c\u540c\u65f6\u7cfb\u7edf\u5c06\u4e0d\u518d\u4e3a\u4f60\u63a8\u8350\u8be5\u7528\u6237\u3002\u4f60\u53ef\u5728\u201c\u8bbe\u7f6e-\u9690\u79c1\u548c\u901a\u77e5-\u9ed1\u540d\u5355\u201d\u5185\u89e3\u9664\u62c9\u9ed1\u3002"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->J0:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->b7:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/tr90;->o(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    new-instance v1, Ll/mr90;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/mr90;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->count:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/tr90;->E(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_0
    const-string p0, ""

    .line 50
    .line 51
    return-object p0
.end method

.method public static n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;
    .locals 1

    .line 1
    const-string v0, "fitness"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->FITNESS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "car"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->CAR:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string v0, "company"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->COMPANY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string v0, "drink"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DRINKING:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    const-string v0, "education"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_4
    const-string v0, "houseInfo"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOUSE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_5
    const-string v0, "income"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_6

    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INCOME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_6
    const-string v0, "school"

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL_NEW:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_7
    const-string v0, "height"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_8

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HEIGHT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_8
    const-string v0, "smoke"

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_9

    .line 107
    .line 108
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SMOKING:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_9
    const-string v0, "work"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PROFESSION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_a
    const-string v0, "game"

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_b

    .line 129
    .line 130
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_CP:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 131
    .line 132
    return-object p0

    .line 133
    :cond_b
    const-string v0, "pic"

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_c

    .line 140
    .line 141
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_c
    const-string v0, "mbti"

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_d

    .line 151
    .line 152
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MBTI_TEST:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 153
    .line 154
    return-object p0

    .line 155
    :cond_d
    const-string v0, "pet"

    .line 156
    .line 157
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_e

    .line 162
    .line 163
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PET:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 164
    .line 165
    return-object p0

    .line 166
    :cond_e
    const-string v0, "signature"

    .line 167
    .line 168
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_f

    .line 173
    .line 174
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 175
    .line 176
    return-object p0

    .line 177
    :cond_f
    const/4 p0, 0x0

    .line 178
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/tr90$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "game"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "pic"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "mbti"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "pet"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "signature"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "work"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "smoke"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "height"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "school"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_9
    const-string p0, "income"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_a
    const-string p0, "houseInfo"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_b
    const-string p0, "education"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_c
    const-string p0, "drink"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_d
    const-string p0, "company"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_e
    const-string p0, "car"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_f
    const-string p0, "fitness"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static q(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    sget-object v0, Ll/tr90;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    sget-object v0, Ll/tr90;->l:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    sget-object v0, Ll/tr90;->i:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    sget-object v0, Ll/tr90;->j:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    sget-object v0, Ll/tr90;->k:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p0, 0x0

    .line 53
    goto :goto_2

    .line 54
    :cond_3
    :goto_0
    sget-object p0, Ll/k3x;->l:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_4
    :goto_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :goto_2
    if-nez p0, :cond_5

    .line 70
    .line 71
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    :cond_5
    return-object p0
.end method

.method public static r(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/CharSequence;

    .line 35
    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    return v1
.end method

.method public static s(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static t(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/CharSequence;

    .line 35
    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    return v1
.end method

.method public static v(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string v0, "Temporarily not revealed"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v0, "\u66ab\u4e0d\u900f\u9732"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "\u6682\u4e0d\u900f\u9732"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->Q:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->R:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p0, v1}, Ll/tr90;->x(Lcom/p1/mobile/android/app/Act;Z)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->P:I

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->S:I

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Ll/lr90;

    .line 42
    .line 43
    invoke-direct {v2, p2, p0, p1}, Ll/lr90;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final C()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setZ(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/tr90;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setZ(F)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/graphics/PointF;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 16
    .line 17
    .line 18
    const/high16 v1, 0x3f000000    # 0.5f

    .line 19
    .line 20
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 21
    .line 22
    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 23
    .line 24
    iget-object v1, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 25
    .line 26
    sget v2, Ll/gdc0;->v:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ll/wlj;

    .line 39
    .line 40
    sget-object v2, Ll/h1e0;->j:Ll/h1e0;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 46
    .line 47
    sget v2, Ll/gdc0;->v:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ll/wlj;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-boolean v1, p0, Ll/tr90;->e:Z

    .line 69
    .line 70
    if-eqz v1, :cond_0

    .line 71
    .line 72
    const/4 v1, 0x0

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 77
    .line 78
    const/high16 v1, 0x41500000    # 13.0f

    .line 79
    .line 80
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    sget v1, Ll/qa00;->j:I

    .line 89
    .line 90
    const/high16 v2, 0x41300000    # 11.0f

    .line 91
    .line 92
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 104
    .line 105
    iget-object v2, p0, Ll/tr90;->b:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    sget v3, Ll/j9c0;->e:I

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 117
    .line 118
    sget v2, Ll/qa00;->h:I

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 124
    .line 125
    sget v2, Ll/qa00;->k:I

    .line 126
    .line 127
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 131
    .line 132
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/tr90;->c:Lv/VText;

    .line 136
    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 138
    .line 139
    .line 140
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 141
    .line 142
    new-instance v1, Ll/kr90;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/kr90;-><init>(Ll/tr90;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setOnDraggingListener(Ll/y20;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ll/tr90;->f:Ll/t4m;

    .line 151
    .line 152
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_2

    .line 157
    .line 158
    iget-object v0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 159
    .line 160
    iget-object p0, p0, Ll/tr90;->f:Ll/t4m;

    .line 161
    .line 162
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setReorderCardsCallback(Ll/t4m;)V

    .line 163
    .line 164
    .line 165
    :cond_2
    return-void
.end method

.method public p()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tr90;->g:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Z)",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/tr90;->e:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/tr90;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/sec0;->u0:I

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/gdc0;->b:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lv/VText;

    .line 26
    .line 27
    iput-object v1, p0, Ll/tr90;->g:Lv/VText;

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    sget p1, Ll/gdc0;->I:I

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 41
    .line 42
    iput-object p1, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/tr90;->C()V

    .line 48
    .line 49
    .line 50
    sget p1, Ll/gdc0;->l:I

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/16 p2, 0x8

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    sget p1, Ll/gdc0;->F:I

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Landroid/util/Pair;

    .line 71
    .line 72
    iget-object p0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 73
    .line 74
    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-object p1

    .line 78
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/sec0;->u0:I

    .line 83
    .line 84
    invoke-virtual {v0, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sget v1, Ll/gdc0;->b:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Lv/VText;

    .line 95
    .line 96
    iput-object v1, p0, Ll/tr90;->g:Lv/VText;

    .line 97
    .line 98
    if-eqz p2, :cond_2

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    sget p1, Ll/gdc0;->I:I

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 110
    .line 111
    iput-object p1, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/tr90;->C()V

    .line 117
    .line 118
    .line 119
    new-instance p1, Landroid/util/Pair;

    .line 120
    .line 121
    iget-object p0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 122
    .line 123
    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-object p1
.end method

.method public final synthetic w(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tr90;->g:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ll/xra;->w()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/tr90;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->L0()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    :cond_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public z(Ll/t4m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tr90;->f:Ll/t4m;

    .line 2
    .line 3
    return-void
.end method
