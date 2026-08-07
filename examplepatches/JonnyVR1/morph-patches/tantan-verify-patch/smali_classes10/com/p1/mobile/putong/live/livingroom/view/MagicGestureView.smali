.class public Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Lv/VLinear;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;->hasDownloaded:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bsw;->a(Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Ljava/lang/String;Ljava/util/List;Ll/z20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->e:Lv/VLinear;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->dynamicEffect:Ljava/util/List;

    .line 28
    .line 29
    new-instance v1, Ll/asw;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/asw;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/yec0;->I3:I

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;

    .line 60
    .line 61
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;->a:Lv/VDraweeView;

    .line 62
    .line 63
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->gesture:Ljava/lang/String;

    .line 64
    .line 65
    const-string v4, "context_livingAct"

    .line 66
    .line 67
    invoke-static {v4, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;->b:Lv/VText;

    .line 71
    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    const/high16 p2, 0x41200000    # 10.0f

    .line 78
    .line 79
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;->c:Lv/VRecyclerView;

    .line 84
    .line 85
    new-instance v3, Ll/guf0;

    .line 86
    .line 87
    invoke-direct {v3, p2, p2}, Ll/guf0;-><init>(II)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView;->c:Lv/VRecyclerView;

    .line 94
    .line 95
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-direct {v3, v0, v4, p3}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureItemView$a;-><init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Ll/z20;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 105
    .line 106
    .line 107
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 108
    .line 109
    sget v2, Ll/bnl0;->f:I

    .line 110
    .line 111
    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 112
    .line 113
    .line 114
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 115
    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->e:Lv/VLinear;

    .line 117
    .line 118
    invoke-virtual {p2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/MagicGestureView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
