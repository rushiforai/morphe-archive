.class public Ll/ut60;
.super Ll/tt60;
.source "SourceFile"


# instance fields
.field public H:Landroidx/recyclerview/widget/RecyclerView;

.field public I:Ll/mch;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Ll/tt60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/ut60;->H:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public D0(Ll/mch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ut60;->I:Ll/mch;

    .line 2
    .line 3
    return-void
.end method

.method public l0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ut60;->I:Ll/mch;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/mch;->U3()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/tt60;->o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ut60;->I:Ll/mch;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/mch;->g0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-static {}, Ll/cmg;->W()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->H:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 29
    .line 30
    sget v0, Ll/lbc0;->V1:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    const/high16 v0, 0x43520000    # 210.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 56
    .line 57
    const/high16 v0, 0x43160000    # 150.0f

    .line 58
    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 64
    .line 65
    const/high16 v0, 0x42600000    # 56.0f

    .line 66
    .line 67
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 72
    .line 73
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 79
    .line 80
    const/high16 v0, 0x43960000    # 300.0f

    .line 81
    .line 82
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v1, -0x1

    .line 87
    invoke-direct {p0, v1, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
