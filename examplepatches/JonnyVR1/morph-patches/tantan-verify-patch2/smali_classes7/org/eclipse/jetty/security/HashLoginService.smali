.class public Lorg/eclipse/jetty/security/HashLoginService;
.super Lorg/eclipse/jetty/security/MappedLoginService;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _config:Ljava/lang/String;

.field private _configResource:Lorg/eclipse/jetty/util/resource/Resource;

.field private _propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

.field private _refreshInterval:I

.field private _scanner:Lorg/eclipse/jetty/util/Scanner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/security/HashLoginService;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/security/HashLoginService;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Lorg/eclipse/jetty/security/MappedLoginService;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Lorg/eclipse/jetty/security/MappedLoginService;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 16
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/security/MappedLoginService;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/security/MappedLoginService;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/security/MappedLoginService;->setName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/security/HashLoginService;->setConfig(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public doStart()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/security/MappedLoginService;->doStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    sget-object v0, Lorg/eclipse/jetty/security/HashLoginService;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 9
    .line 10
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "doStart: Starting new PropertyUserStore. PropertiesFile: "

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lorg/eclipse/jetty/security/HashLoginService;->_config:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, " refreshInterval: "

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v2, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x0

    .line 43
    new-array v2, v2, [Ljava/lang/Object;

    .line 44
    .line 45
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 49
    .line 50
    invoke-direct {v0}, Lorg/eclipse/jetty/security/PropertyUserStore;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 54
    .line 55
    iget v1, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/security/PropertyUserStore;->setRefreshInterval(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 61
    .line 62
    iget-object v1, p0, Lorg/eclipse/jetty/security/HashLoginService;->_config:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/security/PropertyUserStore;->setConfig(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->registerUserListener(Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_propertyUserStore:Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 73
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->start()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public doStop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/security/MappedLoginService;->doStop()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 13
    .line 14
    return-void
.end method

.method public getConfig()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_config:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConfig(Ljava/lang/String;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/security/HashLoginService;->_config:Ljava/lang/String;

    return-void
.end method

.method public getConfigResource()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_configResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRefreshInterval()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public loadUser(Ljava/lang/String;)Lorg/eclipse/jetty/server/UserIdentity;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public loadUsers()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/security/HashLoginService;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "remove: "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    new-array v2, v2, [Ljava/lang/Object;

    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/security/MappedLoginService;->removeUser(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/HashLoginService;->_config:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRefreshInterval(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/security/HashLoginService;->_refreshInterval:I

    .line 2
    .line 3
    return-void
.end method

.method public update(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;[Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/security/HashLoginService;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "update: "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " Roles: "

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    array-length v2, p3

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x0

    .line 33
    new-array v2, v2, [Ljava/lang/Object;

    .line 34
    .line 35
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/security/MappedLoginService;->putUser(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;[Ljava/lang/String;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 39
    .line 40
    .line 41
    return-void
.end method
