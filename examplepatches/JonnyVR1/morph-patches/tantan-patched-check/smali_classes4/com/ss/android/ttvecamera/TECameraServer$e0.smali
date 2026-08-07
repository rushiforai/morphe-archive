.class Lcom/ss/android/ttvecamera/TECameraServer$e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->getISO(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraSettings$g;

.field final synthetic c:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->b:Lcom/ss/android/ttvecamera/TECameraSettings$g;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->b:Lcom/ss/android/ttvecamera/TECameraSettings$g;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->getISO(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$g;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$e0;->b:Lcom/ss/android/ttvecamera/TECameraSettings$g;

    .line 14
    .line 15
    invoke-interface {p0, v0}, Lcom/ss/android/ttvecamera/TECameraSettings$g;->a(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
