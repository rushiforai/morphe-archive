.class public Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VCheckBox;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VCheckBox;

.field public l:Lv/VLinear;

.field public m:Lv/VText;

.field public n:Lv/VCheckBox;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->f(Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jbm;->a(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->getCheckedIds()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public getCheckedIds()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->o:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 23
    .line 24
    iget-object v2, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-object v0
.end method

.method public h(Ljava/util/List;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakQuestion;",
            ">;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->o:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->o:Ljava/util/List;

    .line 15
    .line 16
    if-le v1, v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 23
    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c(Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d()V

    .line 41
    .line 42
    .line 43
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->d:Lv/VText;

    .line 47
    .line 48
    new-instance v0, Ll/hbm;

    .line 49
    .line 50
    invoke-direct {v0, p0, p2}, Ll/hbm;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->b:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->d:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->f:Lv/VLinear;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->g:Lv/VText;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->h:Lv/VCheckBox;

    .line 33
    .line 34
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->i:Lv/VLinear;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->j:Lv/VText;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->k:Lv/VCheckBox;

    .line 44
    .line 45
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->l:Lv/VLinear;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->m:Lv/VText;

    .line 53
    .line 54
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->n:Lv/VCheckBox;

    .line 55
    .line 56
    invoke-direct {v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 57
    .line 58
    .line 59
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->o:Ljava/util/List;

    .line 68
    .line 69
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/cardview/widget/CardView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->e:Lv/VLinear;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->e:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-le p1, p2, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->e:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/16 p2, 0x30

    .line 33
    .line 34
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->e:Lv/VLinear;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
