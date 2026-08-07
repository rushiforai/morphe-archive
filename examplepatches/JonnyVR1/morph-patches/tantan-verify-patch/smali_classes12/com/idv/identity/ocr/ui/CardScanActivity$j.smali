.class Lcom/idv/identity/ocr/ui/CardScanActivity$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hki$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->q2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 14

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    const-string v10, "fileName"

    .line 22
    .line 23
    const-string v12, "errMsg"

    .line 24
    .line 25
    const-string v2, "status"

    .line 26
    .line 27
    const-string v3, "error"

    .line 28
    .line 29
    const-string v4, "idx"

    .line 30
    .line 31
    const-string v6, "ocrType"

    .line 32
    .line 33
    const-string v8, "bucketName"

    .line 34
    .line 35
    move-object/from16 v9, p2

    .line 36
    .line 37
    move-object/from16 v11, p3

    .line 38
    .line 39
    move-object/from16 v13, p4

    .line 40
    .line 41
    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "cardOssUploadRes"

    .line 46
    .line 47
    invoke-virtual {v0, v1, p1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 14

    .line 1
    move-object/from16 v9, p3

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->a:J

    .line 13
    .line 14
    sub-long/2addr v1, v3

    .line 15
    long-to-double v1, v1

    .line 16
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v1, v3

    .line 22
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "s"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v11

    .line 38
    const/4 v0, 0x1

    .line 39
    if-ne v0, p1, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v9}, Ll/afm;->C1(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v1, 0x5

    .line 50
    if-ne v1, p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, v9, v0}, Ll/afm;->G1(Ljava/lang/String;Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 v0, 0x2

    .line 61
    if-ne v0, p1, :cond_2

    .line 62
    .line 63
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, v9}, Ll/afm;->u1(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/16 v0, 0x14

    .line 72
    .line 73
    if-ne v0, p1, :cond_3

    .line 74
    .line 75
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v9}, Ll/afm;->v1(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    const/16 v0, 0xa

    .line 84
    .line 85
    if-ne v0, p1, :cond_4

    .line 86
    .line 87
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v9}, Ll/afm;->D1(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_4
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 95
    .line 96
    .line 97
    move-result-object v12

    .line 98
    sget-object v13, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 99
    .line 100
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    const-string v8, "fileName"

    .line 115
    .line 116
    const-string v10, "timeCost"

    .line 117
    .line 118
    const-string v0, "status"

    .line 119
    .line 120
    const-string v1, "success"

    .line 121
    .line 122
    const-string v2, "idx"

    .line 123
    .line 124
    const-string v4, "ocrType"

    .line 125
    .line 126
    const-string v6, "bucketName"

    .line 127
    .line 128
    move-object/from16 v7, p2

    .line 129
    .line 130
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string p1, "cardOssUploadRes"

    .line 135
    .line 136
    invoke-virtual {v12, v13, p1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const/4 p0, 0x0

    .line 140
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
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->a:J

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$j;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 70
    .line 71
    if-ne p1, p2, :cond_0

    .line 72
    .line 73
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 74
    .line 75
    const/16 p1, 0x3f1

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 82
    .line 83
    const/16 p1, 0x3f0

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 86
    .line 87
    .line 88
    return-void
.end method
