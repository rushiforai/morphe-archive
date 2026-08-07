.class public Ll/cye;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cye$c;,
        Ll/cye$a;,
        Ll/cye$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:[I

.field public b:[I

.field public c:[Z

.field public d:I

.field public e:Landroid/content/Context;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/EmojiType;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/data/EmojiType;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/cye;->a:[I

    .line 6
    .line 7
    iput-object v0, p0, Ll/cye;->b:[I

    .line 8
    .line 9
    iput-object v0, p0, Ll/cye;->c:[Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/cye;->d:I

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Ll/cye;->h:I

    .line 16
    .line 17
    new-instance v0, Ll/cye$c;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/cye$c;-><init>(Ll/cye;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$i;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/cye;->e:Landroid/content/Context;

    .line 26
    .line 27
    return-void
.end method

.method private F()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cye;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic y(Ll/cye;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cye;->N(IILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z(Ll/cye;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cye;->W()V

    return-void
.end method


# virtual methods
.method public final A(I)V
    .locals 1

    .line 1
    new-array v0, p1, [I

    .line 2
    .line 3
    iput-object v0, p0, Ll/cye;->a:[I

    .line 4
    .line 5
    new-array v0, p1, [I

    .line 6
    .line 7
    iput-object v0, p0, Ll/cye;->b:[I

    .line 8
    .line 9
    new-array p1, p1, [Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/cye;->c:[Z

    .line 12
    .line 13
    return-void
.end method

.method public final C()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/cye;->G()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ll/cye;->E(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    add-int/lit8 v3, v3, 0x1

    .line 14
    .line 15
    add-int/2addr v2, v3

    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return v2
.end method

.method public D(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/EmojiType;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/EmojiType;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/data/EmojiType;

    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/data/EmojiType;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/EmojiType;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v3, v0, Lcom/p1/mobile/putong/data/EmojiType;->name:Lcom/p1/mobile/putong/data/EmojiCatgoryName;

    .line 36
    .line 37
    iput-object v3, v1, Lcom/p1/mobile/putong/data/EmojiType;->name:Lcom/p1/mobile/putong/data/EmojiCatgoryName;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_3

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lcom/p1/mobile/putong/data/EmojiItem;

    .line 56
    .line 57
    iget-boolean v4, v3, Lcom/p1/mobile/putong/data/EmojiItem;->available:Z

    .line 58
    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    iput-object v2, v1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    :goto_2
    return-object p0
.end method

.method public final E(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cye;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/EmojiType;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final G()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cye;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public H(I)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public I(II)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public J()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cye;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final K(Lcom/p1/mobile/putong/data/EmojiCatgoryName;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, -0x1

    .line 21
    sparse-switch v1, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :sswitch_0
    const-string v1, "zh"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_0
    const/16 v2, 0x8

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :sswitch_1
    const-string v1, "vi"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v2, 0x7

    .line 50
    goto :goto_0

    .line 51
    :sswitch_2
    const-string v1, "tr"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/4 v2, 0x6

    .line 61
    goto :goto_0

    .line 62
    :sswitch_3
    const-string v1, "th"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const/4 v2, 0x5

    .line 72
    goto :goto_0

    .line 73
    :sswitch_4
    const-string v1, "ru"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    const/4 v2, 0x4

    .line 83
    goto :goto_0

    .line 84
    :sswitch_5
    const-string v1, "ko"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    const/4 v2, 0x3

    .line 94
    goto :goto_0

    .line 95
    :sswitch_6
    const-string v1, "ja"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_6

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_6
    const/4 v2, 0x2

    .line 105
    goto :goto_0

    .line 106
    :sswitch_7
    const-string v1, "in"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_7

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_7
    const/4 v2, 0x1

    .line 116
    goto :goto_0

    .line 117
    :sswitch_8
    const-string v1, "en"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_8

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_8
    const/4 v2, 0x0

    .line 127
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 128
    .line 129
    .line 130
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->en:Ljava/lang/String;

    .line 131
    .line 132
    return-object p0

    .line 133
    :pswitch_0
    const-string v0, "CN"

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_9

    .line 140
    .line 141
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->zhHant:Ljava/lang/String;

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->zhHans:Ljava/lang/String;

    .line 145
    .line 146
    return-object p0

    .line 147
    :pswitch_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->vi:Ljava/lang/String;

    .line 148
    .line 149
    return-object p0

    .line 150
    :pswitch_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->tr:Ljava/lang/String;

    .line 151
    .line 152
    return-object p0

    .line 153
    :pswitch_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->th:Ljava/lang/String;

    .line 154
    .line 155
    return-object p0

    .line 156
    :pswitch_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->ru:Ljava/lang/String;

    .line 157
    .line 158
    return-object p0

    .line 159
    :pswitch_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->ko:Ljava/lang/String;

    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->ja:Ljava/lang/String;

    .line 163
    .line 164
    return-object p0

    .line 165
    :pswitch_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->id:Ljava/lang/String;

    .line 166
    .line 167
    return-object p0

    .line 168
    :pswitch_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/EmojiCatgoryName;->en:Ljava/lang/String;

    .line 169
    .line 170
    return-object p0

    .line 171
    :sswitch_data_0
    .sparse-switch
        0xca9 -> :sswitch_8
        0xd25 -> :sswitch_7
        0xd37 -> :sswitch_6
        0xd64 -> :sswitch_5
        0xe43 -> :sswitch_4
        0xe74 -> :sswitch_3
        0xe7e -> :sswitch_2
        0xeb3 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
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

.method public L(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cye;->c:[Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cye;->W()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/cye;->c:[Z

    .line 9
    .line 10
    aget-boolean p0, p0, p1

    .line 11
    .line 12
    return p0
.end method

.method public M(I)Z
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public final synthetic N(IILandroid/view/View;)V
    .locals 1

    .line 1
    iget p3, p0, Ll/cye;->h:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/cye;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/EmojiType;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/EmojiItem;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/data/EmojiItem;->id:I

    .line 20
    .line 21
    if-ne p3, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, -0x1

    .line 24
    invoke-virtual {p0, p1}, Ll/cye;->V(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p3, p0, Ll/cye;->f:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/EmojiType;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/data/EmojiItem;

    .line 43
    .line 44
    iget p1, p1, Lcom/p1/mobile/putong/data/EmojiItem;->id:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/cye;->V(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public O(Ll/cye$b;Lcom/p1/mobile/putong/data/EmojiType;II)V
    .locals 2

    .line 1
    iget v0, p0, Ll/cye;->h:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/cye;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/data/EmojiType;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/data/EmojiItem;

    .line 18
    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/data/EmojiItem;->id:I

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p1, p2, p4, v0}, Ll/cye$b;->a(Lcom/p1/mobile/putong/data/EmojiType;IZ)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, p2, p4, v0}, Ll/cye$b;->a(Lcom/p1/mobile/putong/data/EmojiType;IZ)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p1, Ll/cye$b;->a:Landroid/view/View;

    .line 33
    .line 34
    new-instance p2, Ll/bye;

    .line 35
    .line 36
    invoke-direct {p2, p0, p3, p4}, Ll/bye;-><init>(Ll/cye;II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public P(Ll/cye$a;Lcom/p1/mobile/putong/data/EmojiType;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/EmojiType;->name:Lcom/p1/mobile/putong/data/EmojiCatgoryName;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/cye;->K(Lcom/p1/mobile/putong/data/EmojiCatgoryName;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ll/cye$a;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/cye;->F()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p2, Ll/kec0;->c:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/cye$b;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/cye$b;-><init>(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public final R(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/cye;->F()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p2, Ll/kec0;->b:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/cye$a;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/cye$a;-><init>(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public final S()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/cye;->G()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    move v3, v2

    .line 8
    :goto_0
    if-ge v2, v0, :cond_1

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    invoke-virtual {p0, v3, v4, v2, v1}, Ll/cye;->U(IZII)V

    .line 12
    .line 13
    .line 14
    add-int/2addr v3, v4

    .line 15
    move v4, v1

    .line 16
    :goto_1
    invoke-virtual {p0, v2}, Ll/cye;->E(I)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    if-ge v4, v5, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v3, v1, v2, v4}, Ll/cye;->U(IZII)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v3, v3, 0x1

    .line 26
    .line 27
    add-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public T(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/EmojiType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/cye;->D(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/cye;->f:Ljava/util/List;

    .line 6
    .line 7
    return-void
.end method

.method public final U(IZII)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cye;->c:[Z

    .line 2
    .line 3
    aput-boolean p2, v0, p1

    .line 4
    .line 5
    iget-object p2, p0, Ll/cye;->a:[I

    .line 6
    .line 7
    aput p3, p2, p1

    .line 8
    .line 9
    iget-object p0, p0, Ll/cye;->b:[I

    .line 10
    .line 11
    aput p4, p0, p1

    .line 12
    .line 13
    return-void
.end method

.method public V(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cye;->h:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final W()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cye;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/cye;->d:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/cye;->A(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/cye;->S()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cye;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cye;->a:[I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cye;->W()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/cye;->a:[I

    .line 9
    .line 10
    aget v0, v0, p1

    .line 11
    .line 12
    iget-object v1, p0, Ll/cye;->b:[I

    .line 13
    .line 14
    aget v1, v1, p1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/cye;->L(I)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/cye;->H(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p0, v0, v1}, Ll/cye;->I(II)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cye;->W()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cye;->a:[I

    .line 2
    .line 3
    aget v0, v0, p2

    .line 4
    .line 5
    iget-object v1, p0, Ll/cye;->b:[I

    .line 6
    .line 7
    aget v1, v1, p2

    .line 8
    .line 9
    iget-object v2, p0, Ll/cye;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lcom/p1/mobile/putong/data/EmojiType;

    .line 16
    .line 17
    iput-object v2, p0, Ll/cye;->g:Lcom/p1/mobile/putong/data/EmojiType;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/cye;->L(I)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    check-cast p1, Ll/cye$a;

    .line 26
    .line 27
    iget-object p2, p0, Ll/cye;->g:Lcom/p1/mobile/putong/data/EmojiType;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Ll/cye;->P(Ll/cye$a;Lcom/p1/mobile/putong/data/EmojiType;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    check-cast p1, Ll/cye$b;

    .line 34
    .line 35
    iget-object p2, p0, Ll/cye;->g:Lcom/p1/mobile/putong/data/EmojiType;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/cye;->O(Ll/cye$b;Lcom/p1/mobile/putong/data/EmojiType;II)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/cye;->M(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/cye;->R(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/cye;->Q(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
