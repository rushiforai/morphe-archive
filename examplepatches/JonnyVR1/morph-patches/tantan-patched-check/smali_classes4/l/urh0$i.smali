.class Ll/urh0$i;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/urh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation


# instance fields
.field final synthetic a:Ll/urh0;


# direct methods
.method public constructor <init>(Ll/urh0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "dispatch msg = "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v1, p1, Landroid/os/Message;->what:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "TEImage2Mode"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget v0, p1, Landroid/os/Message;->what:I

    .line 26
    .line 27
    packed-switch v0, :pswitch_data_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_0
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 32
    .line 33
    invoke-static {p0}, Ll/urh0;->A1(Ll/urh0;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_1
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/urh0;->N1()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_2
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 44
    .line 45
    invoke-static {p0}, Ll/urh0;->y1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p0, p1}, Ll/urh0;->z1(Ll/urh0;Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_3
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 54
    .line 55
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Ljava/lang/Exception;

    .line 58
    .line 59
    const/16 v0, -0x3e8

    .line 60
    .line 61
    invoke-static {p0, p1, v0}, Ll/urh0;->u1(Ll/urh0;Ljava/lang/Exception;I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_4
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 66
    .line 67
    invoke-static {p0}, Ll/urh0;->x1(Ll/urh0;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_5
    iget-object p0, p0, Ll/urh0$i;->a:Ll/urh0;

    .line 72
    .line 73
    invoke-static {p0}, Ll/urh0;->w1(Ll/urh0;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
