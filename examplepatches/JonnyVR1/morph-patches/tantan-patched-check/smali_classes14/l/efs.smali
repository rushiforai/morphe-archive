.class public final synthetic Ll/efs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/efs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveLabel;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
