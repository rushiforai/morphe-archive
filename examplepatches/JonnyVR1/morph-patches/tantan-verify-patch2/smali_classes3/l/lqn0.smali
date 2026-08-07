.class public Ll/lqn0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->rb:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->pb:I

    .line 11
    .line 12
    :goto_0
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->sb:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->qb:I

    .line 26
    .line 27
    :goto_1
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/jqn0;

    .line 44
    .line 45
    invoke-direct {v0, p2}, Ll/jqn0;-><init>(Ll/x20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 53
    .line 54
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->kb:I

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Ll/kqn0;

    .line 61
    .line 62
    invoke-direct {p2}, Ll/kqn0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 p1, 0x1

    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 75
    .line 76
    .line 77
    return-void
.end method
