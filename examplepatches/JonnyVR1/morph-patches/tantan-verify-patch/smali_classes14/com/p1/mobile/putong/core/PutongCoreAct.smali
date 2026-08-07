.class public Lcom/p1/mobile/putong/core/PutongCoreAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/ux0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X1()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public getActionBarHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/PutongCoreAct;->X1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x42300000    # 44.0f

    .line 8
    .line 9
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getActionBarHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getAppTheme()Ll/ux0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/PutongCoreAct;->c:Ll/ux0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->vl(Lcom/p1/mobile/putong/core/PutongCoreAct;)Ll/ux0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/PutongCoreAct;->c:Ll/ux0;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/PutongCoreAct;->c:Ll/ux0;

    .line 20
    .line 21
    return-object p0
.end method
