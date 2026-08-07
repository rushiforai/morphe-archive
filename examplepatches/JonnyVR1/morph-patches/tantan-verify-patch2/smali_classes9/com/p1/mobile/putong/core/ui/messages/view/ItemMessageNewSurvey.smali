.class public Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Ll/gi40;

.field public h:Lv/VText;

.field public i:Ljava/lang/String;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/OptionsSecond;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/clz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/clz<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->Z(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/Survey;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/Survey;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Survey;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Survey;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->k0(Lcom/p1/mobile/putong/core/data/Survey;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/data/Survey;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic K(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/OptionsSecond;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x2

    .line 2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OptionsSecond;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h0(Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;Ll/pf60;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->a0(Lcom/p1/mobile/putong/data/Meta;)V

    return-void
.end method

.method public static synthetic N(ILl/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Message;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->l0(Lcom/p1/mobile/putong/core/data/Message;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->b0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->c0(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Survey;Lcom/p1/mobile/putong/core/data/Surveys;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->j0(Lcom/p1/mobile/putong/core/data/Survey;Lcom/p1/mobile/putong/core/data/Surveys;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zaq;->a(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gi40;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/gi40;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/yaq;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/yaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/jaq;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/jaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/kaq;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/kaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/core/data/Surveys;)V
    .locals 10

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "\u7f51\u7edc\u9519\u8bef\uff0c\u8be5\u6d88\u606f\u65e0\u6cd5\u5c55\u793a\uff0c\u8bf7\u9000\u51fa\u91cd\u8bd5\u3002"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object v0, Ll/uqb0;->s:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Surveys;->requiredVersion:Lcom/p1/mobile/putong/core/data/RequiredVersion;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RequiredVersion;->android:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-gez v0, :cond_1

    .line 25
    .line 26
    const-string p1, "\u8be5\u6d88\u606f\u65e0\u6cd5\u8bc6\u522b\uff0c \u8bf7\u66f4\u65b0\u81f3\u6700\u65b0\u7248\u672c\u3002"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e:Lv/VText;

    .line 33
    .line 34
    const v1, -0x3f3f40

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e:Lv/VText;

    .line 41
    .line 42
    sget v1, Ll/ibc0;->s4:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->c:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->a:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->f:Lv/VText;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/gi40;

    .line 65
    .line 66
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Surveys;->id:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Lcom/p1/mobile/putong/core/data/Questions;

    .line 75
    .line 76
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Questions;->id:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->k:Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {v0, v3, v4, v5}, Ll/gi40;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->b:Lv/VText;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Lcom/p1/mobile/putong/core/data/Questions;

    .line 94
    .line 95
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Questions;->title:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    new-instance v8, Ll/ei40;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/Questions;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Questions;->type:Ljava/lang/String;

    .line 111
    .line 112
    const-string v3, "multi_selection"

    .line 113
    .line 114
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    const v0, 0x7fffffff

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    move v0, v1

    .line 125
    :goto_0
    invoke-direct {v8, v0}, Ll/ei40;-><init>(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 135
    .line 136
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Selection;->options:Ljava/util/List;

    .line 141
    .line 142
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 143
    .line 144
    .line 145
    move-result-object v9

    .line 146
    move v0, v2

    .line 147
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-ge v0, v3, :cond_4

    .line 152
    .line 153
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    move-object v5, v3

    .line 158
    check-cast v5, Lcom/p1/mobile/putong/core/data/Options;

    .line 159
    .line 160
    const/high16 v3, 0x41900000    # 18.0f

    .line 161
    .line 162
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    const/4 v7, 0x1

    .line 167
    move-object v4, p0

    .line 168
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->Y(Lcom/p1/mobile/putong/core/data/Options;IILl/ei40;Lrx/subjects/b;)Landroid/widget/LinearLayout;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    sget v3, Ll/qa00;->k:I

    .line 173
    .line 174
    sget v6, Ll/qa00;->h:I

    .line 175
    .line 176
    invoke-virtual {p0, v2, v3, v2, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 177
    .line 178
    .line 179
    new-instance v3, Ll/vaq;

    .line 180
    .line 181
    invoke-direct {v3, v4, v9, v5}, Ll/vaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    .line 186
    .line 187
    iget-object v3, v4, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->c:Landroid/widget/LinearLayout;

    .line 188
    .line 189
    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 190
    .line 191
    .line 192
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    sub-int/2addr p0, v1

    .line 197
    if-ge v0, p0, :cond_3

    .line 198
    .line 199
    iget-object p0, v4, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->c:Landroid/widget/LinearLayout;

    .line 200
    .line 201
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->T()Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 209
    .line 210
    move-object p0, v4

    .line 211
    goto :goto_1

    .line 212
    :cond_4
    move-object v4, p0

    .line 213
    iget-object p0, v4, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e:Lv/VText;

    .line 214
    .line 215
    new-instance p1, Ll/waq;

    .line 216
    .line 217
    invoke-direct {p1, v4}, Ll/waq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 218
    .line 219
    .line 220
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public final T()Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final V(Lcom/p1/mobile/putong/core/data/QuestionsSecond;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/QuestionsSecond;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/gi40;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuestionsSecond;->content:Lcom/p1/mobile/putong/core/data/ContentSecond;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ContentSecond;->selection:Lcom/p1/mobile/putong/core/data/SelectionSecond;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SelectionSecond;->options:Ljava/util/List;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->j:Ljava/util/List;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    if-ne v1, v0, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object v4, p0

    .line 31
    goto :goto_3

    .line 32
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->j:Ljava/util/List;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/QuestionsSecond;->title:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->X(Ljava/lang/String;)Lv/VText;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    new-instance v8, Ll/ei40;

    .line 51
    .line 52
    const-string v1, "multi_selection"

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuestionsSecond;->type:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    const p1, 0x7fffffff

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    move p1, v2

    .line 67
    :goto_1
    invoke-direct {v8, p1}, Ll/ei40;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    const/4 p1, 0x0

    .line 75
    move v1, p1

    .line 76
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-ge v1, v3, :cond_0

    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Lcom/p1/mobile/putong/core/data/OptionsSecond;

    .line 87
    .line 88
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/OptionsSecond;->mapToOptions()Lcom/p1/mobile/putong/core/data/Options;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    const/high16 v4, 0x41900000    # 18.0f

    .line 93
    .line 94
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    const/4 v7, 0x2

    .line 99
    move-object v4, p0

    .line 100
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->Y(Lcom/p1/mobile/putong/core/data/Options;IILl/ei40;Lrx/subjects/b;)Landroid/widget/LinearLayout;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget v5, Ll/qa00;->j:I

    .line 105
    .line 106
    invoke-virtual {p0, p1, v5, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 107
    .line 108
    .line 109
    new-instance v5, Ll/naq;

    .line 110
    .line 111
    invoke-direct {v5, v9, v3}, Ll/naq;-><init>(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/OptionsSecond;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    iget-object v3, v4, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 118
    .line 119
    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    add-int/lit8 v1, v1, 0x1

    .line 123
    .line 124
    move-object p0, v4

    .line 125
    goto :goto_2

    .line 126
    :goto_3
    iget-object p0, v4, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final W(Ljava/lang/String;)Lv/VText;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 15
    .line 16
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    const/4 v2, -0x2

    .line 20
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 29
    .line 30
    sget v1, Ll/qa00;->h:I

    .line 31
    .line 32
    sget v2, Ll/qa00;->g:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 38
    .line 39
    const-string v1, "#ededed"

    .line 40
    .line 41
    const/4 v2, 0x4

    .line 42
    invoke-static {v1, v2}, Ll/gc2;->b(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 55
    .line 56
    const/high16 v1, 0x33000000

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 62
    .line 63
    new-instance v1, Ll/oaq;

    .line 64
    .line 65
    invoke-direct {v1, p0, p1}, Ll/oaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 72
    .line 73
    return-object p0
.end method

.method public final X(Ljava/lang/String;)Lv/VText;
    .locals 2

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x2

    .line 13
    invoke-direct {p0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    sget v1, Ll/qa00;->j:I

    .line 17
    .line 18
    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    const p0, -0xddddde

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public final Y(Lcom/p1/mobile/putong/core/data/Options;IILl/ei40;Lrx/subjects/b;)Landroid/widget/LinearLayout;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Options;",
            "II",
            "Ll/ei40;",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;)",
            "Landroid/widget/LinearLayout;"
        }
    .end annotation

    .line 1
    new-instance v7, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 15
    .line 16
    const/4 v1, -0x2

    .line 17
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 18
    .line 19
    .line 20
    const/16 v4, 0x11

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    if-ne p3, v5, :cond_0

    .line 24
    .line 25
    move v6, v4

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v6, 0x3

    .line 28
    :goto_0
    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 29
    .line 30
    invoke-virtual {v7, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-direct {v0, v6}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 43
    .line 44
    invoke-direct {v6, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    sget v8, Ll/qa00;->f:I

    .line 48
    .line 49
    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 50
    .line 51
    iput v4, v6, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 52
    .line 53
    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 57
    .line 58
    invoke-direct {v6, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 59
    .line 60
    .line 61
    iput v4, v6, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 62
    .line 63
    new-instance v1, Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-direct {v1, v4}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    const/high16 v4, 0x41600000    # 14.0f

    .line 73
    .line 74
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 75
    .line 76
    .line 77
    if-ne p3, v5, :cond_1

    .line 78
    .line 79
    const/high16 v4, 0x4c000000    # 3.3554432E7f

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    const v4, -0xddddde

    .line 83
    .line 84
    .line 85
    :goto_1
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Options;->text:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 103
    .line 104
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Options;->icon:Lcom/p1/mobile/putong/core/data/OptionsIcon;

    .line 105
    .line 106
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/OptionsIcon;->nonSelected:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v4, v0, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    new-instance v4, Ll/laq;

    .line 112
    .line 113
    invoke-direct {v4, p3}, Ll/laq;-><init>(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p5, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    move-object v5, v0

    .line 121
    new-instance v0, Ll/maq;

    .line 122
    .line 123
    move-object v2, p1

    .line 124
    move v3, p3

    .line 125
    move-object v4, p4

    .line 126
    move-object v6, v1

    .line 127
    move-object v1, p0

    .line 128
    invoke-direct/range {v0 .. v6}, Ll/maq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v8, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    return-object v7
.end method

.method public final synthetic Z(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->ne(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/Meta;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v0, 0xc7

    .line 6
    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x12c

    .line 10
    .line 11
    if-ge p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->i:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->m:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Ll/clz;->J2(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->m:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic b0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "\u7f51\u7edc\u9519\u8bef\uff0c\u8be5\u6d88\u606f\u65e0\u6cd5\u5c55\u793a\uff0c\u8bf7\u9000\u51fa\u91cd\u8bd5\u3002"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c0(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p3

    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p1, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Options;->questions:Ljava/util/List;

    .line 16
    .line 17
    const/4 p3, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Options;->questions:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionsSecond;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->V(Lcom/p1/mobile/putong/core/data/QuestionsSecond;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object p1, p2

    .line 11
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 15
    .line 16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/high16 v0, 0x33000000

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const v0, -0xddddde

    .line 26
    .line 27
    .line 28
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/gi40;->i(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic g0(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p2}, Ll/mzl;->x0()Ll/hi40;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/hi40;->i0()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    new-instance v0, Ll/paq;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Ll/paq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-interface {p2}, Ll/mzl;->x0()Ll/hi40;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Ll/j3z;->g0()Ll/iam;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Ll/ki40;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ll/d3z;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p2, v1, v2}, Ll/ki40;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-gez v2, :cond_0

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBarWrapper()Landroid/widget/FrameLayout;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const/4 v1, 0x0

    .line 121
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 122
    .line 123
    .line 124
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_1

    .line 139
    .line 140
    const-string p1, ""

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->h:Lv/VText;

    .line 144
    .line 145
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    :goto_0
    invoke-virtual {p2, p1}, Ll/ki40;->i(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/clz;->D6()V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o0(Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/core/data/Survey;Lcom/p1/mobile/putong/core/data/Surveys;)Ll/bkj0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->x0()Ll/hi40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/hi40;->h0()Ll/fi40;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Survey;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, p2}, Ll/fi40;->c(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Surveys;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/bkj0;

    .line 21
    .line 22
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-direct {p0, v0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/core/data/Survey;)Lrx/c;
    .locals 3

    .line 1
    const-string v0, "submitted"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Survey;->status:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ll/bkj0;

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {p0, v0, p1, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ll/mzl;->x0()Ll/hi40;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/hi40;->h0()Ll/fi40;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Survey;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/fi40;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Surveys;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ll/bkj0;

    .line 47
    .line 48
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p0}, Ll/mzl;->x0()Ll/hi40;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/hi40;->h0()Ll/fi40;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Survey;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Ll/fi40;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Surveys;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {v0, v1, p1, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Survey;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->pg(Ljava/lang/String;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/xaq;

    .line 89
    .line 90
    invoke-direct {v1, p0, p1}, Ll/xaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Survey;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/data/Message;Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Survey;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Survey;->submittedTips:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->m:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p2, Lcom/p1/mobile/putong/core/data/Survey;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Survey;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->i:Ljava/lang/String;

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->S(Lcom/p1/mobile/putong/core/data/Surveys;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string p1, "\u7f51\u7edc\u9519\u8bef\uff0c\u8be5\u6d88\u606f\u65e0\u6cd5\u5c55\u793a\uff0c\u8bf7\u9000\u51fa\u91cd\u8bd5\u3002"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->q0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o0(Lcom/p1/mobile/putong/core/data/Options;ILl/ei40;Lv/VDraweeView;Lv/VText;Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Options;",
            "I",
            "Ll/ei40;",
            "Lv/VDraweeView;",
            "Lv/VText;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->e:Lv/VText;

    .line 8
    .line 9
    sget v2, Ll/ibc0;->r4:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ll/ei40;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget-object p3, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p3, Ljava/lang/String;

    .line 23
    .line 24
    iget-object p6, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p3, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_0

    .line 31
    .line 32
    iget-object p6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p6, v0}, Ll/gi40;->b(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p6

    .line 40
    if-eqz p6, :cond_0

    .line 41
    .line 42
    goto/16 :goto_5

    .line 43
    .line 44
    :cond_0
    sget-object p6, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Options;->icon:Lcom/p1/mobile/putong/core/data/OptionsIcon;

    .line 47
    .line 48
    if-eqz p3, :cond_1

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/OptionsIcon;->selected:Ljava/lang/String;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/OptionsIcon;->nonSelected:Ljava/lang/String;

    .line 54
    .line 55
    :goto_0
    invoke-virtual {p6, p4, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 59
    .line 60
    const/4 p4, 0x1

    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    iget-object p6, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Options;->text:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p4, p6, p1}, Ll/gi40;->g(ILjava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, p4, p1}, Ll/gi40;->h(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :goto_1
    if-ne p2, p4, :cond_8

    .line 77
    .line 78
    if-eqz p3, :cond_3

    .line 79
    .line 80
    const p0, -0xddddde

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_3
    const/high16 p0, 0x4c000000    # 3.3554432E7f

    .line 85
    .line 86
    :goto_2
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iget-object p2, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p2, Ljava/lang/String;

    .line 93
    .line 94
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_8

    .line 101
    .line 102
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p3, p2}, Ll/ei40;->b(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->g:Ll/gi40;

    .line 109
    .line 110
    const/4 p5, 0x2

    .line 111
    if-nez p2, :cond_5

    .line 112
    .line 113
    iget-object p6, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Options;->text:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p3, p5, p6, v0}, Ll/gi40;->g(ILjava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_5
    iget-object p6, p1, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p3, p5, p6}, Ll/gi40;->h(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_3
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object p5, p1, Lcom/p1/mobile/putong/core/data/Options;->icon:Lcom/p1/mobile/putong/core/data/OptionsIcon;

    .line 129
    .line 130
    if-nez p2, :cond_6

    .line 131
    .line 132
    iget-object p2, p5, Lcom/p1/mobile/putong/core/data/OptionsIcon;->selected:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_6
    iget-object p2, p5, Lcom/p1/mobile/putong/core/data/OptionsIcon;->nonSelected:Ljava/lang/String;

    .line 136
    .line 137
    :goto_4
    invoke-virtual {p3, p4, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/data/Options;->requireInput:Z

    .line 141
    .line 142
    if-eqz p2, :cond_8

    .line 143
    .line 144
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Options;->placeholder:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->W(Ljava/lang/String;)Lv/VText;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    sget p3, Ll/qa00;->h:I

    .line 151
    .line 152
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 156
    .line 157
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Options;->placeholder:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->W(Ljava/lang/String;)Lv/VText;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 168
    .line 169
    if-ne p2, v1, :cond_7

    .line 170
    .line 171
    invoke-virtual {p3}, Landroid/view/View;->getPaddingLeft()I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 176
    .line 177
    invoke-virtual {p4}, Landroid/view/View;->getPaddingTop()I

    .line 178
    .line 179
    .line 180
    move-result p4

    .line 181
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 182
    .line 183
    invoke-virtual {p5}, Landroid/view/View;->getPaddingRight()I

    .line 184
    .line 185
    .line 186
    move-result p5

    .line 187
    sget p6, Ll/qa00;->i:I

    .line 188
    .line 189
    invoke-virtual {p3, p2, p4, p5, p6}, Landroid/view/View;->setPadding(IIII)V

    .line 190
    .line 191
    .line 192
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Options;->placeholder:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->W(Ljava/lang/String;)Lv/VText;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Options;->placeholder:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->W(Ljava/lang/String;)Lv/VText;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 214
    .line 215
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 220
    .line 221
    invoke-virtual {p3}, Landroid/view/View;->getPaddingTop()I

    .line 222
    .line 223
    .line 224
    move-result p3

    .line 225
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    sget p4, Ll/qa00;->k:I

    .line 232
    .line 233
    invoke-virtual {p1, p2, p3, p0, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 234
    .line 235
    .line 236
    :cond_8
    :goto_5
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/data/Message;Ll/clz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ll/clz<",
            "**>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->j:Ljava/util/List;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->o:Ll/clz;

    .line 16
    .line 17
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->k:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->l:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->d:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    new-instance v0, Ll/iaq;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/iaq;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    new-instance v0, Ll/qaq;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/qaq;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v0, Ll/raq;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/raq;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    new-instance v0, Ll/saq;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/saq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->n:Lrx/subjects/b;

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    new-instance v0, Ll/taq;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1}, Ll/taq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 80
    .line 81
    .line 82
    new-instance p1, Ll/uaq;

    .line 83
    .line 84
    invoke-direct {p1, p0}, Ll/uaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final q0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->f:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->f:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
