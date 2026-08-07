.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VMarqueeText;

.field public d:Ll/y9o;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x9o;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/y9o;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->d:Ll/y9o;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 10
    .line 11
    iget-object v1, p1, Ll/y9o;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Ll/y9o;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->b:Lv/VDraweeView;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v2, Ll/obc0;->l2:I

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p1, Ll/y9o;->a:Ljava/lang/String;

    .line 41
    .line 42
    sget v2, Ll/qa00;->n:I

    .line 43
    .line 44
    const-string v3, "context_livingAct"

    .line 45
    .line 46
    invoke-static {v3, v1, v0, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 52
    .line 53
    .line 54
    iget-boolean p1, p1, Ll/y9o;->d:Z

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->e()V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public c(Ll/y9o;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->d:Ll/y9o;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 10
    .line 11
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 38
    .line 39
    iget-object p1, p1, Ll/y9o;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->w7:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->b:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v1, Ll/obc0;->l2:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->c:Lv/VMarqueeText;

    .line 2
    .line 3
    const/high16 v0, 0x41200000    # 10.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getEntryModel()Ll/y9o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->d:Ll/y9o;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
