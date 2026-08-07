.class public Ll/wp90;
.super Ll/nx2;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public b:Lcom/p1/mobile/putong/core/newui/home/c;

.field public c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

.field public d:Ll/uxl0;

.field public e:Landroid/view/View$OnClickListener;

.field public f:Lcom/p1/mobile/putong/core/newui/home/b;

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/data/VirtualCardType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/core/data/VirtualCardType;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;Lcom/p1/mobile/putong/core/newui/home/c;Ll/uxl0;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/nx2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wp90;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wp90;->h:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    iput v0, p0, Ll/wp90;->i:I

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Ll/wp90;->j:J

    .line 24
    .line 25
    iput-object p2, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 26
    .line 27
    iput-object p3, p0, Ll/wp90;->d:Ll/uxl0;

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/c;->L(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/wp90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 33
    .line 34
    iput-object p4, p0, Ll/wp90;->f:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic n(Ll/wp90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wp90;->x(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    return-void
.end method

.method public static synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->H0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/wp90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wp90;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/wp90;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp90;->y()V

    return-void
.end method

.method public static synthetic s(Ll/wp90;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp90;->z()V

    return-void
.end method


# virtual methods
.method public A(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wp90;->e:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public call()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/view/View;I)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2}, Ll/wp90;->h(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    instance-of v2, p1, Ll/q7m;

    .line 9
    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/wp90;->h(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v0, p1, v2, v3, p2}, Lcom/p1/mobile/putong/core/newui/home/c;->w(Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;II)V

    .line 25
    .line 26
    .line 27
    if-nez p2, :cond_0

    .line 28
    .line 29
    new-instance p2, Ll/qp90;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/qp90;-><init>(Ll/wp90;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/gra;->N3()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_8

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    instance-of v2, p1, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 53
    .line 54
    if-eqz v2, :cond_8

    .line 55
    .line 56
    if-nez p2, :cond_2

    .line 57
    .line 58
    iget-object v2, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 59
    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/c;->D()V

    .line 63
    .line 64
    .line 65
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 66
    .line 67
    iget-object v2, p0, Ll/wp90;->h:Ljava/util/HashMap;

    .line 68
    .line 69
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 78
    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->Unknown:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 82
    .line 83
    :cond_3
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->e:Z

    .line 84
    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    sget-object v2, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveLivingCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 88
    .line 89
    if-ne v0, v2, :cond_4

    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v3, "\u76f4\u64ad\u5c55\u793a\u4e86\uff1a"

    .line 94
    .line 95
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v2}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_4
    iget-object v2, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 109
    .line 110
    invoke-virtual {v2, p2}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getAdapter()Ll/sxl0;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    if-eqz v3, :cond_5

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getCardType()Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    if-ne v3, v0, :cond_5

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 133
    .line 134
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eqz v3, :cond_6

    .line 143
    .line 144
    :cond_5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->setCardType(Lcom/p1/mobile/putong/core/data/VirtualCardType;)V

    .line 145
    .line 146
    .line 147
    iget-object v3, p0, Ll/wp90;->d:Ll/uxl0;

    .line 148
    .line 149
    invoke-interface {v3, v0, v2}, Ll/uxl0;->d2(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->setAdapter(Ll/sxl0;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 157
    .line 158
    .line 159
    :cond_6
    iget-object v3, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 160
    .line 161
    invoke-virtual {v3, p2}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 166
    .line 167
    invoke-virtual {p0, v3, p2}, Ll/wp90;->t(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, p2, v0, v2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->K0(ILcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 171
    .line 172
    .line 173
    if-nez p2, :cond_7

    .line 174
    .line 175
    new-instance v0, Ll/rp90;

    .line 176
    .line 177
    invoke-direct {v0, p1}, Ll/rp90;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 178
    .line 179
    .line 180
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_7
    new-instance v0, Ll/sp90;

    .line 185
    .line 186
    invoke-direct {v0}, Ll/sp90;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 190
    .line 191
    .line 192
    :goto_0
    if-nez p2, :cond_8

    .line 193
    .line 194
    iget-object p2, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 201
    .line 202
    iget-object v0, p0, Ll/wp90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-instance v1, Ll/tp90;

    .line 209
    .line 210
    invoke-direct {v1, p0, p2, p1}, Ll/tp90;-><init>(Ll/wp90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 211
    .line 212
    .line 213
    const-wide/16 p0, 0x64

    .line 214
    .line 215
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 216
    .line 217
    .line 218
    :cond_8
    return-void
.end method

.method public e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wp90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/c;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 13
    .line 14
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/a;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/wp90;->u(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "VirtualCard"

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/wp90;->v(Lcom/p1/mobile/putong/core/data/VirtualCardType;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    iget-object p0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/c;->getItemViewType(I)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public i(I)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "userType"

    .line 37
    .line 38
    :goto_0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nx2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Ll/tql;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    move-object p0, p1

    .line 9
    check-cast p0, Ll/tql;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/tql;->A0(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/nx2;->k(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Ll/tql;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    move-object p0, p1

    .line 9
    check-cast p0, Ll/tql;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/tql;->K(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l(Landroid/view/View;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Ll/tql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/tql;

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/tql;->k(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m(Ll/txl0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/wp90;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p1, Ll/txl0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    instance-of v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "remove card:"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ","

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v3, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/txl0;->d()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/c;->J(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J8(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/gra;->N3()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 80
    .line 81
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_0

    .line 86
    .line 87
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 92
    .line 93
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_0

    .line 106
    .line 107
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 112
    .line 113
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 120
    .line 121
    const/4 v0, 0x0

    .line 122
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 127
    .line 128
    iget-object v0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 129
    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/c;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    goto :goto_0

    .line 137
    :cond_0
    const/4 p1, 0x0

    .line 138
    move-object v0, p1

    .line 139
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 144
    .line 145
    .line 146
    :cond_1
    iget-object p0, p0, Ll/wp90;->b:Lcom/p1/mobile/putong/core/newui/home/c;

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/c;->E()V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v1, "\u79fb\u51fa\u5361\u7247\u65f6\u6570\u636e\u5df2\u7ecf\u4e0d\u5b58\u5728:"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/wp90;->f()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v1, "renderList:"

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/nx2;->b()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Ll/wp90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 191
    .line 192
    new-instance v0, Ll/up90;

    .line 193
    .line 194
    invoke-direct {v0, p0}, Ll/up90;-><init>(Ll/wp90;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 198
    .line 199
    .line 200
    :cond_3
    return-void

    .line 201
    :cond_4
    new-instance p1, Ljava/lang/RuntimeException;

    .line 202
    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v1, "\u79fb\u51fa\u5361\u7247\u65f6\u6808\u5df2\u7ecf\u7a7a\u4e86"

    .line 206
    .line 207
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0}, Ll/nx2;->b()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Ll/wp90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 228
    .line 229
    new-instance v0, Ll/vp90;

    .line 230
    .line 231
    invoke-direct {v0, p0}, Ll/vp90;-><init>(Ll/wp90;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J0:Lrx/subjects/b;

    .line 14
    .line 15
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J0:Lrx/subjects/b;

    .line 26
    .line 27
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    const-string p0, "VirtualCard"

    .line 10
    .line 11
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentLive()Lcom/p1/mobile/putong/data/Live;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveLivingCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 22
    .line 23
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/core/data/VirtualCardType;)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wp90;->g:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wp90;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    iget v0, p0, Ll/wp90;->i:I

    .line 23
    .line 24
    add-int/lit8 v1, v0, 0x1

    .line 25
    .line 26
    iput v1, p0, Ll/wp90;->i:I

    .line 27
    .line 28
    iget-object v1, p0, Ll/wp90;->g:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/wp90;->h:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/wp90;->g:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wp90;->e:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Ll/wp90;->j:J

    .line 10
    .line 11
    const-wide/16 v2, -0x1

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ll/wp90;->j:J

    .line 22
    .line 23
    sub-long/2addr v0, v2

    .line 24
    const-wide/16 v2, 0x1f4

    .line 25
    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-gez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iget-wide v2, p0, Ll/wp90;->j:J

    .line 35
    .line 36
    sub-long/2addr v0, v2

    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-gez v0, :cond_1

    .line 42
    .line 43
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    iput-wide v0, p0, Ll/wp90;->j:J

    .line 48
    .line 49
    iget-object p0, p0, Ll/wp90;->e:Landroid/view/View$OnClickListener;

    .line 50
    .line 51
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getCardData()Ll/ik4;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Ll/wp90;->f:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->v2()Ll/b240;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/b240;->g6(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-static {p2, v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
