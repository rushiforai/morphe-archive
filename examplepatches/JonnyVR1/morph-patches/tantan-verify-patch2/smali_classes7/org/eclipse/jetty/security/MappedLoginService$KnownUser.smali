.class public Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/security/MappedLoginService$UserPrincipal;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/security/MappedLoginService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KnownUser"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x566a776f13ae562eL


# instance fields
.field private final _credential:Lorg/eclipse/jetty/util/security/Credential;

.field private final _name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;->_name:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;->_credential:Lorg/eclipse/jetty/util/security/Credential;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;->_credential:Lorg/eclipse/jetty/util/security/Credential;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/security/Credential;->check(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAuthenticated()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
