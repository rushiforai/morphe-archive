.class public final synthetic Ll/hj90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function5;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/util/List;

    check-cast p3, Ll/pf60;

    check-cast p4, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    check-cast p5, Ljava/util/ArrayList;

    invoke-static {p0, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerYouthVipView;->J(ZLjava/util/List;Ll/pf60;Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;Ljava/util/ArrayList;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
