.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gbb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->a:Lv/AutoVDraweeView;

    .line 18
    .line 19
    sget v3, Ll/jbc0;->cb:I

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 22
    .line 23
    .line 24
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->b:Lv/AutoVDraweeView;

    .line 27
    .line 28
    sget v3, Ll/jbc0;->db:I

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->a:Lv/AutoVDraweeView;

    .line 37
    .line 38
    sget v3, Ll/jbc0;->eb:I

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 41
    .line 42
    .line 43
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->b:Lv/AutoVDraweeView;

    .line 46
    .line 47
    sget v3, Ll/jbc0;->fb:I

    .line 48
    .line 49
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->c:Lv/AutoVDraweeView;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v2, 0x2

    .line 69
    const/16 v3, 0x8

    .line 70
    .line 71
    invoke-virtual {v1, p0, v0, v2, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PurchaseDlgItemVisitorHideFootPrint;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
