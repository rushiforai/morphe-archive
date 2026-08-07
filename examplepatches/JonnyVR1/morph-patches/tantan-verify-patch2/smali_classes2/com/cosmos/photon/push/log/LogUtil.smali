.class public Lcom/cosmos/photon/push/log/LogUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final STATISTIC_COMMON_HEADER:Ljava/lang/String; = "common"

.field public static final STATISTIC_LOG:Ljava/lang/String; = "mmpush_sdk"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static getFilePrefix(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "mdlog_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/cosmos/photon/push/log/LogUtil;->getProcessSuffix(Landroid/content/Context;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static getProcessSuffix(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/qk90;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "main"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string p0, ":"

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-lez v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    add-int/lit8 p0, p0, 0x1

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    const-string p0, ""

    .line 46
    .line 47
    return-object p0
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p0}, Lcom/cosmos/photon/push/log/LogUtil;->getFilePrefix(Landroid/content/Context;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {v1, v2, v0, p1, p0}, Lcom/cosmos/mdlog/XLogImpl;->open(ZILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-wide/32 p0, 0x100000

    .line 25
    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/XLogImpl;->appenderSetMaxFileSize(J)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Lcom/cosmos/mdlog/XLogImpl;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/cosmos/mdlog/XLogImpl;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setLogImp(Lcom/cosmos/mdlog/MDLog$LogImp;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static setLogOpen(Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/cosmos/mdlog/MDLog;->setConsoleLogOpen(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x7

    .line 9
    :goto_0
    invoke-static {v0}, Lcom/cosmos/mdlog/MDLog;->setLevel(I)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {v0}, Lcom/cosmos/mdlog/MDLog;->setOpenStackInfo(Z)V

    .line 14
    .line 15
    .line 16
    sput-boolean p0, Lcom/cosmos/photon/push/thirdparty/PushLogger;->DEBUG:Z

    .line 17
    .line 18
    return-void
.end method
