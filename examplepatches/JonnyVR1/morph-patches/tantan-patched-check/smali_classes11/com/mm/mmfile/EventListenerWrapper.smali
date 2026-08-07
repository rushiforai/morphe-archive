.class public Lcom/mm/mmfile/EventListenerWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/core/IMMFileEventListener;


# static fields
.field private static final EVENT_INNER_FILE_FULL:I = 0x2710


# instance fields
.field private eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

.field private final writeConfig:Lcom/mm/mmfile/core/FileWriteConfig;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/core/IMMFileEventListener;Lcom/mm/mmfile/core/FileWriteConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/mm/mmfile/EventListenerWrapper;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/mm/mmfile/EventListenerWrapper;->writeConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .locals 6

    .line 1
    const/16 v0, 0x2710

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/mm/mmfile/MMFileUploader;->get()Lcom/mm/mmfile/MMFileUploader;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p2}, Lcom/mm/mmfile/MMFileUploader;->forceUploadMMFile(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/mm/mmfile/EventListenerWrapper;->writeConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/mm/mmfile/core/FileWriteConfig;->getMaxFileCounts()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-lez v3, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/mm/mmfile/EventListenerWrapper;->writeConfig:Lcom/mm/mmfile/core/FileWriteConfig;

    .line 23
    .line 24
    sget-object v1, Lcom/mm/mmfile/SortType;->FLASHBACK:Lcom/mm/mmfile/SortType;

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v2, -0x1

    .line 29
    invoke-static/range {v0 .. v5}, Lcom/mm/mmfile/MMFileUtil;->getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;IIZZ)[Ljava/io/File;

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 p1, 0x6

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/mm/mmfile/EventListenerWrapper;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-interface {p0, p1, p2}, Lcom/mm/mmfile/core/IMMFileEventListener;->onEvent(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method
