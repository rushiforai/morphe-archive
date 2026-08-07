.class Lcom/ss/android/ttvecamera/TECameraServer$o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->setSceneMode(Lcom/ss/android/ttvecamera/d;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$o;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$o;->a:I

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$o;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$o;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$o;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/c;->r0(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
