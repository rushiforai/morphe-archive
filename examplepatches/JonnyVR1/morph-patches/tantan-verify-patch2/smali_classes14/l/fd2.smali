.class public Ll/fd2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dd2;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VButton;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

.field public h:Ll/dd2;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/fd2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fd2;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gd2;->b(Ll/fd2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/dd2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fd2;->h:Ll/dd2;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fd2;->h:Ll/dd2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/dd2;->i0(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fd2;->e:Lv/VButton;

    .line 8
    .line 9
    new-instance v2, Ll/ed2;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/ed2;-><init>(Ll/fd2;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/fd2;->b:Lv/VText;

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "1\u3001"

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 27
    .line 28
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->w:I

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v3, "\n2\u3001"

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 43
    .line 44
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->x:I

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, "\n3\u3001"

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 59
    .line 60
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->y:I

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, "\n4\u3001"

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 75
    .line 76
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->z:I

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v3, "\n5\u3001"

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 91
    .line 92
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->A:I

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v3, "\n6\u3001"

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 107
    .line 108
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->B:I

    .line 109
    .line 110
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, "\n7\u3001"

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 123
    .line 124
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->C:I

    .line 125
    .line 126
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v3, "\n8\u3001"

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v3, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 139
    .line 140
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->D:I

    .line 141
    .line 142
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v3, "\n"

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/fd2;->c:Lv/VText;

    .line 162
    .line 163
    iget-object v2, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 164
    .line 165
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->E:I

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/fd2;->c:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Ll/fd2;->a:Lv/VText;

    .line 184
    .line 185
    invoke-virtual {p0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/fd2;->g:Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "ban_detail_button"

    .line 8
    .line 9
    const-string v1, "appeal"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_ban_detail"

    .line 20
    .line 21
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/fd2;->h:Ll/dd2;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Ll/dd2;->i0(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fd2;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fd2;->e:Lv/VButton;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/fd2;->f:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dd2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fd2;->c(Ll/dd2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fd2;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
