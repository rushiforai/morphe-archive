.class public final synthetic Ll/jah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    iput p2, p0, Ll/jah0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    iget p0, p0, Ll/jah0;->b:I

    invoke-static {v0, p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->b(Lcom/bytedance/realx/video/SurfaceTextureHelper;I)V

    return-void
.end method
