.class public Lcom/p1/mobile/putong/core/ui/profile/AnswerView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VImage;


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
    invoke-static {p0, p1}, Ll/ft0;->a(Lcom/p1/mobile/putong/core/ui/profile/AnswerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Answer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->c:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->a:Lv/VText;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    const-string p1, ""

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public c(ZZZ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    sget p1, Ll/qa00;->o:I

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    const/high16 p1, 0x41800000    # 16.0f

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/high16 p1, 0x41c00000    # 24.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    if-eqz p2, :cond_1

    .line 30
    .line 31
    const/high16 p1, 0x41400000    # 12.0f

    .line 32
    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/high16 p1, 0x41000000    # 8.0f

    .line 42
    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->d:Lv/VImage;

    .line 51
    .line 52
    const/4 p2, 0x1

    .line 53
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-static {p0, p1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    sget p1, Ll/qa00;->o:I

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    if-eqz p3, :cond_3

    .line 67
    .line 68
    sget p3, Ll/qa00;->m:I

    .line 69
    .line 70
    invoke-static {p0, p3}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_3
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    :goto_2
    if-eqz p2, :cond_4

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    sget p1, Ll/qa00;->j:I

    .line 84
    .line 85
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method
