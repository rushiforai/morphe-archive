.class public Ll/d3z$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d3z;->B0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d3z;


# direct methods
.method public constructor <init>(Ll/d3z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3

    .line 1
    const-string v0, "Meizu"

    .line 2
    .line 3
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "15"

    .line 13
    .line 14
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 23
    .line 24
    invoke-static {v0}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/u1z;->E1()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 35
    .line 36
    invoke-static {p1}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 48
    .line 49
    invoke-static {p1}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 61
    .line 62
    invoke-static {p1}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    if-nez p1, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    :goto_0
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 82
    .line 83
    invoke-static {p1}, Ll/d3z;->S(Ll/d3z;)Ll/azy;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 94
    .line 95
    invoke-static {p1}, Ll/d3z;->S(Ll/d3z;)Ll/azy;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-virtual {p1, v0}, Ll/azy;->z0(Z)V

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 111
    .line 112
    invoke-static {p1}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p1, p1, Ll/u1z;->c:Lrx/subjects/a;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    move-object v0, v1

    .line 125
    goto :goto_1

    .line 126
    :cond_3
    const-string v0, ""

    .line 127
    .line 128
    :goto_1
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-interface {p1}, Ll/r97;->t1()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_4

    .line 144
    .line 145
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 146
    .line 147
    invoke-static {p1}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-interface {p1}, Ll/mzl;->d0()Ll/vez;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p1}, Ll/vez;->y0()I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    const/4 v0, 0x1

    .line 164
    if-ne p1, v0, :cond_8

    .line 165
    .line 166
    :cond_4
    if-eqz v1, :cond_8

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_5

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_5
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 180
    .line 181
    invoke-static {p1}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1}, Ll/u1z;->E1()Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_6

    .line 190
    .line 191
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 192
    .line 193
    invoke-static {p1}, Ll/d3z;->U(Ll/d3z;)Ll/u1z;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-interface {p1}, Ll/mzl;->u0()Ll/g500;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p1}, Ll/g500;->d1()V

    .line 206
    .line 207
    .line 208
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iget-object v0, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 221
    .line 222
    if-eqz p1, :cond_7

    .line 223
    .line 224
    invoke-static {v0}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {v0, p1}, Ll/d3z;->y1(Landroid/view/View;)V

    .line 233
    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_7
    invoke-static {v0}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-virtual {v0, p1}, Ll/d3z;->b0(Landroid/view/View;)V

    .line 245
    .line 246
    .line 247
    iget-object p1, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 248
    .line 249
    invoke-static {p1}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_send()Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    const/4 v1, 0x0

    .line 258
    invoke-virtual {p1, v1, v0}, Ll/d3z;->a0(ILandroid/view/View;)V

    .line 259
    .line 260
    .line 261
    :cond_8
    :goto_2
    iget-object p0, p0, Ll/d3z$a;->a:Ll/d3z;

    .line 262
    .line 263
    invoke-static {p0}, Ll/d3z;->T(Ll/d3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-static {p0, p1}, Ll/d3z;->V(Ll/d3z;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
