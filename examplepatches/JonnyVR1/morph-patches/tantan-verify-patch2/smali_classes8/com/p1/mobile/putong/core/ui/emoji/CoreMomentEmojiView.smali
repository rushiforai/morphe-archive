.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;,
        Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

.field public b:Landroid/widget/GridView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VImage;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/x20;

.field public j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

.field public k:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

.field public l:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;

.field public m:Z

.field public n:Ljava/lang/Runnable;

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 9
    .line 10
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

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m:Z

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m:Z

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->o(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->g:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m:Z

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->o:I

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m:Z

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->m()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->p()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->q()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->t(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method


# virtual methods
.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o0a;->a(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 16
    .line 17
    new-instance v0, Landroid/view/KeyEvent;

    .line 18
    .line 19
    const/16 v1, 0x43

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct {v0, v2, v1}, Landroid/view/KeyEvent;-><init>(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 26
    .line 27
    .line 28
    return v2
.end method

.method public final n(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x41200000    # 10.0f

    .line 8
    .line 9
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    neg-int p0, p0

    .line 14
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->i:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->i:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->l:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->l:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->g:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-long v1, v1

    .line 21
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n:Ljava/lang/Runnable;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final r(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->n(Landroid/view/View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    const/high16 p2, 0x41200000    # 10.0f

    .line 11
    .line 12
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance p2, Ll/j0a;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Ll/j0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p3, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :goto_0
    const/4 v0, 0x0

    .line 48
    const/4 v1, 0x1

    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    move v2, v1

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v2, v0

    .line 64
    :goto_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 65
    .line 66
    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_3

    .line 78
    .line 79
    move v0, v1

    .line 80
    :cond_3
    invoke-virtual {p3, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 81
    .line 82
    .line 83
    new-instance p2, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;

    .line 84
    .line 85
    invoke-direct {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->l:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$d;

    .line 89
    .line 90
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 91
    .line 92
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 93
    .line 94
    .line 95
    new-instance p2, Ll/k0a;

    .line 96
    .line 97
    invoke-direct {p2}, Ll/k0a;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$a;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/newui/view/MessageInputEditView;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->h:Ll/y20;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->i:Ll/x20;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->j:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->b:Landroid/widget/GridView;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p3, 0x2

    .line 15
    invoke-virtual {p1, p3}, Landroid/view/View;->setOverScrollMode(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->b:Landroid/widget/GridView;

    .line 19
    .line 20
    const/4 p3, 0x7

    .line 21
    invoke-virtual {p1, p3}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

    .line 25
    .line 26
    sget-object p4, Ll/oze;->d:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1, p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Ll/y20;Ljava/util/ArrayList;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->k:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->b:Landroid/widget/GridView;

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/bnl0;->y0()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    div-int/2addr p1, p3

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->o:I

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->f:Lv/VText;

    .line 46
    .line 47
    invoke-static {}, Ll/gra;->z()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    sget p2, Ll/dbc0;->lf:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    sget p2, Ll/dbc0;->kf:I

    .line 57
    .line 58
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->d:Lv/VImage;

    .line 62
    .line 63
    invoke-static {}, Ll/gra;->z()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    sget p2, Ll/dbc0;->sf:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    sget p2, Ll/dbc0;->rf:I

    .line 73
    .line 74
    :goto_1
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->d:Lv/VImage;

    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->e:Landroid/widget/FrameLayout;

    .line 80
    .line 81
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->f:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->r(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final t(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->vf:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const-string p1, "#212121"

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method
