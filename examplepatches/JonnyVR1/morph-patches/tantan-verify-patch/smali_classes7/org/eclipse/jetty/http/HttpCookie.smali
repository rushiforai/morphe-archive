.class public Lorg/eclipse/jetty/http/HttpCookie;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final _comment:Ljava/lang/String;

.field private final _domain:Ljava/lang/String;

.field private final _httpOnly:Z

.field private final _maxAge:I

.field private final _name:Ljava/lang/String;

.field private final _path:Ljava/lang/String;

.field private final _secure:Z

.field private final _value:Ljava/lang/String;

.field private final _version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    iput-boolean p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 18
    .line 19
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 20
    .line 21
    iput-boolean p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 22
    .line 23
    iput p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    const/4 p2, 0x0

    .line 41
    iput-boolean p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    .line 42
    iput p3, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 43
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 44
    iput-boolean p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 45
    iput p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    const/4 p2, -0x1

    .line 32
    iput p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 33
    iput-object p4, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 34
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 35
    iput p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZ)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 48
    iput-object p3, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    .line 49
    iput-boolean p6, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    .line 50
    iput p5, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 51
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 53
    iput-boolean p7, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 54
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    const/4 p1, 0x0

    .line 55
    iput p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLjava/lang/String;I)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p8, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    .line 59
    iput-boolean p6, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    .line 60
    iput p5, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 61
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 62
    iput-object p4, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 63
    iput-boolean p7, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 64
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    .line 65
    iput p9, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    return-void
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_comment:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_domain:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxAge()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_maxAge:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_version:I

    .line 2
    .line 3
    return p0
.end method

.method public isHttpOnly()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_httpOnly:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSecure()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/http/HttpCookie;->_secure:Z

    .line 2
    .line 3
    return p0
.end method
