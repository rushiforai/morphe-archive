.class public Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AngleDetectConfig"
.end annotation


# instance fields
.field public secondaryPitchThreshold:F

.field public secondaryRollThreshold:F

.field public secondaryYawThreshold:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41f00000    # 30.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryYawThreshold:F

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryRollThreshold:F

    .line 9
    .line 10
    const/high16 v0, 0x42200000    # 40.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryPitchThreshold:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getSecondaryPitchThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryPitchThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getSecondaryRollThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryRollThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public getSecondaryYawThreshold()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryYawThreshold:F

    .line 2
    .line 3
    return p0
.end method

.method public setSecondaryPitchThreshold(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryPitchThreshold:F

    .line 2
    .line 3
    return-void
.end method

.method public setSecondaryRollThreshold(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryRollThreshold:F

    .line 2
    .line 3
    return-void
.end method

.method public setSecondaryYawThreshold(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryYawThreshold:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AngleDetectConfig{secondaryYawThreshold="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryYawThreshold:F

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", secondaryRollThreshold="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryRollThreshold:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", secondaryPitchThreshold="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/tencent/could/huiyansdk/entity/UpdateYtConfig$AngleDetectConfig;->secondaryPitchThreshold:F

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x7d

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
