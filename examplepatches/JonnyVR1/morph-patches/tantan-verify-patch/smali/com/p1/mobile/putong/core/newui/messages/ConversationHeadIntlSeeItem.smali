.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem$a;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText_AutoFit;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->a:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->d:Lv/VText;

    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->SEE:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 7
    .line 8
    invoke-static {p0, p1, v0}, Ll/bhe0;->d(Landroid/content/Context;ZLcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->K(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ljava/lang/Boolean;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText_AutoFit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->b:Lv/VText_AutoFit;

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 4

    return-void

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 9
    .line 10
    if-lez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->c:Lv/VText;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->b:Lv/VText_AutoFit;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->c:Lv/VText;

    .line 25
    .line 26
    iget v1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 27
    .line 28
    const/16 v2, 0x63

    .line 29
    .line 30
    if-le v1, v2, :cond_1

    .line 31
    .line 32
    const-string v1, "99+"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v2, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 40
    .line 41
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v3, "+%d"

    .line 50
    .line 51
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->d:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->F()Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kn:I

    .line 65
    .line 66
    iget v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 67
    .line 68
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->M(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->d:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->F()Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Zs:I

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    :goto_1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->a:Lv/VDraweeView;

    .line 109
    .line 110
    if-eqz v0, :cond_3

    .line 111
    .line 112
    invoke-static {p1}, Ll/bhe0;->b(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {}, Ll/bhe0;->a()Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-static {p0, p1, v0}, Ll/vnb;->w1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_3
    invoke-static {p1}, Ll/bhe0;->b(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-static {}, Ll/bhe0;->a()Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {p0, p1, v0}, Ll/vnb;->v1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;)V
    .locals 4

    return-void

    .line 1
    new-instance v0, Ll/k86;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->F()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->S6()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Ll/l86;

    .line 28
    .line 29
    invoke-direct {v3}, Ll/l86;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Ll/m86;

    .line 41
    .line 42
    invoke-direct {v3}, Ll/m86;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/n86;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/n86;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->d:Lv/VText;

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final M(I)V
    .locals 3

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->b:Lv/VText_AutoFit;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->b:Lv/VText_AutoFit;

    .line 14
    .line 15
    if-le p1, v2, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->b:Lv/VText_AutoFit;

    .line 25
    .line 26
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->E(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
