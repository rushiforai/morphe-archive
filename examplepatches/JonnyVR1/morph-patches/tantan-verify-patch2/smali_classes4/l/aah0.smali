.class public final synthetic Ll/aah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

.field public final synthetic b:Landroid/view/SurfaceView;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;Landroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aah0;->a:Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    iput-object p2, p0, Ll/aah0;->b:Landroid/view/SurfaceView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aah0;->a:Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;

    iget-object p0, p0, Ll/aah0;->b:Landroid/view/SurfaceView;

    invoke-static {v0, p0}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->i(Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;Landroid/view/SurfaceView;)V

    return-void
.end method
