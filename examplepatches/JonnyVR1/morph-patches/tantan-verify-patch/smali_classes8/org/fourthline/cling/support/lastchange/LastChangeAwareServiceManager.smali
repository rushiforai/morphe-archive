.class public Lorg/fourthline/cling/support/lastchange/LastChangeAwareServiceManager;
.super Lorg/fourthline/cling/model/DefaultServiceManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;",
        ">",
        "Lorg/fourthline/cling/model/DefaultServiceManager<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected final lastChangeParser:Lorg/fourthline/cling/support/lastchange/LastChangeParser;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/LocalService;Ljava/lang/Class;Lorg/fourthline/cling/support/lastchange/LastChangeParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/meta/LocalService<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lorg/fourthline/cling/support/lastchange/LastChangeParser;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/model/DefaultServiceManager;-><init>(Lorg/fourthline/cling/model/meta/LocalService;Ljava/lang/Class;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/support/lastchange/LastChangeAwareServiceManager;->lastChangeParser:Lorg/fourthline/cling/support/lastchange/LastChangeParser;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/LocalService;Lorg/fourthline/cling/support/lastchange/LastChangeParser;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/meta/LocalService<",
            "TT;>;",
            "Lorg/fourthline/cling/support/lastchange/LastChangeParser;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0, p2}, Lorg/fourthline/cling/support/lastchange/LastChangeAwareServiceManager;-><init>(Lorg/fourthline/cling/model/meta/LocalService;Ljava/lang/Class;Lorg/fourthline/cling/support/lastchange/LastChangeParser;)V

    return-void
.end method


# virtual methods
.method public fireLastChange()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->lock()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getImplementation()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;

    .line 9
    .line 10
    invoke-interface {v0}, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;->getLastChange()Lorg/fourthline/cling/support/lastchange/LastChange;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getPropertyChangeSupport()Ljava/beans/PropertyChangeSupport;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/lastchange/LastChange;->fire(Ljava/beans/PropertyChangeSupport;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->unlock()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->unlock()V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public getLastChangeParser()Lorg/fourthline/cling/support/lastchange/LastChangeParser;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/lastchange/LastChangeAwareServiceManager;->lastChangeParser:Lorg/fourthline/cling/support/lastchange/LastChangeParser;

    .line 2
    .line 3
    return-object p0
.end method

.method public readInitialEventedStateVariableValues()Ljava/util/Collection;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/state/StateVariableValue;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/lastchange/LastChange;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/lastchange/LastChangeAwareServiceManager;->getLastChangeParser()Lorg/fourthline/cling/support/lastchange/LastChangeParser;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lorg/fourthline/cling/support/lastchange/LastChange;-><init>(Lorg/fourthline/cling/support/lastchange/LastChangeParser;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getImplementation()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;

    .line 15
    .line 16
    invoke-interface {v1}, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;->getCurrentInstanceIds()[Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    array-length v2, v1

    .line 21
    if-lez v2, :cond_0

    .line 22
    .line 23
    array-length v2, v1

    .line 24
    const/4 v3, 0x0

    .line 25
    :goto_0
    if-ge v3, v2, :cond_1

    .line 26
    .line 27
    aget-object v4, v1, v3

    .line 28
    .line 29
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getImplementation()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    check-cast v5, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;

    .line 34
    .line 35
    invoke-interface {v5, v0, v4}, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;->appendCurrentState(Lorg/fourthline/cling/support/lastchange/LastChange;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getImplementation()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;

    .line 46
    .line 47
    new-instance v2, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 48
    .line 49
    const-wide/16 v3, 0x0

    .line 50
    .line 51
    invoke-direct {v2, v3, v4}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v1, v0, v2}, Lorg/fourthline/cling/support/lastchange/LastChangeDelegator;->appendCurrentState(Lorg/fourthline/cling/support/lastchange/LastChange;Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DefaultServiceManager;->getService()Lorg/fourthline/cling/model/meta/LocalService;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v1, "LastChange"

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Lorg/fourthline/cling/model/meta/Service;->getStateVariable(Ljava/lang/String;)Lorg/fourthline/cling/model/meta/StateVariable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    new-instance v1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v2, Lorg/fourthline/cling/model/state/StateVariableValue;

    .line 73
    .line 74
    invoke-virtual {v0}, Lorg/fourthline/cling/support/lastchange/LastChange;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-direct {v2, p0, v0}, Lorg/fourthline/cling/model/state/StateVariableValue;-><init>(Lorg/fourthline/cling/model/meta/StateVariable;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    return-object v1
.end method
