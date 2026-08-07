.class Lcom/ss/android/ttvecamera/TECameraServer$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->focusAtPoint(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TEFocusSettings;

.field final synthetic c:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->focusAtPoint(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$h;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 34
    .line 35
    const-string v2, ""

    .line 36
    .line 37
    invoke-interface {v1, v0, p0, v2}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
