.class public final synthetic Ll/i7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

.field public final synthetic b:Ll/h7o;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/h7o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i7o;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    iput-object p2, p0, Ll/i7o;->b:Ll/h7o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i7o;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    iget-object p0, p0, Ll/i7o;->b:Ll/h7o;

    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/h7o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
