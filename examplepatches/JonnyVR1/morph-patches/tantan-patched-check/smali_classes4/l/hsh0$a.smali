.class Ll/hsh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hsh0;->m0()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ll/hsh0;


# direct methods
.method public constructor <init>(Ll/hsh0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hsh0$a;->b:Ll/hsh0;

    .line 2
    .line 3
    iput p2, p0, Ll/hsh0$a;->a:I

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hsh0$a;->b:Ll/hsh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hsh0;->D0(Ll/hsh0;)Lcom/ss/android/ttvecamera/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/hsh0$a;->b:Ll/hsh0;

    .line 8
    .line 9
    invoke-static {v1}, Ll/hsh0;->B0(Ll/hsh0;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 14
    .line 15
    iget v2, p0, Ll/hsh0$a;->a:I

    .line 16
    .line 17
    iget-object p0, p0, Ll/hsh0$a;->b:Ll/hsh0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/hsh0;->C0(Ll/hsh0;)Landroid/hardware/camera2/CameraDevice;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v3, "updateCapture : something wrong."

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v3, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
