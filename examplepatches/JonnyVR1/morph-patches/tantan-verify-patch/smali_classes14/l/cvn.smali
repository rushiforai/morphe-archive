.class public final synthetic Ll/cvn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cvn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    iput-object p2, p0, Ll/cvn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cvn;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    iget-object p0, p0, Ll/cvn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;->b(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V

    return-void
.end method
