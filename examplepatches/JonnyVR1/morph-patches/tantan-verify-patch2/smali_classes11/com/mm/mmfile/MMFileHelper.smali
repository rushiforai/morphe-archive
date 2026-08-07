.class public Lcom/mm/mmfile/MMFileHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sMMFileWriter:Lcom/mm/mmfile/IMMFileWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/mm/mmfile/MMFileWriterImpl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/mm/mmfile/MMFileWriterImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/mm/mmfile/MMFileHelper;->sMMFileWriter:Lcom/mm/mmfile/IMMFileWriter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static flush(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFile;->flush()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public static forceUploadMMFile()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/mm/mmfile/MMFileUploader;->get()Lcom/mm/mmfile/MMFileUploader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader;->forceUploadMMFile()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static getMMFileInstance(Ljava/lang/String;)Lcom/mm/mmfile/IMMFile;
    .locals 0
    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static varargs install([Lcom/mm/mmfile/Strategy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->install([Lcom/mm/mmfile/Strategy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static isBindStrategy(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->isRegistered(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static openNewLogFile(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->get(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFile;->openNewLogFile()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public static pauseWrite(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->setAllPauseWrite(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setLibraryLoader(Lcom/mm/mmfile/LibraryLoader;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFile;->setLibraryLoader(Lcom/mm/mmfile/LibraryLoader;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static varargs setPauseUploadTaskWhenExitApp(Landroid/content/Context;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/mm/mmfile/UploaderHelper;->setPauseUploadTaskWhenExitApp(Landroid/content/Context;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setUploadClockTimeSeconds(Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/mm/mmfile/MMFileUploader;->get()Lcom/mm/mmfile/MMFileUploader;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0, p1, p2}, Lcom/mm/mmfile/MMFileUploader;->setUploadClockTimeSeconds(Lcom/mm/mmfile/FileUploadConfig;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static updateCommonInfo(Lcom/mm/mmfile/Strategy;Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, p1}, Lcom/mm/mmfile/MMFile;->updateCommonInfoInner(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/core/MMLogInfo;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static write(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFileHelper;->sMMFileWriter:Lcom/mm/mmfile/IMMFileWriter;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lcom/mm/mmfile/IMMFileWriter;->write(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static varargs write(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 7
    sget-object v0, Lcom/mm/mmfile/MMFileHelper;->sMMFileWriter:Lcom/mm/mmfile/IMMFileWriter;

    invoke-interface {v0, p0, p1}, Lcom/mm/mmfile/IMMFileWriter;->write(Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method
