.class public final synthetic Ll/re50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/re50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    iput-object p2, p0, Ll/re50;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/re50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    iget-object p0, p0, Ll/re50;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V

    return-void
.end method
