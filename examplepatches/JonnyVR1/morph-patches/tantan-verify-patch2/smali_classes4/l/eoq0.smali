.class public final synthetic Ll/eoq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;->l0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/DoublePair;

    move-result-object p0

    return-object p0
.end method
