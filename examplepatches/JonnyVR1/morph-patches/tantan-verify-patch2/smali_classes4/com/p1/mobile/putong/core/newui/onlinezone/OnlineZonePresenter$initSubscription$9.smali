.class final synthetic Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;
.super Lkotlin/jvm/internal/FunctionReferenceImpl;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/FunctionReferenceImpl;",
        "Lkotlin/jvm/functions/Function2<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
        "Ll/vg60<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;",
        "Ll/pf60<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
        "Ll/vg60<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;->INSTANCE:Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const-string v4, "pair(Ljava/lang/Object;Ljava/lang/Object;)Landroidx/core/util/Pair;"

    const/4 v5, 0x0

    const/4 v1, 0x2

    const-class v2, Ll/jyb;

    const-string v3, "pair"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    check-cast p2, Ll/vg60;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter$initSubscription$9;->invoke(Lcom/p1/mobile/putong/core/data/UserPrivilege;Ll/vg60;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final invoke(Lcom/p1/mobile/putong/core/data/UserPrivilege;Ll/vg60;)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 10
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
