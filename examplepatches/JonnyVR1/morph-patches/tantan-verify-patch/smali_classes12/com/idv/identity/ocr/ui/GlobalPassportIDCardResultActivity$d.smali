.class Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hki$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->e2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:[B

.field final synthetic c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;J[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->b:[B

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 11

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    const-string v7, "fileName"

    .line 12
    .line 13
    const-string v9, "errMsg"

    .line 14
    .line 15
    const-string v1, "status"

    .line 16
    .line 17
    const-string v2, "error"

    .line 18
    .line 19
    const-string v3, "idx"

    .line 20
    .line 21
    const-string v5, "bucketName"

    .line 22
    .line 23
    move-object v6, p2

    .line 24
    move-object v8, p3

    .line 25
    move-object v10, p4

    .line 26
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string p2, "nfcOssUploadRes"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 9

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p3}, Ll/afm;->m1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    const-string v5, "bucketName"

    .line 19
    .line 20
    const-string v7, "fileName"

    .line 21
    .line 22
    const-string v1, "status"

    .line 23
    .line 24
    const-string v2, "success"

    .line 25
    .line 26
    const-string v3, "idx"

    .line 27
    .line 28
    move-object v6, p2

    .line 29
    move-object v8, p3

    .line 30
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "nfcOssUploadRes"

    .line 35
    .line 36
    invoke-virtual {p0, v0, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public c(II)V
    .locals 10

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
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->a:J

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
    move-result-object v9

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
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    const-string v8, "timeCost"

    .line 51
    .line 52
    const-string v2, "status"

    .line 53
    .line 54
    const-string v3, "finish"

    .line 55
    .line 56
    const-string v4, "uploadCnt"

    .line 57
    .line 58
    const-string v6, "successCnt"

    .line 59
    .line 60
    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "cardOssUploadCost"

    .line 65
    .line 66
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 70
    .line 71
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;

    .line 72
    .line 73
    invoke-direct {v1, p0, p1, p2}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;II)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
