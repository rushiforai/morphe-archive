.class public final synthetic Ll/vtg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;

    iput-object p2, p0, Ll/vtg;->b:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;

    iget-object p0, p0, Ll/vtg;->b:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;->m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterLiveVoiceMomentView;Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;Landroid/view/View;)V

    return-void
.end method
