.class public final Lcom/momo/xeengine/XELogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/XELogger$Printer;,
        Lcom/momo/xeengine/XELogger$ErrorPrinter;
    }
.end annotation


# static fields
.field public static final ENGINE_TAG:Ljava/lang/String; = "[XENGINE]"

.field private static errorPrinter:Lcom/momo/xeengine/XELogger$ErrorPrinter;


# instance fields
.field private enable:Z

.field private pointer:J


# direct methods
.method public constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/XELogger;->enable:Z

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/momo/xeengine/XELogger;->pointer:J

    .line 8
    .line 9
    return-void
.end method

.method private static varargs appendStr([Ljava/lang/Object;)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "null "

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    array-length v1, p0

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v1, :cond_2

    .line 21
    .line 22
    aget-object v3, p0, v2

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    const-string v3, "null"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v3, " "

    .line 37
    .line 38
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static varargs debug([Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public static varargs e([Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string v0, "[XENGINE]"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/XELogger;->appendStr([Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private getPointer()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/XELogger;->pointer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private native nativeGetTag(J)Ljava/lang/String;
.end method

.method private native nativeSetLogEnable(JZ)V
.end method

.method private native nativeSetPrintErrorFunc(JLcom/momo/xeengine/XELogger$Printer;)V
.end method

.method private native nativeSetPrintFunc(JLcom/momo/xeengine/XELogger$Printer;)V
.end method

.method private native nativeSetTag(JLjava/lang/String;)V
.end method

.method public static printGlobalError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XELogger;->errorPrinter:Lcom/momo/xeengine/XELogger$ErrorPrinter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Lcom/momo/xeengine/XELogger$ErrorPrinter;->print(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setGlobalErrorPrinter(Lcom/momo/xeengine/XELogger$ErrorPrinter;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xeengine/XELogger;->errorPrinter:Lcom/momo/xeengine/XELogger$ErrorPrinter;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public varargs d([Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/XELogger;->enable:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "[XENGINE]"

    .line 6
    .line 7
    invoke-static {p1}, Lcom/momo/xeengine/XELogger;->appendStr([Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public getTag()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/XELogger;->nativeGetTag(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/momo/xeengine/XELogger;->pointer:J

    .line 4
    .line 5
    return-void
.end method

.method public setErrorPrinter(Lcom/momo/xeengine/XELogger$Printer;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/XELogger;->nativeSetPrintErrorFunc(JLcom/momo/xeengine/XELogger$Printer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setLogEnable(Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-boolean p1, p0, Lcom/momo/xeengine/XELogger;->enable:Z

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/XELogger;->nativeSetLogEnable(JZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setPrintPrinter(Lcom/momo/xeengine/XELogger$Printer;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/XELogger;->nativeSetPrintFunc(JLcom/momo/xeengine/XELogger$Printer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/XELogger;->getPointer()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/XELogger;->nativeSetTag(JLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
