.class Ll/voq$o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->m2(Lcom/momo/mcamera/mask/MaskModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq$o;->a:Ll/voq;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq$o;->a:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/voq$o;->a:Ll/voq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/voq$o;->a:Ll/voq;

    .line 22
    .line 23
    invoke-static {p0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-interface {p0, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->setCartoonFaceEnable(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
