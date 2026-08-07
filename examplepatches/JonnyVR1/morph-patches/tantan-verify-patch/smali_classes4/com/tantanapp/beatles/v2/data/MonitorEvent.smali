.class public Lcom/tantanapp/beatles/v2/data/MonitorEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private app:Lcom/tantanapp/beatles/v2/data/App;

.field private transient cacheDir:Ljava/lang/String;

.field private clientTime:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "client_time"
    .end annotation
.end field

.field private transient crashThread:Ljava/lang/Thread;

.field private device:Lcom/tantanapp/beatles/v2/data/Device;

.field private env:Ljava/lang/String;

.field private eventId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "event_id"
    .end annotation
.end field

.field private transient eventProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/k5f;",
            ">;"
        }
    .end annotation
.end field

.field private eventType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "event_type"
    .end annotation
.end field

.field private exceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorException;",
            ">;"
        }
    .end annotation
.end field

.field private extra:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private transient files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private format:Ljava/lang/String;

.field private transient isCache:Z

.field private transient isEmergency:Z

.field private mappingFiles:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mapping_files"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private transient needLogcatProcessor:Z

.field private transient needOtherThread:Z

.field private transient newExceptiontype:Ljava/lang/String;

.field private os:Lcom/tantanapp/beatles/v2/data/OperatingSystem;

.field private platform:Ljava/lang/String;

.field private sdk:Lcom/tantanapp/beatles/v2/data/Sdk;

.field private subEventType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sub_event_type"
    .end annotation
.end field

.field private tags:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private threads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorThread;",
            ">;"
        }
    .end annotation
.end field

.field protected transient throwable:Ljava/lang/Throwable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private transaction:Ljava/lang/String;

.field private user:Lcom/tantanapp/beatles/v2/data/User;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/tantanapp/beatles/v2/data/EventId;

    invoke-direct {v0}, Lcom/tantanapp/beatles/v2/data/EventId;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ll/p8c;->e(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;-><init>(Lcom/tantanapp/beatles/v2/data/EventId;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/beatles/v2/data/EventId;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/tantanapp/beatles/v2/data/EventId;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventProcessors:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/EventId;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventId:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->clientTime:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventType:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->subEventType:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->throwable:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public addFile(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public addFiles(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public addProcessor(Ll/k5f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventProcessors:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addProcessors(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k5f;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventProcessors:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getApp()Lcom/tantanapp/beatles/v2/data/App;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->app:Lcom/tantanapp/beatles/v2/data/App;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCacheDir()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->cacheDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClientTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->clientTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrashThread()Ljava/lang/Thread;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->crashThread:Ljava/lang/Thread;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDevice()Lcom/tantanapp/beatles/v2/data/Device;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->device:Lcom/tantanapp/beatles/v2/data/Device;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEnvironment()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->env:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventProcessors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/k5f;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventProcessors:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExceptions()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorException;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->exceptions:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtra()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->extra:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFiles()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->files:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFormat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->format:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMappingFiles()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->mappingFiles:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNewExceptionType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->newExceptiontype:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOs()Lcom/tantanapp/beatles/v2/data/OperatingSystem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->os:Lcom/tantanapp/beatles/v2/data/OperatingSystem;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->platform:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdk()Lcom/tantanapp/beatles/v2/data/Sdk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->sdk:Lcom/tantanapp/beatles/v2/data/Sdk;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubEventType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->subEventType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->tags:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getTags()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->tags:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreads()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorThread;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->threads:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransaction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->transaction:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser()Lcom/tantanapp/beatles/v2/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->user:Lcom/tantanapp/beatles/v2/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEmergency()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isEmergency:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNeedLogcatProcessor()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->needLogcatProcessor:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNeedOtherThread()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->needOtherThread:Z

    .line 2
    .line 3
    return p0
.end method

.method public needSendSync()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isCache:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isEmergency:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public removeExtra(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->extra:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setApp(Lcom/tantanapp/beatles/v2/data/App;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->app:Lcom/tantanapp/beatles/v2/data/App;

    .line 2
    .line 3
    return-void
.end method

.method public setCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCacheDir(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->cacheDir:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setClientTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->clientTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCrashThread(Ljava/lang/Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->crashThread:Ljava/lang/Thread;

    .line 2
    .line 3
    return-void
.end method

.method public setDevice(Lcom/tantanapp/beatles/v2/data/Device;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->device:Lcom/tantanapp/beatles/v2/data/Device;

    .line 2
    .line 3
    return-void
.end method

.method public setEmergency(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isEmergency:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnvironment(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->env:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEventId(Lcom/tantanapp/beatles/v2/data/EventId;)V
    .locals 0
    .param p1    # Lcom/tantanapp/beatles/v2/data/EventId;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/EventId;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventId:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public setEventType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->eventType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExceptions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorException;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->exceptions:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setExtra(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->extra:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->extra:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->extra:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->format:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMappingFiles(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->mappingFiles:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedLogcatProcessor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->needLogcatProcessor:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNeedOtherThread(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->needOtherThread:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNewExceptionType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->newExceptiontype:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOs(Lcom/tantanapp/beatles/v2/data/OperatingSystem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->os:Lcom/tantanapp/beatles/v2/data/OperatingSystem;

    .line 2
    .line 3
    return-void
.end method

.method public setPlatform(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->platform:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSdk(Lcom/tantanapp/beatles/v2/data/Sdk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->sdk:Lcom/tantanapp/beatles/v2/data/Sdk;

    .line 2
    .line 3
    return-void
.end method

.method public setSubEventType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->subEventType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTag(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->tags:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->tags:Ljava/util/HashMap;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->tags:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setThreads(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/v2/data/MonitorThread;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->threads:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-void
.end method

.method public setTransaction(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->transaction:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUser(Lcom/tantanapp/beatles/v2/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->user:Lcom/tantanapp/beatles/v2/data/User;

    .line 2
    .line 3
    return-void
.end method
