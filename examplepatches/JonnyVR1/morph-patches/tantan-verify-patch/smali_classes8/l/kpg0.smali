.class public final Ll/kpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kpg0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/kpg0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-static {p4}, Ll/gog0;->a(Ljava/lang/String;)Ll/gog0;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-boolean p2, p2, Ll/gog0;->a:Z

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p2, p1, Ll/bfg0;->b:Ll/dhg0;

    .line 18
    .line 19
    iget-object p2, p2, Ll/dhg0;->v:Ll/mkg0;

    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object p2, p1, Ll/bfg0;->b:Ll/dhg0;

    .line 25
    .line 26
    iget-object p3, p2, Ll/dhg0;->v:Ll/mkg0;

    .line 27
    .line 28
    if-nez p3, :cond_2

    .line 29
    .line 30
    iget-object p3, p2, Ll/dhg0;->h:Landroid/content/Context;

    .line 31
    .line 32
    iget-object v0, p1, Ll/bfg0;->a:Ll/dhg0;

    .line 33
    .line 34
    iget-object v1, p2, Ll/dhg0;->c:Ljava/lang/String;

    .line 35
    .line 36
    iget-wide v2, p2, Ll/dhg0;->e:J

    .line 37
    .line 38
    iget-object v4, p2, Ll/dhg0;->d:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 41
    .line 42
    invoke-direct {v5}, Ltech/sud/gip/asr/base/model/InitASRParamModel;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p3, v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;->context:Landroid/content/Context;

    .line 46
    .line 47
    new-instance p3, Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-direct {p3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iput-object p3, v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;->iSudFSTAPP:Ljava/lang/ref/WeakReference;

    .line 53
    .line 54
    iput-object v1, v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;->userId:Ljava/lang/String;

    .line 55
    .line 56
    iput-wide v2, v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;->mgId:J

    .line 57
    .line 58
    iput-object v4, v5, Ltech/sud/gip/asr/base/model/InitASRParamModel;->roomId:Ljava/lang/String;

    .line 59
    .line 60
    new-instance p3, Ll/mkg0;

    .line 61
    .line 62
    invoke-direct {p3, v5}, Ll/mkg0;-><init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;)V

    .line 63
    .line 64
    .line 65
    iput-object p3, p2, Ll/dhg0;->v:Ll/mkg0;

    .line 66
    .line 67
    :cond_2
    iget-object p1, p1, Ll/bfg0;->b:Ll/dhg0;

    .line 68
    .line 69
    iget-object p1, p1, Ll/dhg0;->v:Ll/mkg0;

    .line 70
    .line 71
    iget-object p1, p1, Ll/mkg0;->a:Ltech/sud/gip/asr/base/BaseRealSudASRImpl;

    .line 72
    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    invoke-interface {p1, p4}, Ltech/sud/gip/asr/base/Sudtry;->handleGameASR(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/kpg0;->a:Ll/wyg0;

    .line 79
    .line 80
    iget-object p0, p0, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Ltech/sud/gip/core/ISudFSMMG;

    .line 87
    .line 88
    if-eqz p0, :cond_4

    .line 89
    .line 90
    const-string p1, "mg_common_game_asr"

    .line 91
    .line 92
    invoke-interface {p0, p5, p1, p4}, Ltech/sud/gip/core/ISudFSMMG;->onGameStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void
.end method
