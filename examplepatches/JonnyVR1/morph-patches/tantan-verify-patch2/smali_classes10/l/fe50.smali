.class public final synthetic Ll/fe50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;

.field public final synthetic b:Ll/pe50;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fe50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;

    iput-object p2, p0, Ll/fe50;->b:Ll/pe50;

    iput-object p3, p0, Ll/fe50;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fe50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;

    iget-object v1, p0, Ll/fe50;->b:Ll/pe50;

    iget-object p0, p0, Ll/fe50;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V

    return-void
.end method
