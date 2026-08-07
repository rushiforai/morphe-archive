.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;


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

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public P(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->icon:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->d:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->f:Lv/VText;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->e:Lv/VDraweeView;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 31
    .line 32
    const-string v2, "context_single_room"

    .line 33
    .line 34
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->c:Lv/VDraweeView;

    .line 38
    .line 39
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->isOwned:Z

    .line 40
    .line 41
    xor-int/lit8 p1, p1, 0x1

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/n3d0;->i(Lv/VDraweeView;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const-string v0, "#0DD9D9D9"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/mdc0;->A2:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VDraweeView;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->c:Lv/VDraweeView;

    .line 28
    .line 29
    sget v0, Ll/mdc0;->l2:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VText;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->d:Lv/VText;

    .line 38
    .line 39
    sget v0, Ll/mdc0;->L7:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->e:Lv/VDraweeView;

    .line 48
    .line 49
    sget v0, Ll/mdc0;->S7:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VText;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->f:Lv/VText;

    .line 58
    .line 59
    return-void
.end method
