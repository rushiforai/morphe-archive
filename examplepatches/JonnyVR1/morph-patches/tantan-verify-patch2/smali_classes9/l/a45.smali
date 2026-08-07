.class public Ll/a45;
.super Ll/a3g0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a3g0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/p2g0;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/p2g0;->a()Ll/d3g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/d3g0;->b()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/d3g0;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveCheckSdkActivity;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/iit$a;->S()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0}, Ll/wgt;->u(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const-string v0, "[live]voicePlayer"

    .line 36
    .line 37
    const-string v2, "pre check sdk when enter room"

    .line 38
    .line 39
    invoke-static {v0, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Landroid/content/Intent;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/d3g0;->a()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/d3g0;->g(Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-static {}, Ll/elt;->u()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/d3g0;->e()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    new-instance v0, Landroid/content/Intent;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/d3g0;->a()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .line 75
    .line 76
    const-string v1, "download_type"

    .line 77
    .line 78
    const-string v2, "ffmpeg_so_type"

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v0}, Ll/d3g0;->g(Landroid/content/Intent;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    :goto_0
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 87
    .line 88
    .line 89
    return-void
.end method
