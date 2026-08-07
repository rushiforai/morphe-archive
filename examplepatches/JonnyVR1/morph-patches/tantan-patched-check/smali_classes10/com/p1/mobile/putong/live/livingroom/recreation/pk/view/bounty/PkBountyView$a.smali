.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;
.super Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->l(Ljava/lang/String;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;->a:Ll/x20;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView$a;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
