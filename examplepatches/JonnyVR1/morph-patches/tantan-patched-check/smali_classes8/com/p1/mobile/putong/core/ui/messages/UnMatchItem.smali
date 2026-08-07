.class public Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;

.field public b:Lv/VText;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ytj0;->a(Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3
    .param p3    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-lt v0, v2, :cond_2

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->K5:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->L5:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 54
    .line 55
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const/4 p1, 0x0

    .line 62
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 67
    .line 68
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget p1, p2, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 74
    .line 75
    const/4 v0, 0x7

    .line 76
    if-ne p1, v0, :cond_5

    .line 77
    .line 78
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 85
    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    const-string p0, ""

    .line 89
    .line 90
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 95
    .line 96
    const-string v0, "\n"

    .line 97
    .line 98
    const-string v1, "<br/>"

    .line 99
    .line 100
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->p(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 112
    .line 113
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    const/4 p2, 0x6

    .line 122
    const-string v0, "\u4fe1\u53f7\u5df2\u6d88\u5931 \u5bf9\u65b9\u5df2\u7ecf\u79bb\u5f00\u4e86\u5bf9\u8bdd"

    .line 123
    .line 124
    if-ne p1, p2, :cond_6

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    const/4 p2, 0x5

    .line 133
    if-ne p1, p2, :cond_7

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 136
    .line 137
    const-string p1, "\u53d1\u9001\u6d88\u606f\u6570\u5df2\u8fbe\u4e0a\u9650\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85\u5bf9\u65b9\u56de\u5e94\u54e6"

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_7
    const/16 p2, 0x8

    .line 144
    .line 145
    if-ne p1, p2, :cond_8

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 148
    .line 149
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->v3:I

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_9

    .line 160
    .line 161
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_9

    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 168
    .line 169
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_9

    .line 174
    .line 175
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    :cond_9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/UnMatchItem;->b:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget v1, Ll/g9c0;->i:I

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
