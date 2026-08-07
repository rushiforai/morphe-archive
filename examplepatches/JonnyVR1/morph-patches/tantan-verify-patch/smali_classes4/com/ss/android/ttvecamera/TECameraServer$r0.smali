.class Lcom/ss/android/ttvecamera/TECameraServer$r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->switchCameraMode(Lcom/ss/android/ttvecamera/d;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:I

.field final synthetic c:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->b:I

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$r0;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->switchCameraMode(Lcom/ss/android/ttvecamera/d;I)I

    .line 8
    .line 9
    .line 10
    return-void
.end method
