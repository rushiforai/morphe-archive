.class public Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->q0()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->i0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->k0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;->a:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
