.class public Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->f(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->g(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xrn;->a(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "e_intl_ilike_im_icebreak"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "text"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->c:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage$a;->a(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;->a2()Ll/gnn;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-interface {v0, v1, p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Ls(ILcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-ge v0, v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->b:Lv/VText;

    .line 47
    .line 48
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->z3:I

    .line 49
    .line 50
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->c:Lv/VText;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d:Lv/VText;

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->c:Lv/VText;

    .line 86
    .line 87
    new-instance v0, Ll/vrn;

    .line 88
    .line 89
    invoke-direct {v0, p0, p2}, Ll/vrn;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d:Lv/VText;

    .line 96
    .line 97
    new-instance v0, Ll/wrn;

    .line 98
    .line 99
    invoke-direct {v0, p0, p2}, Ll/wrn;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->c:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlItemBreakIceMessage;->d:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
