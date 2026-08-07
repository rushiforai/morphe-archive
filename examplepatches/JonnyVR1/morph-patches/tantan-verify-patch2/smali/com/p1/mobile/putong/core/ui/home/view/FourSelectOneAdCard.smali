.class public Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public c:Lv/VText;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public i:[Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I2:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e4j;->a(Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(I)V
    .locals 5

    return-void

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->a:Lv/VDraweeView;

    .line 4
    .line 5
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJPQlZNTkVNRURFUzVIWlJUWUhaUUNYQlRJTTNBVTE0IiwidyI6NzE4LCJoIjoxMjAwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzIwNTc1OTQwNTA1MjMxNjB9.png"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lt p1, v1, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->avatarList:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->b:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->adTitle:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->c:Lv/VText;

    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->adContent:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->avatarList:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    const/4 v1, 0x4

    .line 81
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const/4 v1, 0x0

    .line 86
    :goto_0
    if-ge v1, v0, :cond_2

    .line 87
    .line 88
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->i:[Lv/VDraweeView;

    .line 91
    .line 92
    aget-object v3, v3, v1

    .line 93
    .line 94
    iget-object v4, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 95
    .line 96
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;->avatarList:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    add-int/lit8 v1, v1, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    new-array v0, v0, [Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->i:[Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->d:Lv/VDraweeView;

    .line 14
    .line 15
    aput-object v2, v0, v1

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->e:Lv/VDraweeView;

    .line 19
    .line 20
    aput-object v2, v0, v1

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->f:Lv/VDraweeView;

    .line 24
    .line 25
    aput-object v2, v0, v1

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/view/FourSelectOneAdCard;->g:Lv/VDraweeView;

    .line 29
    .line 30
    aput-object v2, v0, v1

    .line 31
    .line 32
    new-instance v0, Ll/c4j;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/c4j;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
