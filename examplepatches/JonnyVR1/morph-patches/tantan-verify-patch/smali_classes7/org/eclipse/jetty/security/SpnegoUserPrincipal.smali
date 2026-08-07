.class public Lorg/eclipse/jetty/security/SpnegoUserPrincipal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/security/Principal;


# instance fields
.field private _encodedToken:Ljava/lang/String;

.field private final _name:Ljava/lang/String;

.field private _token:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_name:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_encodedToken:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_name:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_token:[B

    return-void
.end method


# virtual methods
.method public getEncodedToken()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_encodedToken:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_token:[B

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/B64Code;->encode([BZ)[C

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_encodedToken:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_encodedToken:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToken()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_token:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_encodedToken:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lorg/eclipse/jetty/util/B64Code;->decode(Ljava/lang/String;)[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_token:[B

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserPrincipal;->_token:[B

    .line 14
    .line 15
    return-object p0
.end method
