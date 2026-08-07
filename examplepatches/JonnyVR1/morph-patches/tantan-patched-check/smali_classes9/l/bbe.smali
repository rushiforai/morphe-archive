.class public Ll/bbe;
.super Ll/dh2;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Landroid/widget/RelativeLayout;",
        ">;",
        "Ll/arl;"
    }
.end annotation


# instance fields
.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/TextView;

.field public h:Ll/p9s;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Ll/bbe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bbe;->O()V

    return-void
.end method

.method public static synthetic K(Ll/bbe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bbe;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/bbe;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bbe;->N(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V

    return-void
.end method

.method private synthetic O()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/bbe;->S(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bbe;->h:Ll/p9s;

    .line 2
    .line 3
    new-instance v0, Ll/abe;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/abe;-><init>(Ll/bbe;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/p9s;->b(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public M()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbe;->h:Ll/p9s;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getDragonSchema()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/p9s;->c(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q(Landroid/widget/RelativeLayout;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bbe;->d:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    sget v0, Ll/mdc0;->N6:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Ll/bbe;->e:Lv/VText;

    .line 15
    .line 16
    sget v0, Ll/mdc0;->V:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VText;

    .line 23
    .line 24
    iput-object v0, p0, Ll/bbe;->f:Lv/VText;

    .line 25
    .line 26
    sget v0, Ll/mdc0;->D0:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object p1, p0, Ll/bbe;->g:Landroid/widget/TextView;

    .line 35
    .line 36
    iget-object p1, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Ll/dh2;->b:Ll/yql;

    .line 47
    .line 48
    iget-object v0, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Landroid/text/SpannableStringBuilder;

    .line 58
    .line 59
    invoke-virtual {p0, p1, v0, v1}, Ll/bbe;->R(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public R(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-interface {p1}, Ll/yql;->getLiveDragonListViewHelper()Ll/p9s;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/bbe;->h:Ll/p9s;

    .line 9
    .line 10
    iget-object v0, p0, Ll/bbe;->e:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getDragonTitle()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/bbe;->h:Ll/p9s;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/p9s;->d()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v0}, Ll/bbe;->S(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/bbe;->d:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    new-instance v2, Ll/yae;

    .line 31
    .line 32
    invoke-direct {v2, p0, p2}, Ll/yae;-><init>(Ll/bbe;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/bbe;->f:Lv/VText;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Ll/zae;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/zae;-><init>(Ll/bbe;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 v0, 0x0

    .line 52
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object p2, p0, Ll/bbe;->g:Landroid/widget/TextView;

    .line 56
    .line 57
    sget v0, Ll/qa00;->o:I

    .line 58
    .line 59
    invoke-static {p3, p2, p1, v0}, Ll/dy4;->y(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/bbe;->g:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final S(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bbe;->f:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u5173\u95ed\u63a8\u9001"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/bbe;->f:Lv/VText;

    .line 11
    .line 12
    sget v0, Ll/obc0;->f1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/bbe;->f:Lv/VText;

    .line 18
    .line 19
    const-string p1, "#FFFFFF"

    .line 20
    .line 21
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p1, "\u63a8\u9001\u5df2\u5173\u95ed"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/bbe;->f:Lv/VText;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/bbe;->f:Lv/VText;

    .line 41
    .line 42
    const-string p1, "#66FFFFFF"

    .line 43
    .line 44
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->R:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bbe;->Q(Landroid/widget/RelativeLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
