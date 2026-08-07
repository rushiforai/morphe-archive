.class Lcom/ss/android/ttvecamera/a$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$OnZoomChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/a;->w0(FLcom/ss/android/ttvecamera/TECameraSettings$p;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TECameraSettings$p;

.field final synthetic b:Lcom/ss/android/ttvecamera/a;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/a;Lcom/ss/android/ttvecamera/TECameraSettings$p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a$f;->b:Lcom/ss/android/ttvecamera/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/a$f;->a:Lcom/ss/android/ttvecamera/TECameraSettings$p;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onZoomChange(IZLandroid/hardware/Camera;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a$f;->a:Lcom/ss/android/ttvecamera/TECameraSettings$p;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    int-to-float p1, p1

    .line 7
    invoke-interface {p0, p3, p1, p2}, Lcom/ss/android/ttvecamera/TECameraSettings$p;->onChange(IFZ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
