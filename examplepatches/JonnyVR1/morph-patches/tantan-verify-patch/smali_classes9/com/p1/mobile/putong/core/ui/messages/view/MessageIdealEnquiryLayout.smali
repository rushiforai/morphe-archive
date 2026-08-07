.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/data/IdealInfo;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 25
    .line 26
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

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g:Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 31
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 32
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

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

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 37
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->n(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->o(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->l(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j()V

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wdz;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final j()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    move v0, v1

    .line 11
    move v2, v0

    .line 12
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ge v0, v3, :cond_4

    .line 19
    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Lcom/p1/mobile/putong/data/IdealTag;

    .line 35
    .line 36
    iget-boolean v4, v4, Lcom/p1/mobile/putong/data/IdealTag;->hasChecked:Z

    .line 37
    .line 38
    if-eqz v4, :cond_0

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    :cond_0
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    sget v6, Ll/g9c0;->o:I

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    sget v6, Ll/g9c0;->e:I

    .line 60
    .line 61
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    :goto_1
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    sget v4, Ll/ibc0;->O2:I

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    sget v4, Ll/ibc0;->P2:I

    .line 74
    .line 75
    :goto_2
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    move v2, v1

    .line 82
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 83
    .line 84
    if-gtz v2, :cond_5

    .line 85
    .line 86
    const-string v3, "\u6dfb\u52a0\u81f3\u7406\u60f3\u578b"

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v4, "\u6dfb\u52a0\u81f3\u7406\u60f3\u578b ("

    .line 92
    .line 93
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v4, ")"

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    :goto_3
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 112
    .line 113
    if-lez v2, :cond_6

    .line 114
    .line 115
    const/4 v1, 0x1

    .line 116
    :cond_6
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 120
    .line 121
    if-lez v2, :cond_7

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget v3, Ll/g9c0;->o:I

    .line 128
    .line 129
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_4

    .line 134
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sget v3, Ll/g9c0;->a0:I

    .line 139
    .line 140
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 148
    .line 149
    if-lez v2, :cond_8

    .line 150
    .line 151
    sget v0, Ll/ibc0;->o:I

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :cond_8
    sget v0, Ll/ibc0;->d:I

    .line 155
    .line 156
    :goto_5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/sdz;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 12
    .line 13
    new-instance v1, Ll/tdz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/tdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "ideal_guide_conv_show_flag_"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "local_ideal_enquiry"

    .line 39
    .line 40
    filled-new-array {v0}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "ideal_guide_conv_show_flag_"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/data/IdealTag;

    .line 45
    .line 46
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/IdealTag;->hasChecked:Z

    .line 47
    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 62
    .line 63
    const-string v1, "\u6b63\u5728\u4fdd\u5b58"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->r(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic n(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, "\u5df2\u4fdd\u5b58"

    .line 8
    .line 9
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o8()V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "local_ideal_enquiry"

    .line 44
    .line 45
    filled-new-array {v0}, [Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic o(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->c:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->f:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->f:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p2}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :catch_0
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->f:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 46
    .line 47
    if-nez p2, :cond_2

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const/4 p2, 0x1

    .line 55
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->a:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 59
    .line 60
    const-string v0, "\u5982\u679c\u4f60\u4eec\u804a\u5f97\u4e0d\u9519..."

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->b:Lv/VText;

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "\u559c\u6b22"

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    const-string p1, "\u5979"

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    const-string p1, "\u4ed6"

    .line 84
    .line 85
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p1, "\u7684\u54ea\u4e9b\u7279\u8d28\uff1f\u4e3a\u4f60\u63a8\u8350\u7c7b\u4f3c\u7684\u4eba"

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->f:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 101
    .line 102
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->q(Lcom/p1/mobile/putong/core/data/IdealInfo;Ll/n100;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/data/IdealInfo;Ll/n100;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_3

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Lcom/p1/mobile/putong/data/IdealTag;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->k:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    check-cast p2, Lcom/p1/mobile/putong/data/IdealTag;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;-><init>(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    const/high16 v1, 0x41800000    # 16.0f

    .line 61
    .line 62
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/4 v3, 0x0

    .line 71
    invoke-virtual {v0, v2, v3, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 72
    .line 73
    .line 74
    const/16 v1, 0x11

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 77
    .line 78
    .line 79
    const/high16 v1, 0x41600000    # 14.0f

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdealTag;->name:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->c:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 96
    .line 97
    const/4 p2, 0x1

    .line 98
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->f:Z

    .line 99
    .line 100
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setOnChildClick(Lcom/p1/mobile/putong/core/ui/profile/views/FlowView$a;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->c:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_2

    .line 126
    .line 127
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Landroid/view/View;

    .line 132
    .line 133
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    const/high16 v2, 0x42300000    # 44.0f

    .line 136
    .line 137
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    const/4 v3, -0x2

    .line 142
    invoke-direct {v1, v3, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->j()V

    .line 150
    .line 151
    .line 152
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasIdealInfo()Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    const-string p1, "add_ideal_timing"

    .line 165
    .line 166
    const-string v0, "chat_a_lot"

    .line 167
    .line 168
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    xor-int/2addr p0, p2

    .line 173
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const-string p2, "is_first_add_ideal"

    .line 178
    .line 179
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    const-string p1, "e_save_ideal_type"

    .line 188
    .line 189
    const-string p2, "p_chat_view"

    .line 190
    .line 191
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 192
    .line 193
    .line 194
    :cond_3
    return-void
.end method

.method public final r(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i:Z

    .line 3
    .line 4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->hasIdealInfo()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v2, "add_ideal_timing"

    .line 17
    .line 18
    const-string v3, "chat_a_lot"

    .line 19
    .line 20
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    xor-int/2addr v0, v1

    .line 25
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "is_first_add_ideal"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v2, v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_save_ideal_type"

    .line 40
    .line 41
    const-string v2, "p_chat_view"

    .line 42
    .line 43
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->i()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Ll/dkb;->Da(Ljava/util/List;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/udz;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/udz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/vdz;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/vdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method
