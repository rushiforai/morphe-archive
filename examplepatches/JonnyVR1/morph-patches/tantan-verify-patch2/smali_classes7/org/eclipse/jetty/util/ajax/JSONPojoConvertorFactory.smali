.class public Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Convertor;


# instance fields
.field private final _fromJson:Z

.field private final _json:Lorg/eclipse/jetty/util/ajax/JSON;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/util/ajax/JSON;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_fromJson:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    throw p0
.end method

.method public constructor <init>(Lorg/eclipse/jetty/util/ajax/JSON;Z)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 18
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 19
    iput-boolean p2, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_fromJson:Z

    return-void

    .line 20
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public fromJSON(Ljava/util/Map;)Ljava/lang/Object;
    .locals 5

    .line 1
    const-string v0, "class"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/util/ajax/JSON;->getConvertorFor(Ljava/lang/String;)Lorg/eclipse/jetty/util/ajax/JSON$Convertor;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    :try_start_0
    const-class v2, Lorg/eclipse/jetty/util/ajax/JSON;

    .line 20
    .line 21
    invoke-static {v2, v0}, Lorg/eclipse/jetty/util/Loader;->loadClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;

    .line 26
    .line 27
    iget-boolean v4, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_fromJson:Z

    .line 28
    .line 29
    invoke-direct {v3, v2, v4}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;-><init>(Ljava/lang/Class;Z)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 30
    .line 31
    .line 32
    :try_start_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v3}, Lorg/eclipse/jetty/util/ajax/JSON;->addConvertorFor(Ljava/lang/String;Lorg/eclipse/jetty/util/ajax/JSON$Convertor;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 35
    .line 36
    .line 37
    move-object v1, v3

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception p0

    .line 40
    move-object v1, v3

    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception p0

    .line 43
    :goto_0
    sget-object v0, Lorg/eclipse/jetty/util/ajax/JSON;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 44
    .line 45
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-interface {v1, p1}, Lorg/eclipse/jetty/util/ajax/JSON$Convertor;->fromJSON(Ljava/util/Map;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    return-object p1
.end method

.method public toJSON(Ljava/lang/Object;Lorg/eclipse/jetty/util/ajax/JSON$Output;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/util/ajax/JSON;->getConvertorFor(Ljava/lang/String;)Lorg/eclipse/jetty/util/ajax/JSON$Convertor;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    const-class v2, Lorg/eclipse/jetty/util/ajax/JSON;

    .line 18
    .line 19
    invoke-static {v2, v0}, Lorg/eclipse/jetty/util/Loader;->loadClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;

    .line 24
    .line 25
    iget-boolean v4, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_fromJson:Z

    .line 26
    .line 27
    invoke-direct {v3, v2, v4}, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertor;-><init>(Ljava/lang/Class;Z)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    .line 29
    .line 30
    :try_start_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONPojoConvertorFactory;->_json:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v3}, Lorg/eclipse/jetty/util/ajax/JSON;->addConvertorFor(Ljava/lang/String;Lorg/eclipse/jetty/util/ajax/JSON$Convertor;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 33
    .line 34
    .line 35
    move-object v1, v3

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-exception p0

    .line 38
    move-object v1, v3

    .line 39
    goto :goto_0

    .line 40
    :catch_1
    move-exception p0

    .line 41
    :goto_0
    sget-object v0, Lorg/eclipse/jetty/util/ajax/JSON;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 42
    .line 43
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-interface {v1, p1, p2}, Lorg/eclipse/jetty/util/ajax/JSON$Convertor;->toJSON(Ljava/lang/Object;Lorg/eclipse/jetty/util/ajax/JSON$Output;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method
