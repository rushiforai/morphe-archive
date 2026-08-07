.class public final synthetic Ll/url0;
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
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    invoke-static {p1, p2}, Ll/gsl0;->o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
