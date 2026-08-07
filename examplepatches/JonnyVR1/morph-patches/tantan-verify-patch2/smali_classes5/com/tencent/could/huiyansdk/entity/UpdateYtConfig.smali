.class public Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;
    }
.end annotation


# instance fields
.field public angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;->angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getAngleDetectConfig()Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;->angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAngleDetectConfig(Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;->angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;->angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "UpdateYtConfig{angleDetectConfig="

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;->angleDetectConfig:Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x7d

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
