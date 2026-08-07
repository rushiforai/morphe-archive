.class public Lorg/eclipse/jetty/security/MappedLoginService$Anonymous;
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
    name = "Anonymous"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xf3b9a2abd7db8edL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/Object;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Anonymous"

    .line 2
    .line 3
    return-object p0
.end method

.method public isAuthenticated()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
