.class public final synthetic Ll/se50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/se50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    iput-object p2, p0, Ll/se50;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/se50;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    iget-object p0, p0, Ll/se50;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;->c(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V

    return-void
.end method
