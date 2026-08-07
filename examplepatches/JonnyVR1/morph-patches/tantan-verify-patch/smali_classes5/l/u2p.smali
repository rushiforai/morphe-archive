.class public final synthetic Ll/u2p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Ll/pf60;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    invoke-direct {p0, p1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method
