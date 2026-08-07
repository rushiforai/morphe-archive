.class Lcom/ss/android/ttvecamera/TECameraServer$n0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer$n0;->b(IILjava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TECameraServer$n0;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer$n0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0$b;->a:Lcom/ss/android/ttvecamera/TECameraServer$n0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0$b;->a:Lcom/ss/android/ttvecamera/TECameraServer$n0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2100(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->start(Lcom/ss/android/ttvecamera/d;)I

    .line 10
    .line 11
    .line 12
    return-void
.end method
