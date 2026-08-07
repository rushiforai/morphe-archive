.class public final synthetic Lcom/momo/xeengine/lightningrender/a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:[B

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;[BII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/a0;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/a0;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/momo/xeengine/lightningrender/a0;->c:[B

    iput p4, p0, Lcom/momo/xeengine/lightningrender/a0;->d:I

    iput p5, p0, Lcom/momo/xeengine/lightningrender/a0;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/a0;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/a0;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/momo/xeengine/lightningrender/a0;->c:[B

    iget v3, p0, Lcom/momo/xeengine/lightningrender/a0;->d:I

    iget p0, p0, Lcom/momo/xeengine/lightningrender/a0;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;[BII)V

    return-void
.end method
