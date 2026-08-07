.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VButton;

.field public l:Landroid/os/CountDownTimer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p2, "suggest_empty"

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->l:Landroid/os/CountDownTimer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->l:Landroid/os/CountDownTimer;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/CountDownTimer;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/kec0;->P6:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/adc0;->je:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lv/VText;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b:Lv/VText;

    .line 20
    .line 21
    sget p1, Ll/adc0;->ne:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lv/VText;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c:Lv/VText;

    .line 30
    .line 31
    sget p1, Ll/adc0;->be:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lv/VLinear;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->d:Lv/VLinear;

    .line 40
    .line 41
    sget p1, Ll/adc0;->u5:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lv/VText;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->e:Lv/VText;

    .line 50
    .line 51
    sget p1, Ll/adc0;->v5:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lv/VText;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->f:Lv/VText;

    .line 60
    .line 61
    sget p1, Ll/adc0;->r8:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lv/VText;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->g:Lv/VText;

    .line 70
    .line 71
    sget p1, Ll/adc0;->s8:I

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lv/VText;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->h:Lv/VText;

    .line 80
    .line 81
    sget p1, Ll/adc0;->Ub:I

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lv/VText;

    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->i:Lv/VText;

    .line 90
    .line 91
    sget p1, Ll/adc0;->Vb:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lv/VText;

    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->j:Lv/VText;

    .line 100
    .line 101
    sget p1, Ll/adc0;->Ad:I

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lv/VButton;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->k:Lv/VButton;

    .line 110
    .line 111
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;

    .line 112
    .line 113
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "suggest_end"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b:Lv/VText;

    .line 13
    .line 14
    const-string v0, "\u4eca\u65e5\u63a8\u8350\u5df2\u7528\u5b8c"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c:Lv/VText;

    .line 20
    .line 21
    const-string v0, "\u6bcf\u592912\u70b9\uff0c\u4e3a\u4f60\u63a8\u8350\u65b0\u670b\u53cb"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c:Lv/VText;

    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->d:Lv/VLinear;

    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->k:Lv/VButton;

    .line 37
    .line 38
    const-string v0, "\u5207\u6362\u5230\u604b\u7231\u6a21\u5f0f"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a()V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    invoke-static {}, Ll/yab;->P()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    sub-long v6, v2, v0

    .line 55
    .line 56
    new-instance v4, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;

    .line 57
    .line 58
    const-wide/16 v8, 0x3e8

    .line 59
    .line 60
    move-object v5, p0

    .line 61
    invoke-direct/range {v4 .. v9}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;JJ)V

    .line 62
    .line 63
    .line 64
    iput-object v4, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->l:Landroid/os/CountDownTimer;

    .line 65
    .line 66
    invoke-virtual {v4}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    move-object v5, p0

    .line 71
    const-string p0, "suggest_empty"

    .line 72
    .line 73
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_1

    .line 78
    .line 79
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b:Lv/VText;

    .line 80
    .line 81
    const-string p1, "\u6682\u65e0\u7b26\u5408\u6761\u4ef6\u7684\u7406\u60f3\u4f34\u4fa3"

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c:Lv/VText;

    .line 87
    .line 88
    const-string p1, "\u5efa\u8bae\u628a\u671f\u671b\u503c\u8c03\u4f4e\u4e00\u4e9b"

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b:Lv/VText;

    .line 94
    .line 95
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->c:Lv/VText;

    .line 99
    .line 100
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->d:Lv/VLinear;

    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object p0, v5, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->k:Lv/VButton;

    .line 110
    .line 111
    const-string p1, "\u4fee\u6539\u6761\u4ef6"

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a()V

    .line 117
    .line 118
    .line 119
    :cond_1
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
