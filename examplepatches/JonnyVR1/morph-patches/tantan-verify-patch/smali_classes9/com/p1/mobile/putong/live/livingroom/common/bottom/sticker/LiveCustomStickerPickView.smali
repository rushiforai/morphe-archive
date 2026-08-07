.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VPager;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VRecyclerView;

.field public j:Landroid/widget/TextView;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/lyj;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f8s;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V
    .locals 1

    .line 1
    new-instance v0, Ll/lyj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/lyj;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->n:Ll/lyj;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->f:Lv/VPager;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->f:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->f:Lv/VPager;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView$a;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V
    .locals 8

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v3, 0x2

    .line 8
    invoke-direct {v0, v1, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i:Lv/VRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/n5g0;

    .line 17
    .line 18
    const/high16 v0, 0x41a00000    # 20.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/high16 v0, 0x41400000    # 12.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    const/4 v7, 0x1

    .line 35
    invoke-direct/range {v2 .. v7}, Ll/n5g0;-><init>(IIIIZ)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i:Lv/VRecyclerView;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i:Lv/VRecyclerView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i:Lv/VRecyclerView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroidx/recyclerview/widget/v;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 61
    .line 62
    .line 63
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 v1, 0x1

    .line 70
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;-><init>(Lcom/p1/mobile/android/app/Act;Z)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 74
    .line 75
    new-instance p1, Ll/e8s;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Ll/e8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->I(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i:Lv/VRecyclerView;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/b8s;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/b8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->c:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/c8s;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/c8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->h(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->j:Landroid/widget/TextView;

    .line 28
    .line 29
    new-instance v0, Ll/d8s;

    .line 30
    .line 31
    invoke-direct {v0, p0, p2}, Ll/d8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;->getItem()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final n(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    if-nez p1, :cond_2

    .line 18
    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    const/4 v0, 0x0

    .line 21
    move v1, v0

    .line 22
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge v1, v2, :cond_5

    .line 29
    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 39
    .line 40
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 55
    .line 56
    const/4 v3, 0x1

    .line 57
    iput-boolean v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->isSelected:Z

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 65
    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_4

    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 93
    .line 94
    iput-boolean v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->isSelected:Z

    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 97
    .line 98
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 99
    .line 100
    .line 101
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 105
    .line 106
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->giftId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    if-nez p1, :cond_2

    .line 18
    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 21
    .line 22
    new-instance v1, Ll/z7s;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ll/z7s;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->n:Ll/lyj;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v1, v2, p1}, Ll/h5g0;->b(Ll/lyj;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ll/jyj;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->isSelected:Z

    .line 47
    .line 48
    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 52
    .line 53
    new-instance v0, Ll/a8s;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/a8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->n:Ll/lyj;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 69
    .line 70
    invoke-static {v0, v1, v2}, Ll/h5g0;->b(Ll/lyj;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ll/jyj;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/h5g0;->a(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz p2, :cond_4

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    iput-boolean v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->isSelected:Z

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 90
    .line 91
    .line 92
    :cond_4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 93
    .line 94
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setGiftList(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/h5g0;->d(Ljava/util/List;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x1

    .line 11
    const/4 v4, 0x0

    .line 12
    if-lt v0, v2, :cond_0

    .line 13
    .line 14
    move v2, v3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v2, v4

    .line 17
    :goto_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->f:Lv/VPager;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 40
    .line 41
    iput-boolean v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->isSelected:Z

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->m:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->p:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->n:Ll/lyj;

    .line 58
    .line 59
    invoke-static {p1}, Ll/h5g0;->c(Ljava/util/List;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Ll/lyj;->r(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public setStickerList(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->isSelected:Z

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->k:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->J(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method
