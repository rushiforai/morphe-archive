.class Lcom/ss/android/ttvecamera/TECameraServer$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->destroy()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$k;->a:Lcom/ss/android/ttvecamera/TECameraServer;

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
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$k;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer;->mProviderManager:Ll/jrh0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jrh0;->k()V

    .line 6
    .line 7
    .line 8
    const-string p0, "TECameraServer"

    .line 9
    .line 10
    const-string v0, "provider release..."

    .line 11
    .line 12
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
