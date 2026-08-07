.class public Ll/b9l;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroidx/appcompat/widget/AppCompatImageView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VDraweeView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->c:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lv/VText;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->d:Lv/VText;

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VButton;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->e:Lv/VButton;

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lv/VButton;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->f:Lv/VButton;

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lv/VText;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->g:Lv/VText;

    .line 61
    .line 62
    return-void
.end method
