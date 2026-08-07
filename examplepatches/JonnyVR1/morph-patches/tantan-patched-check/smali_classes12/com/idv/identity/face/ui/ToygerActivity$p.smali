.class Lcom/idv/identity/face/ui/ToygerActivity$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfm;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity;->X1(Z)V
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
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;Ljava/lang/String;)V
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
    iget-wide v3, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->a:J

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
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "s"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v11

    .line 32
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 37
    .line 38
    const-string v9, "onServerError"

    .line 39
    .line 40
    const-string v10, "timeCost"

    .line 41
    .line 42
    const-string v2, "status"

    .line 43
    .line 44
    const-string v3, "error"

    .line 45
    .line 46
    const-string v4, "code"

    .line 47
    .line 48
    const-string v6, "message"

    .line 49
    .line 50
    const-string v8, "tag"

    .line 51
    .line 52
    move-object v5, p1

    .line 53
    move-object v7, p2

    .line 54
    filled-new-array/range {v2 .. v11}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "verifyDeviceCost"

    .line 59
    .line 60
    invoke-virtual {v0, v1, p2, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    if-eqz v5, :cond_0

    .line 64
    .line 65
    sget-object p1, Ll/dfm;->s:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v5, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 74
    .line 75
    invoke-static {p0, v5}, Lcom/idv/identity/face/ui/ToygerActivity;->S0(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 80
    .line 81
    sget-object p1, Ll/dfm;->t:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->S0(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onSuccess()V
    .locals 6

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
    iget-wide v3, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->a:J

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
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "s"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 37
    .line 38
    const-string v3, "success"

    .line 39
    .line 40
    const-string v4, "timeCost"

    .line 41
    .line 42
    const-string v5, "status"

    .line 43
    .line 44
    filled-new-array {v5, v3, v4, v0}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v3, "verifyDeviceCost"

    .line 49
    .line 50
    invoke-virtual {v1, v2, v3, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$p;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 54
    .line 55
    sget-object v0, Ll/dfm;->r:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->S0(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
