.class public Ll/lti;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lti$b;
    }
.end annotation


# instance fields
.field public a:Ll/uti;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/mti;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lti;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/lti;Ll/hti;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lti;->h(Ll/hti;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/lti;Ll/hti;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lti;->g(Ll/hti;)V

    return-void
.end method

.method public static d()Ll/lti;
    .locals 1

    .line 1
    invoke-static {}, Ll/lti$b;->a()Ll/lti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static e()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->Q6()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static f()Z
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->u()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {}, Ll/lti;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    return v0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    return v0
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lti;->a:Ll/uti;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/lti;->a:Ll/uti;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0, v0}, Ll/uti;->K0(ZZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final g(Ll/hti;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Ll/hti;->h(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ll/iti;->c()Ll/iti;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Ll/iti;->e(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final h(Ll/hti;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->v0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {p1, p0}, Ll/hti;->h(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ll/uti;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/uti;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/lti;->a:Ll/uti;

    .line 20
    .line 21
    new-instance v0, Ll/xti;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/xti;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/lti;->a:Ll/uti;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/uti;->m(Ll/xti;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/lti;->a:Ll/uti;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/xti;->b(Ll/uti;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/lti;->a:Ll/uti;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/uti;->w(Ll/hti;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p1, v0}, Ll/hti;->h(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/lti;->a:Ll/uti;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/uti;->G1()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public i(Ll/hti;Lcom/p1/mobile/android/app/Act;Z)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v1, Ll/z2d0;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v3, "live_float_window_has_request_permission"

    .line 26
    .line 27
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {v1, p1, v2}, Ll/z2d0;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/kti;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/kti;-><init>(Ll/lti;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/z2d0;->q(Ll/y20;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/lti$a;

    .line 55
    .line 56
    invoke-direct {v2, p0, p2}, Ll/lti$a;-><init>(Ll/lti;Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ll/z2d0;->p(Ll/y20;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 63
    .line 64
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->C4:I

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/vp20;->p()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {v1, p0, p3, v0, p1}, Ll/z2d0;->o(Ljava/lang/String;ZZZ)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    return p0

    .line 83
    :cond_1
    :goto_0
    return v0
.end method
