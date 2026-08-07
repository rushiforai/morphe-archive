.class public Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/sum;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, p2, v0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ud2;->e(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private setImageIcon(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    invoke-virtual {v0, p0, p1, v1, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 43
    .line 44
    if-lez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 52
    .line 53
    iget p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->a:Lv/VText;

    .line 2
    .line 3
    const/4 p4, 0x0

    .line 4
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->d:Lv/VText;

    .line 13
    .line 14
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->e:Lv/VText;

    .line 18
    .line 19
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->f:Lv/VText;

    .line 23
    .line 24
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->c:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    const/4 p4, 0x1

    .line 39
    if-eqz p3, :cond_0

    .line 40
    .line 41
    iget p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 42
    .line 43
    if-lez p3, :cond_1

    .line 44
    .line 45
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_1

    .line 52
    .line 53
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-nez p3, :cond_1

    .line 60
    .line 61
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->setImageIcon(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 62
    .line 63
    .line 64
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->e:Lv/VText;

    .line 65
    .line 66
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->e:Lv/VText;

    .line 70
    .line 71
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 72
    .line 73
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->e:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->f:Lv/VText;

    .line 86
    .line 87
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->f:Lv/VText;

    .line 91
    .line 92
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 93
    .line 94
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->c:Landroid/widget/LinearLayout;

    .line 98
    .line 99
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_2

    .line 110
    .line 111
    iget p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 112
    .line 113
    if-lez p3, :cond_3

    .line 114
    .line 115
    :cond_2
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 116
    .line 117
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    if-nez p3, :cond_3

    .line 122
    .line 123
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->setImageIcon(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 124
    .line 125
    .line 126
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->d:Lv/VText;

    .line 127
    .line 128
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->d:Lv/VText;

    .line 132
    .line 133
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 134
    .line 135
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->d:Lv/VText;

    .line 139
    .line 140
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 145
    .line 146
    .line 147
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->c:Landroid/widget/LinearLayout;

    .line 148
    .line 149
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_3
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 154
    .line 155
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-nez p3, :cond_4

    .line 160
    .line 161
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->a:Lv/VText;

    .line 162
    .line 163
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->a:Lv/VText;

    .line 167
    .line 168
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 169
    .line 170
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    .line 172
    .line 173
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->a:Lv/VText;

    .line 174
    .line 175
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 176
    .line 177
    .line 178
    move-result-object p3

    .line 179
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 180
    .line 181
    .line 182
    :cond_4
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p3

    .line 188
    if-nez p3, :cond_5

    .line 189
    .line 190
    new-instance p3, Ll/a600;

    .line 191
    .line 192
    invoke-direct {p3, p1, p2}, Ll/a600;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 193
    .line 194
    .line 195
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 196
    .line 197
    .line 198
    :cond_5
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b600;->a(Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout2;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
