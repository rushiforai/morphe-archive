.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static i0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->k9:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l2r;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAdapter(Ll/k2r;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->e:Lv/VRecyclerView;

    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
