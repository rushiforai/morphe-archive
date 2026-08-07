.class public final synthetic Lcom/ss/bytertc/base/media/camera/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/l;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/l;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->e(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    return-void
.end method
