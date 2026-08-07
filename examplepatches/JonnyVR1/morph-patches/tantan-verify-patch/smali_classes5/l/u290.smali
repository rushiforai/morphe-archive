.class public Ll/u290;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/h390;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/h390;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public final e:Ll/t5m;

.field public final f:Ll/o290;

.field public final g:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/t5m;Ll/o290;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u290;->e:Ll/t5m;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u290;->f:Ll/o290;

    .line 9
    .line 10
    iput-object p4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic E(Ll/u290;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u290;->I(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;)V

    return-void
.end method

.method private G()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "PrivilegeODiamondContent"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-static {p0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "PrivilegePlatinumContent"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object p0, Ll/cok0;->a:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/h390;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/u290;->F(Landroid/view/View;Ll/h390;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u290;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    packed-switch p2, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    new-instance p1, Landroid/view/View;

    .line 6
    .line 7
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :pswitch_0
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    sget v1, Ll/kec0;->e9:I

    .line 24
    .line 25
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;

    .line 30
    .line 31
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 32
    .line 33
    iget-object v0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/u290;->G()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 40
    .line 41
    iget-object p0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;->r0(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :pswitch_1
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    sget v1, Ll/kec0;->h9:I

    .line 58
    .line 59
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;

    .line 64
    .line 65
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 66
    .line 67
    iget-object v0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    invoke-direct {p0}, Ll/u290;->G()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 74
    .line 75
    iget-object p0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 76
    .line 77
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->i(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 82
    .line 83
    .line 84
    return-object p1

    .line 85
    :pswitch_2
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget p2, Ll/kec0;->c9:I

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :pswitch_3
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget p2, Ll/kec0;->m9:I

    .line 105
    .line 106
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :pswitch_4
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget p2, Ll/kec0;->k9:I

    .line 118
    .line 119
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :pswitch_5
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget p2, Ll/kec0;->Z8:I

    .line 131
    .line 132
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :pswitch_6
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    sget p2, Ll/kec0;->l9:I

    .line 144
    .line 145
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :pswitch_7
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    sget p2, Ll/kec0;->Y8:I

    .line 157
    .line 158
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :pswitch_8
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    sget p2, Ll/kec0;->i9:I

    .line 170
    .line 171
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :pswitch_9
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    sget p2, Ll/kec0;->g9:I

    .line 183
    .line 184
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :pswitch_a
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    sget p2, Ll/kec0;->d9:I

    .line 196
    .line 197
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0

    .line 202
    :pswitch_b
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    sget p2, Ll/kec0;->b9:I

    .line 209
    .line 210
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    return-object p0

    .line 215
    :pswitch_c
    iget-object p0, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 216
    .line 217
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    sget p2, Ll/kec0;->j9:I

    .line 222
    .line 223
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    return-object p0

    .line 228
    nop

    .line 229
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_c
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public F(Landroid/view/View;Ll/h390;II)V
    .locals 6

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p3, p2, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;

    .line 5
    .line 6
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 11
    .line 12
    iget-object p3, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 13
    .line 14
    invoke-virtual {p1, p2, p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;->h(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-nez p3, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;

    .line 21
    .line 22
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p2, 0x2

    .line 33
    if-ne p3, p2, :cond_2

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;

    .line 36
    .line 37
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 38
    .line 39
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    check-cast p3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;

    .line 44
    .line 45
    iget-object p4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->n(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const/4 p2, 0x3

    .line 52
    if-ne p3, p2, :cond_3

    .line 53
    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem;

    .line 55
    .line 56
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 57
    .line 58
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    check-cast p3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 63
    .line 64
    iget-object p4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem;->j(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    const/4 p2, 0x4

    .line 71
    if-ne p3, p2, :cond_4

    .line 72
    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSvipContainerItem;

    .line 74
    .line 75
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 80
    .line 81
    iget-object p0, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSvipContainerItem;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    const/16 p2, 0xc

    .line 88
    .line 89
    if-ne p3, p2, :cond_5

    .line 90
    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;

    .line 92
    .line 93
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->l(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    const/4 p2, 0x5

    .line 104
    if-ne p3, p2, :cond_6

    .line 105
    .line 106
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;

    .line 107
    .line 108
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 113
    .line 114
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    const/4 p2, 0x6

    .line 119
    if-ne p3, p2, :cond_7

    .line 120
    .line 121
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;

    .line 122
    .line 123
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;

    .line 128
    .line 129
    iget-object p3, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 130
    .line 131
    iget-object p4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 132
    .line 133
    invoke-virtual {p1, p2, p0, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;->i(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_7
    const/4 p2, 0x7

    .line 138
    if-ne p3, p2, :cond_8

    .line 139
    .line 140
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem;

    .line 141
    .line 142
    iget-object p2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 143
    .line 144
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    check-cast p3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;

    .line 149
    .line 150
    iget-object p4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 151
    .line 152
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem;->r(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_8
    const/16 p2, 0x8

    .line 157
    .line 158
    if-ne p3, p2, :cond_9

    .line 159
    .line 160
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem;

    .line 161
    .line 162
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 167
    .line 168
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem;->w(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_9
    const/16 p2, 0x9

    .line 173
    .line 174
    if-ne p3, p2, :cond_a

    .line 175
    .line 176
    invoke-virtual {p0, p4}, Ll/u290;->H(I)Ll/h390;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    move-object v3, p2

    .line 181
    check-cast v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;

    .line 182
    .line 183
    move-object v0, p1

    .line 184
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;

    .line 185
    .line 186
    iget-object v2, p0, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 187
    .line 188
    iget-object v4, p0, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 189
    .line 190
    new-instance v5, Ll/t290;

    .line 191
    .line 192
    invoke-direct {v5, p0, v3}, Ll/t290;-><init>(Ll/u290;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;)V

    .line 193
    .line 194
    .line 195
    move-object v1, p0

    .line 196
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;->f(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_a
    move-object v1, p0

    .line 201
    const/16 p0, 0xa

    .line 202
    .line 203
    if-ne p3, p0, :cond_b

    .line 204
    .line 205
    invoke-virtual {v1, p4}, Ll/u290;->H(I)Ll/h390;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 210
    .line 211
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem;

    .line 212
    .line 213
    iget-object p2, v1, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 214
    .line 215
    invoke-virtual {p1, p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem;->p(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_b
    const/16 p0, 0xb

    .line 220
    .line 221
    if-ne p3, p0, :cond_c

    .line 222
    .line 223
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;

    .line 224
    .line 225
    iget-object p0, v1, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 226
    .line 227
    invoke-virtual {v1, p4}, Ll/u290;->H(I)Ll/h390;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 232
    .line 233
    iget-object p3, v1, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 234
    .line 235
    invoke-virtual {p1, v1, p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->h(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_c
    const/16 p0, 0xd

    .line 240
    .line 241
    if-ne p3, p0, :cond_d

    .line 242
    .line 243
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;

    .line 244
    .line 245
    iget-object p0, v1, Ll/u290;->d:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 246
    .line 247
    invoke-virtual {v1, p4}, Ll/u290;->H(I)Ll/h390;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$b;

    .line 252
    .line 253
    iget-object p3, v1, Ll/u290;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 254
    .line 255
    invoke-virtual {p1, v1, p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;->B0(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$b;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 256
    .line 257
    .line 258
    :cond_d
    return-void
.end method

.method public H(I)Ll/h390;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u290;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/h390;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u290;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/h390;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/u290;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u290;->H(I)Ll/h390;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u290;->H(I)Ll/h390;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h390;->getItemType()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
