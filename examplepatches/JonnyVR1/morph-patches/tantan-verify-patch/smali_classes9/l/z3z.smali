.class public Ll/z3z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/y3z;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public b:Lv/VSwitchButton;

.field public c:Lv/VText;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public f:Lv/VSwitchButton;

.field public g:Lv/VText;

.field public h:Ll/y3z;

.field public final i:Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

.field public j:Z

.field public k:Z

.field public l:I

.field public m:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/z3z;->j:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/z3z;->k:Z

    .line 8
    .line 9
    iput v0, p0, Ll/z3z;->l:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/z3z;->i:Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic a(Ll/z3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z3z;->i:Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/z3z;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z3z;->k:Z

    return p0
.end method

.method public static bridge synthetic c(Ll/z3z;)Ll/y3z;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z3z;->h:Ll/y3z;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/z3z;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z3z;->j:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/z3z;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z3z;->k:Z

    return-void
.end method

.method public static bridge synthetic f(Ll/z3z;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/z3z;->j:Z

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z3z;->i:Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z3z;->i:Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a4z;->b(Ll/z3z;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/y3z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z3z;->j(Ll/y3z;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z3z;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/y3z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z3z;->h:Ll/y3z;

    .line 2
    .line 3
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/z3z;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 32
    .line 33
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 34
    .line 35
    iput-boolean v3, p0, Ll/z3z;->j:Z

    .line 36
    .line 37
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 38
    .line 39
    iput-boolean v3, p0, Ll/z3z;->k:Z

    .line 40
    .line 41
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 42
    .line 43
    iput v0, p0, Ll/z3z;->l:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iput-boolean v2, p0, Ll/z3z;->j:Z

    .line 47
    .line 48
    iput-boolean v1, p0, Ll/z3z;->k:Z

    .line 49
    .line 50
    :goto_0
    iget-object v0, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 51
    .line 52
    new-instance v3, Ll/z3z$a;

    .line 53
    .line 54
    invoke-direct {v3, p0, p1}, Ll/z3z$a;-><init>(Ll/z3z;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v3}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 61
    .line 62
    new-instance v3, Ll/z3z$b;

    .line 63
    .line 64
    invoke-direct {v3, p0, p1}, Ll/z3z$b;-><init>(Ll/z3z;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v3}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 68
    .line 69
    .line 70
    iget-boolean p1, p0, Ll/z3z;->j:Z

    .line 71
    .line 72
    iget-object v0, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 73
    .line 74
    const/4 v3, 0x3

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/z3z;->d:Landroid/widget/FrameLayout;

    .line 96
    .line 97
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-boolean p1, p0, Ll/z3z;->k:Z

    .line 101
    .line 102
    const-string v0, "#66000000"

    .line 103
    .line 104
    const-string v4, "#CC000000"

    .line 105
    .line 106
    if-eqz p1, :cond_1

    .line 107
    .line 108
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 109
    .line 110
    invoke-virtual {p1, v2}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 119
    .line 120
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 124
    .line 125
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/z3z;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 129
    .line 130
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Ll/z3z;->g:Lv/VText;

    .line 138
    .line 139
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_1
    iget p1, p0, Ll/z3z;->l:I

    .line 148
    .line 149
    iget-object v5, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 150
    .line 151
    if-lt p1, v3, :cond_2

    .line 152
    .line 153
    invoke-virtual {v5, v1}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 157
    .line 158
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 162
    .line 163
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 167
    .line 168
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Ll/z3z;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 172
    .line 173
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/z3z;->g:Lv/VText;

    .line 181
    .line 182
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_2
    invoke-virtual {v5, v1}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 194
    .line 195
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 199
    .line 200
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Ll/z3z;->f:Lv/VSwitchButton;

    .line 204
    .line 205
    invoke-virtual {p1, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/z3z;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 209
    .line 210
    const-string v0, "#33000000"

    .line 211
    .line 212
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/z3z;->g:Lv/VText;

    .line 220
    .line 221
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_3
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setCheckedNoEvent(Z)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 233
    .line 234
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 238
    .line 239
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Ll/z3z;->b:Lv/VSwitchButton;

    .line 243
    .line 244
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Ll/z3z;->d:Landroid/widget/FrameLayout;

    .line 248
    .line 249
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 250
    .line 251
    .line 252
    :goto_1
    iget p1, p0, Ll/z3z;->l:I

    .line 253
    .line 254
    iget-object p0, p0, Ll/z3z;->g:Lv/VText;

    .line 255
    .line 256
    if-lt p1, v3, :cond_4

    .line 257
    .line 258
    const-string p1, "\u5f00\u542f\u540e\uff0c\u5c06\u5c55\u793a\u4f60\u4eec\u7684\u5bc6\u53cb\u6807\u8bc6\uff0c\u540c\u65f6\u9ed8\u8ba4\u7f6e\u9876\u8be5\u5bc6\u53cb\u7684\u5bf9\u8bdd\u6846"

    .line 259
    .line 260
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_4
    const-string p1, "\u70b9\u4eae3\u7ea7\u804a\u5929\u706b\u82b1\uff0c\u5373\u53ef\u5efa\u7acb\u5bc6\u53cb\u5173\u7cfb"

    .line 265
    .line 266
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    return-void
.end method
