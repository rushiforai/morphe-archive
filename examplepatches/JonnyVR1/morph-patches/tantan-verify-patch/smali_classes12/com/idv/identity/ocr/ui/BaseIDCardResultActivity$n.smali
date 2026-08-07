.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kfm;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s1(Ljava/util/Map;Z[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->a:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    long-to-double v1, v1

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v1, v3

    .line 20
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "s"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v11

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v9, "onError"

    .line 43
    .line 44
    const-string v10, "timeCost"

    .line 45
    .line 46
    const-string v2, "status"

    .line 47
    .line 48
    const-string v3, "error"

    .line 49
    .line 50
    const-string v4, "code"

    .line 51
    .line 52
    const-string v6, "msg"

    .line 53
    .line 54
    const-string v8, "tag"

    .line 55
    .line 56
    move-object v5, p1

    .line 57
    move-object v7, p2

    .line 58
    filled-new-array/range {v2 .. v11}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "ocrDeviceResultCost"

    .line 63
    .line 64
    invoke-virtual {v0, v1, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->T0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->y:Landroid/os/Handler;

    .line 75
    .line 76
    const/16 p1, 0x3ea

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->a:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    long-to-double v1, v1

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v1, v3

    .line 20
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "s"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v4, "param"

    .line 43
    .line 44
    const-string v6, "timeCost"

    .line 45
    .line 46
    const-string v2, "status"

    .line 47
    .line 48
    const-string v3, "success"

    .line 49
    .line 50
    move-object v5, p2

    .line 51
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string v2, "ocrDeviceResultCost"

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->T0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 66
    .line 67
    new-instance v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;

    .line 68
    .line 69
    invoke-direct {v0, p0, p1, v5}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n$a;-><init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$n;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
