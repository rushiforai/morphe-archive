.class public final synthetic Ll/nix0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentFactory;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final create(Lcom/google/firebase/components/ComponentContainer;)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance p0, Ll/yyc0$a;

    .line 2
    .line 3
    const-class v0, Ll/mzb;

    .line 4
    .line 5
    const-class v1, Ll/crw0;

    .line 6
    .line 7
    invoke-interface {p1, v1}, Lcom/google/firebase/components/ComponentContainer;->getProvider(Ljava/lang/Class;)Lcom/google/firebase/inject/Provider;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, v0, p1}, Ll/yyc0$a;-><init>(Ljava/lang/Class;Lcom/google/firebase/inject/Provider;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method
