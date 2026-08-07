.class public Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->r0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->i0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->k0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
