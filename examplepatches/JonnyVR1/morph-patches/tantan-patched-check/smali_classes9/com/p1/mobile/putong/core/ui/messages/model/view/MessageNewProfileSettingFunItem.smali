.class public Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;

.field public e:Lv/VText;

.field public f:Lv/VSwitchButton;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->M(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->L(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->click:Ll/y20;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic z(Ll/pf60;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t100;->a(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isTop()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/j49;->f()Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;->ba(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/16 p1, 0x64

    .line 48
    .line 49
    if-ne p0, p1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public final synthetic L(ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setCheckedImmediatelyNoEvent(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;->c:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$b;

    .line 7
    .line 8
    iget-object p1, p1, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz p4, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, -0x1

    .line 21
    :goto_0
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/core/api/g;->vo(Ljava/lang/String;I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p3, p1, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/r100;

    .line 30
    .line 31
    invoke-direct {p2}, Ll/r100;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance p3, Ll/s100;

    .line 35
    .line 36
    invoke-direct {p3, p0, p4}, Ll/s100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;Z)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->j:Ll/kcg0;

    .line 48
    .line 49
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->g:Lv/VLinear;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->h:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->i:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->e:Lv/VText;

    .line 24
    .line 25
    iget-object v3, p3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->des:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->e:Lv/VText;

    .line 31
    .line 32
    iget v3, p3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->iconId:I

    .line 33
    .line 34
    invoke-virtual {v0, v3, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/p100;

    .line 38
    .line 39
    invoke-direct {v0, p3, p1, p2}, Ll/p100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->top_chat:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 46
    .line 47
    if-ne p3, v0, :cond_0

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 54
    .line 55
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->I(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v0, v3}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 80
    .line 81
    new-instance v3, Ll/q100;

    .line 82
    .line 83
    invoke-direct {v3, p0, p1, p2}, Ll/q100;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v3}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->f:Lv/VSwitchButton;

    .line 90
    .line 91
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->g:Lv/VLinear;

    .line 95
    .line 96
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->clear_chat_history:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 100
    .line 101
    if-eq p3, p1, :cond_1

    .line 102
    .line 103
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->un_match:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 104
    .line 105
    if-eq p3, p1, :cond_1

    .line 106
    .line 107
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->add_black_list:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 108
    .line 109
    if-ne p3, p1, :cond_2

    .line 110
    .line 111
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->g:Lv/VLinear;

    .line 112
    .line 113
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->chat_fire:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    .line 117
    .line 118
    if-ne p3, p1, :cond_5

    .line 119
    .line 120
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 123
    .line 124
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_5

    .line 135
    .line 136
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 137
    .line 138
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_5

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->doubleDefault()Z

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    if-eqz p2, :cond_5

    .line 149
    .line 150
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->h:Lv/VText;

    .line 151
    .line 152
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 156
    .line 157
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 158
    .line 159
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    const-string p3, "\u5df2\u5f00\u542f"

    .line 164
    .line 165
    if-eqz p2, :cond_4

    .line 166
    .line 167
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 168
    .line 169
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 170
    .line 171
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->h:Lv/VText;

    .line 174
    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_3
    const-string p1, "\u5df2\u5173\u95ed"

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->h:Lv/VText;

    .line 188
    .line 189
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
