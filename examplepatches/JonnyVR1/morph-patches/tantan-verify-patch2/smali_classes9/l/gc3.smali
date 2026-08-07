.class public Ll/gc3;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/iz0;

.field public j:Ll/rz0;

.field public k:Ll/zz0;

.field public l:Ll/osc0;

.field public m:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-object v1, p1, Ll/dum;->h:Ll/oo2;

    .line 13
    .line 14
    invoke-static {v1}, Ll/u9t;->c(Ll/oo2;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 24
    :goto_1
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;-><init>(Z)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/gc3;->m:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 28
    .line 29
    new-instance v0, Ll/osc0;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/osc0;-><init>(Ll/dum;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/osc0;

    .line 39
    .line 40
    iput-object v0, p0, Ll/gc3;->l:Ll/osc0;

    .line 41
    .line 42
    new-instance v0, Ll/iz0;

    .line 43
    .line 44
    invoke-direct {v0, p1, p2}, Ll/iz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Ll/iz0;

    .line 52
    .line 53
    iput-object p2, p0, Ll/gc3;->i:Ll/iz0;

    .line 54
    .line 55
    new-instance p2, Ll/rz0;

    .line 56
    .line 57
    invoke-direct {p2, p1, p3}, Ll/rz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Ll/rz0;

    .line 65
    .line 66
    iput-object p2, p0, Ll/gc3;->j:Ll/rz0;

    .line 67
    .line 68
    new-instance p2, Ll/zz0;

    .line 69
    .line 70
    invoke-direct {p2, p1}, Ll/zz0;-><init>(Ll/dum;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Ll/zz0;

    .line 78
    .line 79
    iput-object p2, p0, Ll/gc3;->k:Ll/zz0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_3

    .line 86
    .line 87
    iget-object p2, p1, Ll/dum;->h:Ll/oo2;

    .line 88
    .line 89
    invoke-static {p2}, Ll/u9t;->c(Ll/oo2;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_2

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_2
    return-void

    .line 97
    :cond_3
    :goto_2
    new-instance p2, Ll/nv2;

    .line 98
    .line 99
    invoke-direct {p2, p1}, Ll/nv2;-><init>(Ll/dum;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static synthetic J3(Ll/gc3;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/gc3;Ll/vf3$b;)Ll/g4$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->W3(Ll/vf3$b;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/gc3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gc3;->a4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic N3(Ll/gc3;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->Z3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O3(Ll/gc3;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->b4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V

    return-void
.end method

.method public static synthetic P3(Ll/gc3;Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V

    return-void
.end method

.method public static synthetic R3(Ll/gc3;Ll/se3;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->X3(Ll/se3;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/gc3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc3;->c4(Ll/vxj0;)V

    return-void
.end method

.method private synthetic a4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gc3;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wb3;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wb3;-><init>(Ll/gc3;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/vf3$b;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/xb3;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/xb3;-><init>(Ll/gc3;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/se3;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final T3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gc3;->i:Ll/iz0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cm2;->V3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gc3;->j:Ll/rz0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/cm2;->V3()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/gc3;->k:Ll/zz0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zz0;->N3()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final U3(Ljava/lang/String;I)Ll/g4$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gc3;->i:Ll/iz0;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/cm2;->Y3(Ljava/lang/String;)Ll/g4$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/gc3;->j:Ll/rz0;

    .line 14
    .line 15
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {v0, p2}, Ll/cm2;->Y3(Ljava/lang/String;)Ll/g4$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object p2, p0, Ll/gc3;->i:Ll/iz0;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ll/cm2;->Z3(Ljava/lang/String;)Ll/g4$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    if-nez p2, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/gc3;->j:Ll/rz0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/cm2;->Z3(Ljava/lang/String;)Ll/g4$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    return-object p2

    .line 41
    :cond_2
    return-object v0
.end method

.method public final V3()Z
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bf10;->B(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ml50;

    .line 6
    .line 7
    const/16 v2, 0x320

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/ml50;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public final synthetic W3(Ll/vf3$b;)Ll/g4$a;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/vf3;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget p1, p1, Ll/vf3;->d:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/gc3;->U3(Ljava/lang/String;I)Ll/g4$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic X3(Ll/se3;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gc3;->m:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->n()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "bottom menu:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const-string v1, "null"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "[live]bottom"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/gc3;->m:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->l(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic Z3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gc3;->m:Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->k()Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/gc3;->e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "bottom refresh error:"

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, "null"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "[live]bottom"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkBottomMenu$LiveBottomMenuUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gc3;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gc3;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d4()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/mc50;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/mc50;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorId:Ljava/lang/String;

    .line 22
    .line 23
    :goto_0
    move-object v7, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const-string v0, ""

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0}, Ll/gc3;->V3()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    invoke-static {p0}, Ll/bf10;->M(Ll/i6t;)Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f5(Ljava/lang/String;ZZLjava/lang/String;ZZLjava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/cc3;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/cc3;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/dc3;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/dc3;-><init>(Ll/gc3;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/ec3;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ec3;-><init>(Ll/gc3;)V

    .line 91
    .line 92
    .line 93
    new-instance v2, Ll/fc3;

    .line 94
    .line 95
    invoke-direct {v2, p0}, Ll/fc3;-><init>(Ll/gc3;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gc3;->T3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gc3;->l:Ll/osc0;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/osc0;->e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/gc3;->i:Ll/iz0;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->q()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/iz0;->f4(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/gc3;->j:Ll/rz0;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->r()Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/rz0;->o4(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->p()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/gc3;->k:Ll/zz0;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->u()Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->n()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v1, v2}, Ll/zz0;->S3(Ljava/util/List;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/NewBottomIconModuleInfo;->v()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->customChatInputStyle()Ll/v3f$d;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/yb3;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/yb3;-><init>(Ll/gc3;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/aj1;->v()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/zb3;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/zb3;-><init>(Ll/gc3;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->startLiveMultiCall()Ll/v3f$d;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/ac3;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/ac3;-><init>(Ll/gc3;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0, v1}, Ll/i6t;->g3(Ll/v3f$b;Ll/x20;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->closeMultiCallMotion()Ll/v3f$c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/bc3;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/bc3;-><init>(Ll/gc3;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/gc3;->d4()V

    .line 101
    .line 102
    .line 103
    return-void
.end method
