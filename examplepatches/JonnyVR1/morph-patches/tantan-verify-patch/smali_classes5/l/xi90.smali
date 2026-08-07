.class public final synthetic Ll/xi90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function6;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    move-object v2, p3

    check-cast v2, Ljava/util/List;

    move-object v3, p4

    check-cast v3, Ll/pf60;

    move-object v4, p5

    check-cast v4, Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;

    move-object v5, p6

    check-cast v5, Ljava/util/ArrayList;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerVIPView;->P(ZZLjava/util/List;Ll/pf60;Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;Ljava/util/ArrayList;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
