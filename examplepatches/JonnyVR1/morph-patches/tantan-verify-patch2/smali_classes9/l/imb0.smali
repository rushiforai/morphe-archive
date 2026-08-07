.class public Ll/imb0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/a4m;

.field public final j:Ll/d4m;


# direct methods
.method public constructor <init>(Ll/dum;Ll/a4m;Ll/d4m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/imb0;->i:Ll/a4m;

    .line 5
    .line 6
    iput-object p3, p0, Ll/imb0;->j:Ll/d4m;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public J3(I)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 19
    .line 20
    :cond_1
    if-eqz v0, :cond_2

    .line 21
    .line 22
    const-string v1, "retry no connection"

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0, p1}, Ll/imb0;->r0(Ljava/lang/String;II)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_2
    return v1
.end method

.method public K3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imb0;->j:Ll/d4m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/d4m;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imb0;->j:Ll/d4m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/d4m;->getErrorCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public M3(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/imb0;->i:Ll/a4m;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ll/a4m;->d(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qc80;

    .line 8
    .line 9
    const/16 v1, 0xa28

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    new-instance v0, Ll/ml50;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/ml50;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 44
    .line 45
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    iget-object p0, p0, Ll/imb0;->j:Ll/d4m;

    .line 56
    .line 57
    invoke-interface {p0, p1, p2}, Ll/d4m;->a(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public r0(Ljava/lang/String;II)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p2, p3}, Ll/imb0;->M3(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/v2t;->b:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "error reason: "

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, " code: "

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, " str: "

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
