.class Lcom/idv/identity/platform/SystemLoadingActivity$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kpq0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/SystemLoadingActivity;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/idv/identity/platform/SystemLoadingActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/SystemLoadingActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->b:Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->a:J

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
    .locals 14

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
    iget-wide v3, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->a:J

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
    move-result-object v13

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
    const-string v11, "onError"

    .line 43
    .line 44
    const-string v12, "timeCost"

    .line 45
    .line 46
    const-string v2, "action"

    .line 47
    .line 48
    const-string v3, "initDeviceCost"

    .line 49
    .line 50
    const-string v4, "status"

    .line 51
    .line 52
    const-string v5, "fail"

    .line 53
    .line 54
    const-string v6, "errorCode"

    .line 55
    .line 56
    const-string v8, "errorMsg"

    .line 57
    .line 58
    const-string v10, "tag"

    .line 59
    .line 60
    move-object v7, p1

    .line 61
    move-object/from16 v9, p2

    .line 62
    .line 63
    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "START_INIT_REQUEST"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->b:Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->P0(Lcom/idv/identity/platform/SystemLoadingActivity;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public b(Ljava/lang/String;Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->a:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    long-to-double v0, v0

    .line 14
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v0, v2

    .line 20
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, "s"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 41
    .line 42
    const-string v5, "extProtocol"

    .line 43
    .line 44
    const-string v7, "timeCost"

    .line 45
    .line 46
    const-string v1, "action"

    .line 47
    .line 48
    const-string v2, "initDeviceCost"

    .line 49
    .line 50
    const-string v3, "status"

    .line 51
    .line 52
    const-string v4, "success"

    .line 53
    .line 54
    move-object v6, p4

    .line 55
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    const-string v1, "START_INIT_REQUEST"

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1, p4}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/idv/identity/platform/SystemLoadingActivity$b;->b:Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-static {p0, p2, p3, v6, p1}, Lcom/idv/identity/platform/SystemLoadingActivity;->O0(Lcom/idv/identity/platform/SystemLoadingActivity;Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
