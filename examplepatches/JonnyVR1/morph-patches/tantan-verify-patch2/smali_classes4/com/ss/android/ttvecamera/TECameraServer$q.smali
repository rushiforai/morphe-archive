.class Lcom/ss/android/ttvecamera/TECameraServer$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->queryShaderZoomStep(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$n;)F
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$q;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$q;->a:Lcom/ss/android/ttvecamera/d;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$q;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$q;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->queryShaderZoomStep(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$n;)F

    .line 7
    .line 8
    .line 9
    return-void
.end method
