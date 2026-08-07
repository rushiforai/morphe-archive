.class public final synthetic Ll/dg90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/util/List;

    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerODiamondView;->Q(ZLjava/util/List;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
