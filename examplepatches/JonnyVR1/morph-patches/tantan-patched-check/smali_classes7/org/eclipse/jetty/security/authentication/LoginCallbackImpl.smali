.class public Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/security/authentication/LoginCallback;


# instance fields
.field private credential:Ljava/lang/Object;

.field private roles:[Ljava/lang/String;

.field private final subject:Ljavax/security/auth/Subject;

.field private success:Z

.field private final userName:Ljava/lang/String;

.field private userPrincipal:Ljava/security/Principal;


# direct methods
.method public constructor <init>(Ljavax/security/auth/Subject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/eclipse/jetty/security/IdentityService;->NO_ROLES:[Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->roles:[Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->subject:Ljavax/security/auth/Subject;

    .line 9
    .line 10
    iput-object p2, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->userName:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p3, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->credential:Ljava/lang/Object;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public clearPassword()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->credential:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->credential:Ljava/lang/Object;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getCredential()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->credential:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoles()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->roles:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubject()Ljavax/security/auth/Subject;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->subject:Ljavax/security/auth/Subject;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->userName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserPrincipal()Ljava/security/Principal;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->userPrincipal:Ljava/security/Principal;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->success:Z

    .line 2
    .line 3
    return p0
.end method

.method public setRoles([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->roles:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSuccess(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->success:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUserPrincipal(Ljava/security/Principal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/authentication/LoginCallbackImpl;->userPrincipal:Ljava/security/Principal;

    .line 2
    .line 3
    return-void
.end method
