.class public final synthetic Ll/jse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/EglRenderer;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglRenderer;FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iput p2, p0, Ll/jse;->b:F

    iput p3, p0, Ll/jse;->c:F

    iput p4, p0, Ll/jse;->d:F

    iput p5, p0, Ll/jse;->e:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iget v1, p0, Ll/jse;->b:F

    iget v2, p0, Ll/jse;->c:F

    iget v3, p0, Ll/jse;->d:F

    iget p0, p0, Ll/jse;->e:F

    invoke-static {v0, v1, v2, v3, p0}, Lcom/bytedance/realx/video/EglRenderer;->c(Lcom/bytedance/realx/video/EglRenderer;FFFF)V

    return-void
.end method
