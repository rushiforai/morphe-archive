.class public final Ll/npv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/npv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/npv0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/opv0;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/npv0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/media/AudioManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/media/AudioManager;->getMode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/media/AudioManager;->isMusicActive()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    sget-object v5, Ll/sgs0;->va:Ll/dgs0;

    .line 29
    .line 30
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_0

    .line 45
    .line 46
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v5, p0}, Ll/ccr0;->i(Landroid/media/AudioManager;)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    move v6, v0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v5, -0x1

    .line 61
    move v6, v5

    .line 62
    :goto_0
    invoke-virtual {p0}, Landroid/media/AudioManager;->getRingerMode()I

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    const/4 v0, 0x2

    .line 67
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    invoke-static {}, Ll/bxy0;->t()Ll/mdr0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Ll/mdr0;->a()F

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    invoke-static {}, Ll/bxy0;->t()Ll/mdr0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/mdr0;->e()Z

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    new-instance v0, Ll/opv0;

    .line 88
    .line 89
    invoke-direct/range {v0 .. v10}, Ll/opv0;-><init>(IZZIIIIIFZ)V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0xd

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/mpv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mpv0;-><init>(Ll/npv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/npv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
