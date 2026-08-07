.class Lcom/ss/android/ttvecamera/TECameraServer$y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->start(Lcom/ss/android/ttvecamera/d;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->start(Lcom/ss/android/ttvecamera/d;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$y0;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$900(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/ConditionVariable;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/os/ConditionVariable;->open()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
