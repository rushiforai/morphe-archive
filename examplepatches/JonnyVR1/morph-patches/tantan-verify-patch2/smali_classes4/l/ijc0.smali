.class public final synthetic Ll/ijc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;

.field public final synthetic b:Landroid/graphics/SurfaceTexture;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;Landroid/graphics/SurfaceTexture;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ijc0;->a:Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;

    iput-object p2, p0, Ll/ijc0;->b:Landroid/graphics/SurfaceTexture;

    iput-wide p3, p0, Ll/ijc0;->c:J

    iput-object p5, p0, Ll/ijc0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ijc0;->a:Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;

    iget-object v1, p0, Ll/ijc0;->b:Landroid/graphics/SurfaceTexture;

    iget-wide v2, p0, Ll/ijc0;->c:J

    iget-object p0, p0, Ll/ijc0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->a(Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;Landroid/graphics/SurfaceTexture;JLjava/lang/String;)V

    return-void
.end method
