.class Lorg/eclipse/jetty/http/HttpFields$DateParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpFields;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DateParser"
.end annotation


# instance fields
.field final _dateReceive:[Ljava/text/SimpleDateFormat;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$300()[Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    array-length v0, v0

    .line 9
    new-array v0, v0, [Ljava/text/SimpleDateFormat;

    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateParser;->_dateReceive:[Ljava/text/SimpleDateFormat;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/http/HttpFields$1;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpFields$DateParser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Ljava/lang/String;)J
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields$DateParser;->_dateReceive:[Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_1

    .line 7
    .line 8
    aget-object v3, v2, v1

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$300()[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    aget-object v4, v4, v1

    .line 19
    .line 20
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 21
    .line 22
    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 23
    .line 24
    .line 25
    aput-object v3, v2, v1

    .line 26
    .line 27
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields$DateParser;->_dateReceive:[Ljava/text/SimpleDateFormat;

    .line 28
    .line 29
    aget-object v2, v2, v1

    .line 30
    .line 31
    sget-object v3, Lorg/eclipse/jetty/http/HttpFields;->__GMT:Ljava/util/TimeZone;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields$DateParser;->_dateReceive:[Ljava/text/SimpleDateFormat;

    .line 37
    .line 38
    aget-object v2, v2, v1

    .line 39
    .line 40
    invoke-virtual {v2, p1}, Ljava/text/Format;->parseObject(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/util/Date;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-wide p0

    .line 51
    :catch_0
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const-string v1, " GMT"

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/lit8 v1, v1, -0x4

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$DateParser;->_dateReceive:[Ljava/text/SimpleDateFormat;

    .line 73
    .line 74
    array-length v2, v1

    .line 75
    if-ge v0, v2, :cond_2

    .line 76
    .line 77
    :try_start_1
    aget-object v1, v1, v0

    .line 78
    .line 79
    invoke-virtual {v1, p1}, Ljava/text/Format;->parseObject(Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Ljava/util/Date;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 86
    .line 87
    .line 88
    move-result-wide p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 89
    return-wide p0

    .line 90
    :catch_1
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    const-wide/16 p0, -0x1

    .line 94
    .line 95
    return-wide p0
.end method
