.class public abstract Ll/c4k0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/oms/OmsBaseRender;


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/OMSAction;Lcom/p1/mobile/putong/oms/OmsBaseRender;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/c4k0;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSAction;->type:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/c4k0;->e(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ll/c4k0;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/c4k0;->c(Lcom/p1/mobile/putong/data/OMSAction;)Z

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->j:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/uk50;->d(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/uk50;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 69
    iput-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 70
    .line 71
    return-void
.end method

.method public abstract c(Lcom/p1/mobile/putong/data/OMSAction;)Z
.end method

.method public abstract d()Ljava/lang/String;
.end method

.method public e(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ll/c4k0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    return-object p0
.end method
