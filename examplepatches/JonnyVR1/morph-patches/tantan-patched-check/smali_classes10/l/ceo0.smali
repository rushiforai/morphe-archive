.class public Ll/ceo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ydo0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public f:Ll/ydo0;

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/ceo0;->g:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/ceo0;->h:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/ceo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ceo0;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ceo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ceo0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ceo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ceo0;->j(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ceo0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/ceo0;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ll/ceo0;->f:Ll/ydo0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ydo0;->L3()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ceo0;->f()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/ceo0;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ll/ceo0;->f:Ll/ydo0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ydo0;->M3()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ceo0;->f()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ceo0;->f:Ll/ydo0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/deo0;->b(Ll/ceo0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/ydo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ceo0;->f:Ll/ydo0;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iget-object p0, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ydo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ceo0;->e(Ll/ydo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l(ZZ)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ceo0;->f:Ll/ydo0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/ceo0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/ceo0;->d:Lv/VText;

    .line 21
    .line 22
    new-instance v2, Ll/zdo0;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/zdo0;-><init>(Ll/ceo0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/ceo0;->b:Lv/VText;

    .line 31
    .line 32
    new-instance v2, Ll/aeo0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/aeo0;-><init>(Ll/ceo0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/ceo0;->c:Lv/VText;

    .line 41
    .line 42
    new-instance v2, Ll/beo0;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/beo0;-><init>(Ll/ceo0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ceo0;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 60
    .line 61
    :cond_0
    iput-boolean p1, p0, Ll/ceo0;->g:Z

    .line 62
    .line 63
    iput-boolean p2, p0, Ll/ceo0;->h:Z

    .line 64
    .line 65
    iget-object v0, p0, Ll/ceo0;->b:Lv/VText;

    .line 66
    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ceo0;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget v1, Ll/n9c0;->j1:I

    .line 78
    .line 79
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/ceo0;->b:Lv/VText;

    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->bj:I

    .line 94
    .line 95
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->aj:I

    .line 103
    .line 104
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    invoke-virtual {p0}, Ll/ceo0;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    sget v1, Ll/n9c0;->e1:I

    .line 128
    .line 129
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/ceo0;->b:Lv/VText;

    .line 137
    .line 138
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bj:I

    .line 139
    .line 140
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    :goto_0
    iget-object p1, p0, Ll/ceo0;->c:Lv/VText;

    .line 148
    .line 149
    if-eqz p2, :cond_2

    .line 150
    .line 151
    invoke-virtual {p0}, Ll/ceo0;->act()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    sget v0, Ll/n9c0;->j1:I

    .line 160
    .line 161
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 162
    .line 163
    .line 164
    move-result p2

    .line 165
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Ll/ceo0;->c:Lv/VText;

    .line 169
    .line 170
    new-instance p2, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->cj:I

    .line 176
    .line 177
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->aj:I

    .line 185
    .line 186
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_2
    invoke-virtual {p0}, Ll/ceo0;->act()Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object p2

    .line 209
    sget v0, Ll/n9c0;->e1:I

    .line 210
    .line 211
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Ll/ceo0;->c:Lv/VText;

    .line 219
    .line 220
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->cj:I

    .line 221
    .line 222
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    .line 228
    .line 229
    :goto_1
    iget-object p0, p0, Ll/ceo0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 232
    .line 233
    .line 234
    return-void
.end method
