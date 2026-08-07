.class Lcom/ss/android/ttvecamera/TECameraServer$t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->changeRecorderState(Lcom/ss/android/ttvecamera/d;ILcom/ss/android/ttvecamera/c$c;)I
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
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;ILcom/ss/android/ttvecamera/c$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->b:I

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$t0;->b:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, p0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->changeRecorderState(Lcom/ss/android/ttvecamera/d;ILcom/ss/android/ttvecamera/c$c;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method
