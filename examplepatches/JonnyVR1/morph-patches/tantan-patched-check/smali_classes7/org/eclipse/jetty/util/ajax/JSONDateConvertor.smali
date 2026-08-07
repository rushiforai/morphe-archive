.class public Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Convertor;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field _dateCache:Lorg/eclipse/jetty/util/DateCache;

.field _format:Ljava/text/SimpleDateFormat;

.field private _fromJSON:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;Z)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Lorg/eclipse/jetty/util/DateCache;

    invoke-direct {v0, p1}, Lorg/eclipse/jetty/util/DateCache;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_dateCache:Lorg/eclipse/jetty/util/DateCache;

    .line 35
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/util/DateCache;->setTimeZone(Ljava/util/TimeZone;)V

    .line 36
    iput-boolean p3, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_fromJSON:Z

    .line 37
    new-instance p3, Ljava/text/SimpleDateFormat;

    invoke-direct {p3, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_format:Ljava/text/SimpleDateFormat;

    .line 38
    invoke-virtual {p3, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;ZLjava/util/Locale;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/eclipse/jetty/util/DateCache;

    .line 5
    .line 6
    invoke-direct {v0, p1, p4}, Lorg/eclipse/jetty/util/DateCache;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_dateCache:Lorg/eclipse/jetty/util/DateCache;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/util/DateCache;->setTimeZone(Ljava/util/TimeZone;)V

    .line 12
    .line 13
    .line 14
    iput-boolean p3, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_fromJSON:Z

    .line 15
    .line 16
    new-instance p3, Ljava/text/SimpleDateFormat;

    .line 17
    .line 18
    new-instance v0, Ljava/text/DateFormatSymbols;

    .line 19
    .line 20
    invoke-direct {v0, p4}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p3, p1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    .line 24
    .line 25
    .line 26
    iput-object p3, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_format:Ljava/text/SimpleDateFormat;

    .line 27
    .line 28
    invoke-virtual {p3, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    .line 32
    sget-object v0, Lorg/eclipse/jetty/util/DateCache;->DEFAULT_FORMAT:Ljava/lang/String;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;-><init>(Ljava/lang/String;Ljava/util/TimeZone;Z)V

    return-void
.end method


# virtual methods
.method public fromJSON(Ljava/util/Map;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_fromJSON:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_format:Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    :try_start_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_format:Ljava/text/SimpleDateFormat;

    .line 10
    .line 11
    const-string v2, "value"

    .line 12
    .line 13
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/text/Format;->parseObject(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    monitor-exit v0

    .line 24
    return-object p0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 28
    :catch_0
    move-exception p0

    .line 29
    sget-object p1, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 30
    .line 31
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_0
    invoke-static {}, Ll/l710;->a()V

    .line 36
    .line 37
    .line 38
    return-object v1
.end method

.method public toJSON(Ljava/lang/Object;Lorg/eclipse/jetty/util/ajax/JSON$Output;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_dateCache:Lorg/eclipse/jetty/util/DateCache;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    check-cast v1, Ljava/util/Date;

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/util/DateCache;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/ajax/JSONDateConvertor;->_fromJSON:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p2, p0}, Lorg/eclipse/jetty/util/ajax/JSON$Output;->addClass(Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "value"

    .line 22
    .line 23
    invoke-interface {p2, p0, v0}, Lorg/eclipse/jetty/util/ajax/JSON$Output;->add(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-interface {p2, v0}, Lorg/eclipse/jetty/util/ajax/JSON$Output;->add(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
