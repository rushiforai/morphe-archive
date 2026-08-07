.class public Lcom/tencent/could/aicamare/CameraHolder$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/aicamare/CameraHolder;->createHandlerThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/aicamare/CameraHolder;


# direct methods
.method public constructor <init>(Lcom/tencent/could/aicamare/CameraHolder;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :pswitch_0
    :try_start_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/util/Map;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doEventChangeCameraParameter(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p1

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "doEventChangeCameraParameter error "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$700(Lcom/tencent/could/aicamare/CameraHolder;)Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v0, "CameraHolder"

    .line 45
    .line 46
    invoke-static {v0, p1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :pswitch_1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 51
    .line 52
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$600(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_2
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$500(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_3
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 63
    .line 64
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$200(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :pswitch_4
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 69
    .line 70
    if-ne p1, v2, :cond_0

    .line 71
    .line 72
    move v1, v2

    .line 73
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 74
    .line 75
    invoke-static {p0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->access$400(Lcom/tencent/could/aicamare/CameraHolder;Z)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_5
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 80
    .line 81
    if-ne p1, v2, :cond_1

    .line 82
    .line 83
    move v1, v2

    .line 84
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 85
    .line 86
    invoke-static {p0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->access$300(Lcom/tencent/could/aicamare/CameraHolder;Z)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :pswitch_6
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$100(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_7
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder$a;->a:Lcom/tencent/could/aicamare/CameraHolder;

    .line 97
    .line 98
    invoke-static {p0}, Lcom/tencent/could/aicamare/CameraHolder;->access$000(Lcom/tencent/could/aicamare/CameraHolder;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    nop

    .line 103
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
