.class public abstract Lorg/eclipse/jetty/io/nio/SelectorManager;
.super Lorg/eclipse/jetty/util/component/AbstractLifeCycle;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/Dumpable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/nio/SelectorManager$ChangeTask;,
        Lorg/eclipse/jetty/io/nio/SelectorManager$ChannelAndAttachment;,
        Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;
    }
.end annotation


# static fields
.field public static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final __BUSY_PAUSE:I

.field private static final __IDLE_TICK:I

.field private static final __MAX_SELECTS:I

.field private static final __MONITOR_PERIOD:I


# instance fields
.field private _deferringInterestedOps0:Z

.field private _lowResourcesConnections:J

.field private _lowResourcesMaxIdleTime:I

.field private _maxIdleTime:I

.field private _selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

.field private _selectSets:I

.field private _selectorPriorityDelta:I

.field private volatile _set:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "org.eclipse.jetty.io.nio"

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/String;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const-string v0, "org.eclipse.jetty.io.nio.MONITOR_PERIOD"

    .line 10
    .line 11
    const/16 v1, 0x3e8

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__MONITOR_PERIOD:I

    .line 22
    .line 23
    const-string v0, "org.eclipse.jetty.io.nio.MAX_SELECTS"

    .line 24
    .line 25
    const v1, 0x186a0

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sput v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__MAX_SELECTS:I

    .line 37
    .line 38
    const-string v0, "org.eclipse.jetty.io.nio.BUSY_PAUSE"

    .line 39
    .line 40
    const/16 v1, 0x32

    .line 41
    .line 42
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    sput v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__BUSY_PAUSE:I

    .line 51
    .line 52
    const-string v0, "org.eclipse.jetty.io.nio.IDLE_TICK"

    .line 53
    .line 54
    const/16 v1, 0x190

    .line 55
    .line 56
    invoke-static {v0, v1}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    sput v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__IDLE_TICK:I

    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_deferringInterestedOps0:Z

    .line 11
    .line 12
    iput v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectorPriorityDelta:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/io/nio/SelectorManager;)[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100()I
    .locals 1

    .line 1
    sget v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__MONITOR_PERIOD:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$200()I
    .locals 1

    .line 1
    sget v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__BUSY_PAUSE:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$300()I
    .locals 1

    .line 1
    sget v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__IDLE_TICK:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$400()I
    .locals 1

    .line 1
    sget v0, Lorg/eclipse/jetty/io/nio/SelectorManager;->__MAX_SELECTS:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$500(Lorg/eclipse/jetty/io/nio/SelectorManager;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesConnections:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$600(Lorg/eclipse/jetty/io/nio/SelectorManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_maxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$700(Lorg/eclipse/jetty/io/nio/SelectorManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesMaxIdleTime:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public connectionFailed(Ljava/nio/channels/SocketChannel;Ljava/lang/Throwable;Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p3, 0x0

    .line 30
    new-array p3, p3, [Ljava/lang/Object;

    .line 31
    .line 32
    invoke-interface {p0, p1, p3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0, p2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public abstract dispatch(Ljava/lang/Runnable;)Z
.end method

.method public doStart()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 2
    .line 3
    new-array v0, v0, [Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 4
    .line 5
    iput-object v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    if-ge v1, v3, :cond_0

    .line 13
    .line 14
    new-instance v3, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 15
    .line 16
    invoke-direct {v3, p0, v1}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;-><init>(Lorg/eclipse/jetty/io/nio/SelectorManager;I)V

    .line 17
    .line 18
    .line 19
    aput-object v3, v2, v1

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->doStart()V

    .line 25
    .line 26
    .line 27
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager;->getSelectSets()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ge v0, v1, :cond_2

    .line 32
    .line 33
    new-instance v1, Lorg/eclipse/jetty/io/nio/SelectorManager$1;

    .line 34
    .line 35
    invoke-direct {v1, p0, v0}, Lorg/eclipse/jetty/io/nio/SelectorManager$1;-><init>(Lorg/eclipse/jetty/io/nio/SelectorManager;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->dispatch(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const-string p0, "!Selecting"

    .line 48
    .line 49
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public doStop()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    aget-object v3, v0, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v3}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->stop()V

    .line 17
    .line 18
    .line 19
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->doStop()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public dump()Ljava/lang/String;
    .locals 0

    .line 20
    invoke-static {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->dump(Lorg/eclipse/jetty/util/component/Dumpable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public dump(Ljava/lang/Appendable;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->dumpObject(Ljava/lang/Appendable;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 5
    .line 6
    invoke-static {p0}, Lorg/eclipse/jetty/util/TypeUtil;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x1

    .line 11
    new-array v0, v0, [Ljava/util/Collection;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    aput-object p0, v0, v1

    .line 15
    .line 16
    invoke-static {p1, p2, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->dump(Ljava/lang/Appendable;Ljava/lang/String;[Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public abstract endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
.end method

.method public abstract endPointOpened(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
.end method

.method public abstract endPointUpgraded(Lorg/eclipse/jetty/io/ConnectedEndPoint;Lorg/eclipse/jetty/io/Connection;)V
.end method

.method public getLowResourcesConnections()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesConnections:J

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 4
    .line 5
    int-to-long v2, p0

    .line 6
    mul-long/2addr v0, v2

    .line 7
    return-wide v0
.end method

.method public getLowResourcesMaxIdleTime()J
    .locals 2

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesMaxIdleTime:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public getMaxIdleTime()J
    .locals 2

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_maxIdleTime:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public getSelectSet(I)Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public getSelectSets()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectorPriorityDelta()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectorPriorityDelta:I

    .line 2
    .line 3
    return p0
.end method

.method public isDeferringInterestedOps0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_deferringInterestedOps0:Z

    .line 2
    .line 3
    return p0
.end method

.method public abstract newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;
.end method

.method public abstract newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public register(Ljava/nio/channels/ServerSocketChannel;)V
    .locals 2

    .line 32
    iget v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    if-gez v0, :cond_0

    neg-int v0, v0

    .line 33
    :cond_0
    iget v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    rem-int/2addr v0, v1

    .line 34
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    aget-object p0, p0, v0

    .line 35
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->addChange(Ljava/lang/Object;)V

    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->wakeup()V

    return-void
.end method

.method public register(Ljava/nio/channels/SocketChannel;)V
    .locals 2

    .line 26
    iget v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    if-gez v0, :cond_0

    neg-int v0, v0

    .line 27
    :cond_0
    iget v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    rem-int/2addr v0, v1

    .line 28
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    if-eqz p0, :cond_1

    .line 29
    aget-object p0, p0, v0

    .line 30
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->addChange(Ljava/lang/Object;)V

    .line 31
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->wakeup()V

    :cond_1
    return-void
.end method

.method public register(Ljava/nio/channels/SocketChannel;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_set:I

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    :cond_0
    iget v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 11
    .line 12
    rem-int/2addr v0, v1

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSet:[Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    aget-object p0, p0, v0

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->addChange(Ljava/nio/channels/SelectableChannel;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->wakeup()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public setDeferringInterestedOps0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_deferringInterestedOps0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLowResourcesConnections(J)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 2
    .line 3
    int-to-long v1, v0

    .line 4
    add-long/2addr p1, v1

    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    sub-long/2addr p1, v1

    .line 8
    int-to-long v0, v0

    .line 9
    div-long/2addr p1, v0

    .line 10
    iput-wide p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesConnections:J

    .line 11
    .line 12
    return-void
.end method

.method public setLowResourcesMaxIdleTime(J)V
    .locals 0

    .line 1
    long-to-int p1, p1

    .line 2
    iput p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesMaxIdleTime:I

    .line 3
    .line 4
    return-void
.end method

.method public setMaxIdleTime(J)V
    .locals 0

    .line 1
    long-to-int p1, p1

    .line 2
    iput p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_maxIdleTime:I

    .line 3
    .line 4
    return-void
.end method

.method public setSelectSets(I)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesConnections:J

    .line 2
    .line 3
    iget v2, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 4
    .line 5
    int-to-long v2, v2

    .line 6
    mul-long/2addr v0, v2

    .line 7
    iput p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectSets:I

    .line 8
    .line 9
    int-to-long v2, p1

    .line 10
    div-long/2addr v0, v2

    .line 11
    iput-wide v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_lowResourcesConnections:J

    .line 12
    .line 13
    return-void
.end method

.method public setSelectorPriorityDelta(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager;->_selectorPriorityDelta:I

    .line 2
    .line 3
    return-void
.end method
