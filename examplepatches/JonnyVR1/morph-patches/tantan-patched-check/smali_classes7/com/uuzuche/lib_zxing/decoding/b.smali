.class final Lcom/uuzuche/lib_zxing/decoding/b;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field private final a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

.field private final b:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/os/Handler;

.field private final d:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Vector;Ljava/lang/String;Ll/t5d0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/uuzuche/lib_zxing/activity/CaptureFragment;",
            "Ljava/util/Vector<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;",
            "Ljava/lang/String;",
            "Ll/t5d0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/b;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/b;->d:Ljava/util/concurrent/CountDownLatch;

    .line 13
    .line 14
    new-instance p1, Ljava/util/Hashtable;

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    invoke-direct {p1, v0}, Ljava/util/Hashtable;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/b;->b:Ljava/util/Hashtable;

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/util/Vector;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    :cond_0
    new-instance p2, Ljava/util/Vector;

    .line 31
    .line 32
    invoke-direct {p2}, Ljava/util/Vector;-><init>()V

    .line 33
    .line 34
    .line 35
    sget-object p0, Ll/shd;->c:Ljava/util/Vector;

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    sget-object p0, Ll/shd;->d:Ljava/util/Vector;

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    sget-object p0, Ll/shd;->e:Ljava/util/Vector;

    .line 46
    .line 47
    invoke-virtual {p2, p0}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    sget-object p0, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    .line 51
    .line 52
    invoke-virtual {p1, p0, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    if-eqz p3, :cond_2

    .line 56
    .line 57
    sget-object p0, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    .line 58
    .line 59
    invoke-virtual {p1, p0, p3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    :cond_2
    sget-object p0, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    .line 63
    .line 64
    invoke-virtual {p1, p0, p4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a()Landroid/os/Handler;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/b;->d:Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/b;->c:Landroid/os/Handler;

    .line 7
    .line 8
    return-object p0
.end method

.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/uuzuche/lib_zxing/decoding/a;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/decoding/b;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/decoding/b;->b:Ljava/util/Hashtable;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lcom/uuzuche/lib_zxing/decoding/a;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Hashtable;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/b;->c:Landroid/os/Handler;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/b;->d:Ljava/util/concurrent/CountDownLatch;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
