.class public final synthetic Ll/z1e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field public final synthetic a:Ll/a2e0;


# direct methods
.method public synthetic constructor <init>(Ll/a2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1e0;->a:Ll/a2e0;

    return-void
.end method


# virtual methods
.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1e0;->a:Ll/a2e0;

    invoke-static {p0, p1}, Ll/a2e0;->b(Ll/a2e0;Landroid/graphics/SurfaceTexture;)V

    return-void
.end method
