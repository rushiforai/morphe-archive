.class final Lcom/uuzuche/lib_zxing/decoding/a;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field private final a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

.field private final b:Ll/bs10;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Hashtable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/uuzuche/lib_zxing/activity/CaptureFragment;",
            "Ljava/util/Hashtable<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bs10;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bs10;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/a;->b:Ll/bs10;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ll/bs10;->d(Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/a;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 15
    .line 16
    return-void
.end method

.method private a([BII)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, p3, :cond_1

    .line 10
    .line 11
    move v3, v1

    .line 12
    :goto_1
    if-ge v3, p2, :cond_0

    .line 13
    .line 14
    mul-int v4, v3, p3

    .line 15
    .line 16
    add-int/2addr v4, p3

    .line 17
    sub-int/2addr v4, v2

    .line 18
    add-int/lit8 v4, v4, -0x1

    .line 19
    .line 20
    mul-int v5, v2, p2

    .line 21
    .line 22
    add-int/2addr v5, v3

    .line 23
    aget-byte v5, p1, v5

    .line 24
    .line 25
    aput-byte v5, v0, v4

    .line 26
    .line 27
    add-int/lit8 v3, v3, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v0, p3, p2}, Ll/x94;->a([BII)Ll/vc80;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p2, Ll/cy2;

    .line 42
    .line 43
    new-instance p3, Ll/jol;

    .line 44
    .line 45
    invoke-direct {p3, p1}, Ll/jol;-><init>(Ll/uhw;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p2, p3}, Ll/cy2;-><init>(Ll/by2;)V

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object p3, p0, Lcom/uuzuche/lib_zxing/decoding/a;->b:Ll/bs10;

    .line 52
    .line 53
    invoke-virtual {p3, p2}, Ll/bs10;->c(Ll/cy2;)Ll/r5d0;

    .line 54
    .line 55
    .line 56
    move-result-object p2
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    iget-object p3, p0, Lcom/uuzuche/lib_zxing/decoding/a;->b:Ll/bs10;

    .line 58
    .line 59
    invoke-virtual {p3}, Ll/bs10;->reset()V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/a;->b:Ll/bs10;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/bs10;->reset()V

    .line 67
    .line 68
    .line 69
    throw p1

    .line 70
    :catch_0
    iget-object p2, p0, Lcom/uuzuche/lib_zxing/decoding/a;->b:Ll/bs10;

    .line 71
    .line 72
    invoke-virtual {p2}, Ll/bs10;->reset()V

    .line 73
    .line 74
    .line 75
    const/4 p2, 0x0

    .line 76
    :goto_2
    if-eqz p2, :cond_2

    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Ll/r5d0;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/a;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->W3()Landroid/os/Handler;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget p3, Ll/pdc0;->d:I

    .line 91
    .line 92
    invoke-static {p0, p3, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    new-instance p2, Landroid/os/Bundle;

    .line 97
    .line 98
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string p3, "barcode_bitmap"

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/vc80;->g()Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p2, p3, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_2
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/a;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->W3()Landroid/os/Handler;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    sget p1, Ll/pdc0;->c:I

    .line 124
    .line 125
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 130
    .line 131
    .line 132
    :goto_3
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    sget v1, Ll/pdc0;->b:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, [B

    .line 10
    .line 11
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 12
    .line 13
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, p1}, Lcom/uuzuche/lib_zxing/decoding/a;->a([BII)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget p0, Ll/pdc0;->h:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
