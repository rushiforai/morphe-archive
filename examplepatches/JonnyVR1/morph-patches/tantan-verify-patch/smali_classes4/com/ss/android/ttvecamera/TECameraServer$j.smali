.class Lcom/ss/android/ttvecamera/TECameraServer$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->enableCaf(Lcom/ss/android/ttvecamera/d;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/d;

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$j;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$j;->a:Lcom/ss/android/ttvecamera/d;

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
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$j;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$j;->a:Lcom/ss/android/ttvecamera/d;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/ss/android/ttvecamera/TECameraServer;->enableCaf(Lcom/ss/android/ttvecamera/d;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method
