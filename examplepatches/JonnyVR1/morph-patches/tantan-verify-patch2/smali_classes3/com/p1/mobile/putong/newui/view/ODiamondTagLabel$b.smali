.class public Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->q0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "[I>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

.field public final synthetic b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->a:Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a([I)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->d:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->d:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    new-array v1, v1, [Landroid/view/View;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    aput-object v0, v1, v2

    .line 31
    .line 32
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->a:Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->b:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, [I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;->a([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
