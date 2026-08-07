.class Lcom/idv/identity/face/ui/ToygerActivity$u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hki$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->z2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$u;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$u;->a:J

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
    const-string v9, "errorMsg"

    .line 14
    .line 15
    const-string v1, "status"

    .line 16
    .line 17
    const-string v2, "fail"

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
    const-string p2, "OSS_UPLOAD_END"

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
    const/4 p0, 0x3

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p3}, Ll/afm;->Y0(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x4

    .line 13
    if-ne p0, p1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p3}, Ll/afm;->J0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x6

    .line 24
    if-ne p0, p1, :cond_2

    .line 25
    .line 26
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p3}, Ll/afm;->S1(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const/4 p0, 0x7

    .line 35
    if-ne p0, p1, :cond_3

    .line 36
    .line 37
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0, p3}, Ll/afm;->M1(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    const/16 p0, 0x8

    .line 46
    .line 47
    if-ne p0, p1, :cond_4

    .line 48
    .line 49
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p3}, Ll/afm;->c1(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    const/16 p0, 0x9

    .line 58
    .line 59
    if-ne p0, p1, :cond_5

    .line 60
    .line 61
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, p3}, Ll/afm;->j1(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_5
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 73
    .line 74
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const-string v5, "bucketName"

    .line 79
    .line 80
    const-string v7, "fileName"

    .line 81
    .line 82
    const-string v1, "status"

    .line 83
    .line 84
    const-string v2, "success"

    .line 85
    .line 86
    const-string v3, "idx"

    .line 87
    .line 88
    move-object v6, p2

    .line 89
    move-object v8, p3

    .line 90
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string p2, "OSS_UPLOAD_END"

    .line 95
    .line 96
    invoke-virtual {p0, v0, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    return p0
.end method

.method public c(II)V
    .locals 10

    .line 1
    const-string v0, "ToygerPresenter"

    .line 2
    .line 3
    const-string v1, " onFinish: oss\u8d44\u6e90\u4e0a\u4f20\u7ed3\u675f"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-wide v3, p0, Lcom/idv/identity/face/ui/ToygerActivity$u;->a:J

    .line 18
    .line 19
    sub-long/2addr v1, v3

    .line 20
    long-to-double v1, v1

    .line 21
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    div-double/2addr v1, v3

    .line 27
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "s"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 44
    .line 45
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string v8, "timeCost"

    .line 54
    .line 55
    const-string v2, "status"

    .line 56
    .line 57
    const-string v3, "finish"

    .line 58
    .line 59
    const-string v4, "uploadCnt"

    .line 60
    .line 61
    const-string v6, "successCnt"

    .line 62
    .line 63
    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p2, "OSS_UPLOAD_END"

    .line 68
    .line 69
    invoke-virtual {v0, v1, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$u;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 73
    .line 74
    const/4 p1, 0x1

    .line 75
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->N0(Lcom/idv/identity/face/ui/ToygerActivity;Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
