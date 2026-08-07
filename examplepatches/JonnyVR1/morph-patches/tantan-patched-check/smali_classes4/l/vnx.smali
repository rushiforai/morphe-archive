.class public final synthetic Ll/vnx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/xnx;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;


# direct methods
.method public synthetic constructor <init>(Ll/xnx;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vnx;->a:Ll/xnx;

    iput-object p2, p0, Ll/vnx;->b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vnx;->a:Ll/xnx;

    iget-object p0, p0, Ll/vnx;->b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    invoke-static {v0, p0}, Ll/xnx;->k(Ll/xnx;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
