.class public final synthetic Ll/kti0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljavax/microedition/khronos/egl/EGLContext;

.field public final synthetic b:Landroid/os/Handler;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljavax/microedition/khronos/egl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kti0;->a:Ljavax/microedition/khronos/egl/EGLContext;

    iput-object p2, p0, Ll/kti0;->b:Landroid/os/Handler;

    iput p3, p0, Ll/kti0;->c:I

    iput p4, p0, Ll/kti0;->d:I

    iput-object p5, p0, Ll/kti0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kti0;->a:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v1, p0, Ll/kti0;->b:Landroid/os/Handler;

    iget v2, p0, Ll/kti0;->c:I

    iget v3, p0, Ll/kti0;->d:I

    iget-object p0, p0, Ll/kti0;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->e(Ljavax/microedition/khronos/egl/EGLContext;Landroid/os/Handler;IILjava/lang/String;)Lcom/ss/bytertc/engine/utils/TextureHelper;

    move-result-object p0

    return-object p0
.end method
