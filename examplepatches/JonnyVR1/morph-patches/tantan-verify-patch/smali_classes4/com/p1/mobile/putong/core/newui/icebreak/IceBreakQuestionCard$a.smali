.class public Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Lv/VCheckBox;

.field public d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;


# direct methods
.method public constructor <init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->a:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->b:Lv/VText;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->b(Landroid/widget/CompoundButton;Z)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->a:Landroid/view/View;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->b:Lv/VText;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->content:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->a:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 27
    .line 28
    new-instance v0, Ll/ibm;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/ibm;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->a:Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
