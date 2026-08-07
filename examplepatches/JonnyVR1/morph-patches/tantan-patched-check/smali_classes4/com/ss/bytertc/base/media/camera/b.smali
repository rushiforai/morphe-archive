.class public final synthetic Lcom/ss/bytertc/base/media/camera/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/Camera1Session$3;

.field public final synthetic b:[B


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/b;->a:Lcom/ss/bytertc/base/media/camera/Camera1Session$3;

    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/b;->b:[B

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/b;->a:Lcom/ss/bytertc/base/media/camera/Camera1Session$3;

    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/b;->b:[B

    invoke-static {v0, p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;->a(Lcom/ss/bytertc/base/media/camera/Camera1Session$3;[B)V

    return-void
.end method
