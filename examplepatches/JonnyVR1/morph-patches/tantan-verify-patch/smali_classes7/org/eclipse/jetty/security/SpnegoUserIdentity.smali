.class public Lorg/eclipse/jetty/security/SpnegoUserIdentity;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/server/UserIdentity;


# instance fields
.field private _principal:Ljava/security/Principal;

.field private _roles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _subject:Ljavax/security/auth/Subject;


# direct methods
.method public constructor <init>(Ljavax/security/auth/Subject;Ljava/security/Principal;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/security/auth/Subject;",
            "Ljava/security/Principal;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_subject:Ljavax/security/auth/Subject;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_principal:Ljava/security/Principal;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_roles:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getSubject()Ljavax/security/auth/Subject;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_subject:Ljavax/security/auth/Subject;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserPrincipal()Ljava/security/Principal;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_principal:Ljava/security/Principal;

    .line 2
    .line 3
    return-object p0
.end method

.method public isUserInRole(Ljava/lang/String;Lorg/eclipse/jetty/server/UserIdentity$Scope;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/SpnegoUserIdentity;->_roles:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
