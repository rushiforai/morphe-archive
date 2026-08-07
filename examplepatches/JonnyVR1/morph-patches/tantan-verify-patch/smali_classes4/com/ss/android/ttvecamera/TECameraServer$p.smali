.class Lcom/ss/android/ttvecamera/TECameraServer$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->queryZoomAbility(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraSettings$p;

.field final synthetic c:Z

.field final synthetic d:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->b:Lcom/ss/android/ttvecamera/TECameraSettings$p;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->b:Lcom/ss/android/ttvecamera/TECameraSettings$p;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$p;->c:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->queryZoomAbility(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I

    .line 10
    .line 11
    .line 12
    return-void
.end method
