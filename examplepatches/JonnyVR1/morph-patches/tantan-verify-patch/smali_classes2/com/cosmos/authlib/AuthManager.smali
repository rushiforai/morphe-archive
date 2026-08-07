.class public Lcom/cosmos/authlib/AuthManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/authlib/AuthManager$b;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AuthManager"


# instance fields
.field private authImpl:Ll/fpl;

.field private authManagerConfig:Ll/xd1;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/authlib/AuthManager$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkInit()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "init must be called first!"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static getInstance()Lcom/cosmos/authlib/AuthManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/authlib/AuthManager$b;->a:Lcom/cosmos/authlib/AuthManager;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public getISPType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/fpl;->getISPType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRequestBodyMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;->checkInit()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/fpl;->getRequestBodyMap()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public init(Ll/xd1;)I
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string p1, "authManagerConfig must not be null!"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public loginAuth(Ll/f7m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;->checkInit()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/fpl;->loginAuth(Ll/f7m;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public loginAuth(Ll/f7m;J)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;->checkInit()V

    .line 11
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    invoke-interface {p0, p1, p2, p3}, Ll/fpl;->loginAuth(Ll/f7m;J)V

    return-void
.end method

.method public offerNumber(Ll/q1m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;->checkInit()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/fpl;->offerNumber(Ll/q1m;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public offerNumber(Ll/q1m;J)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/cosmos/authlib/AuthManager;->checkInit()V

    .line 11
    iget-object p0, p0, Lcom/cosmos/authlib/AuthManager;->authImpl:Ll/fpl;

    invoke-interface {p0, p1, p2, p3}, Ll/fpl;->offerNumber(Ll/q1m;J)V

    return-void
.end method
