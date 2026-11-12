.class public final Lcom/samsung/android/app/galaxyraw/mod/PpImmediate;
.super Ljava/lang/Object;
.source "PpImmediate.java"


# static fields
.field public static volatile quiet:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static processNow(Lcom/samsung/android/app/galaxyraw/core2/processor/request/ProcessRequestImpl;)Z
    .registers 4

    .line 23
    nop

    .line 24
    const/4 v0, 0x0

    if-eqz p0, :cond_18

    .line 25
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/core2/processor/request/ProcessRequestImpl;->getDsCondition()I

    move-result p0

    .line 26
    ushr-int/lit8 v1, p0, 0x10

    .line 27
    const/16 v2, 0xaa

    if-eq v1, v2, :cond_12

    const/16 v2, 0xb0

    if-ne v1, v2, :cond_18

    :cond_12
    and-int/lit16 p0, p0, 0xff

    const/4 v1, 0x1

    if-ne p0, v1, :cond_18

    move v0, v1

    .line 29
    :cond_18
    sget-boolean p0, Lcom/samsung/android/app/galaxyraw/mod/PpImmediate;->quiet:Z

    if-eq v0, p0, :cond_34

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "immediate single-frame processing: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "GrawMod"

    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :cond_34
    sput-boolean v0, Lcom/samsung/android/app/galaxyraw/mod/PpImmediate;->quiet:Z

    .line 31
    return v0
.end method

.method public static suppressNotification(Ljava/lang/Enum;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)Z"
        }
    .end annotation

    .line 36
    sget-boolean v0, Lcom/samsung/android/app/galaxyraw/mod/PpImmediate;->quiet:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    if-nez p0, :cond_8

    goto :goto_1e

    .line 37
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    .line 38
    const-string v0, "START_FOREGROUND"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "SET_PROGRESS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    :cond_1c
    const/4 v1, 0x1

    :cond_1d
    return v1

    .line 36
    :cond_1e
    :goto_1e
    return v1
.end method
