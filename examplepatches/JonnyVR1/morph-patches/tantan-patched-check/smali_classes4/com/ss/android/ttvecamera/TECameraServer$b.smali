.class Lcom/ss/android/ttvecamera/TECameraServer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->switchCamera(Lcom/ss/android/ttvecamera/d;ILcom/bytedance/bpea/basics/Cert;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:I

.field final synthetic c:Lcom/bytedance/bpea/basics/Cert;

.field final synthetic d:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;ILcom/bytedance/bpea/basics/Cert;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->c:Lcom/bytedance/bpea/basics/Cert;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->d:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->b:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$b;->c:Lcom/bytedance/bpea/basics/Cert;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->switchCamera(Lcom/ss/android/ttvecamera/d;ILcom/bytedance/bpea/basics/Cert;)I

    .line 10
    .line 11
    .line 12
    return-void
.end method
