.class public final synthetic Ll/q2l0;
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

    check-cast p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->l0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
