.class public Ll/wdf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/u3m;

.field public b:Ll/ner;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/tabs/TabLayout$Tab;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/u3m;Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wdf;->d:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/wdf;->e:Ljava/util/List;

    .line 20
    .line 21
    iput-object p1, p0, Ll/wdf;->a:Ll/u3m;

    .line 22
    .line 23
    iput-object p2, p0, Ll/wdf;->b:Ll/ner;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->w(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(ILjava/util/List;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->l()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/vdf;

    .line 8
    .line 9
    invoke-direct {p0, p2, p1}, Ll/vdf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->c(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic c(Ljava/lang/Class;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public final e(Lcom/google/android/material/tabs/TabLayout;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->G2:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v0, v1, v2}, Ll/cum;->a(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/adc0;->Ed:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p3, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p3, p4}, Lcom/google/android/material/tabs/TabLayout$Tab;->setTag(Ljava/lang/Object;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/wdf;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p3, p2}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/wdf;->i(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/wdf;->f(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 15
    .line 16
    return-object p0
.end method

.method public h(Ljava/lang/Class;)Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/udf;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/udf;-><init>(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 13
    .line 14
    return-object p0
.end method

.method public final i(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 4
    .line 5
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;-><init>(Ll/t3m;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/rdf;

    .line 14
    .line 15
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 16
    .line 17
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Ll/rdf;-><init>(Ll/t3m;Ll/ner;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/oef;

    .line 26
    .line 27
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 28
    .line 29
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 30
    .line 31
    invoke-direct {v0, v1, v2}, Ll/oef;-><init>(Ll/t3m;Ll/ner;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/cef;

    .line 38
    .line 39
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 40
    .line 41
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 42
    .line 43
    invoke-direct {v0, v1, v2}, Ll/cef;-><init>(Ll/t3m;Ll/ner;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/pdf;

    .line 50
    .line 51
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 52
    .line 53
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 54
    .line 55
    invoke-direct {v0, v1, v2}, Ll/pdf;-><init>(Ll/t3m;Ll/ner;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/xaf;

    .line 62
    .line 63
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 64
    .line 65
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 66
    .line 67
    invoke-direct {v0, v1, v2}, Ll/xaf;-><init>(Ll/t3m;Ll/ner;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/bff;

    .line 74
    .line 75
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 76
    .line 77
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 78
    .line 79
    invoke-direct {v0, v1, v2}, Ll/bff;-><init>(Ll/t3m;Ll/ner;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    invoke-static {}, Ll/gra;->Y1()Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/jbf;

    .line 89
    .line 90
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 91
    .line 92
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 93
    .line 94
    invoke-direct {v0, v1, v2}, Ll/jbf;-><init>(Ll/t3m;Ll/ner;)V

    .line 95
    .line 96
    .line 97
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    new-instance v0, Ll/cbf;

    .line 101
    .line 102
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 103
    .line 104
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 105
    .line 106
    invoke-direct {v0, v1, v2}, Ll/cbf;-><init>(Ll/t3m;Ll/ner;)V

    .line 107
    .line 108
    .line 109
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    new-instance v0, Ll/fef;

    .line 113
    .line 114
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 115
    .line 116
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 117
    .line 118
    invoke-direct {v0, v1, v2}, Ll/fef;-><init>(Ll/t3m;Ll/ner;)V

    .line 119
    .line 120
    .line 121
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/xra;->b()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_0

    .line 129
    .line 130
    new-instance v0, Ll/jaf;

    .line 131
    .line 132
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 133
    .line 134
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 135
    .line 136
    invoke-direct {v0, v1, v2}, Ll/jaf;-><init>(Ll/t3m;Ll/ner;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_0
    new-instance v0, Ll/oaf;

    .line 141
    .line 142
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 143
    .line 144
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 145
    .line 146
    invoke-direct {v0, v1, v2}, Ll/oaf;-><init>(Ll/t3m;Ll/ner;)V

    .line 147
    .line 148
    .line 149
    :goto_0
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    new-instance v0, Ll/zgf;

    .line 153
    .line 154
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 155
    .line 156
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 157
    .line 158
    invoke-direct {v0, v1, v2}, Ll/zgf;-><init>(Ll/t3m;Ll/ner;)V

    .line 159
    .line 160
    .line 161
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    new-instance v0, Ll/abf;

    .line 165
    .line 166
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 167
    .line 168
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 169
    .line 170
    invoke-direct {v0, v1, v2}, Ll/abf;-><init>(Ll/t3m;Ll/ner;)V

    .line 171
    .line 172
    .line 173
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    new-instance v0, Ll/ief;

    .line 177
    .line 178
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 179
    .line 180
    iget-object v2, p0, Ll/wdf;->b:Ll/ner;

    .line 181
    .line 182
    invoke-direct {v0, v1, v2}, Ll/ief;-><init>(Ll/t3m;Ll/ner;)V

    .line 183
    .line 184
    .line 185
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    new-instance v0, Ll/gaf;

    .line 189
    .line 190
    iget-object v1, p0, Ll/wdf;->a:Ll/u3m;

    .line 191
    .line 192
    iget-object p0, p0, Ll/wdf;->b:Ll/ner;

    .line 193
    .line 194
    invoke-direct {v0, v1, p0}, Ll/gaf;-><init>(Ll/t3m;Ll/ner;)V

    .line 195
    .line 196
    .line 197
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public j()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/material/tabs/TabLayout$Tab;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wdf;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Lcom/google/android/material/tabs/TabLayout;Ljava/util/List;Ll/zyh0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/tabs/TabLayout;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;",
            "Ll/zyh0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wdf;->e:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/tdf;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/tdf;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p2, v1}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_5

    .line 15
    .line 16
    :cond_0
    iput-object p2, p0, Ll/wdf;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p3}, Ll/zyh0;->h()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    if-lt v0, v1, :cond_1

    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int/2addr p3, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p3}, Ll/zyh0;->h()I

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    :goto_0
    iget-object v0, p0, Ll/wdf;->d:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    move v1, v0

    .line 49
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v1, v3, :cond_4

    .line 54
    .line 55
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->m()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 70
    .line 71
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->n()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-nez v5, :cond_3

    .line 80
    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    move v5, v2

    .line 84
    goto :goto_2

    .line 85
    :cond_2
    move v5, v0

    .line 86
    :goto_2
    invoke-virtual {p0, p1, v5, v3, v4}, Ll/wdf;->e(Lcom/google/android/material/tabs/TabLayout;ZLjava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_4
    iget-object p2, p0, Ll/wdf;->d:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-ge p3, p2, :cond_5

    .line 99
    .line 100
    iget-object p0, p0, Ll/wdf;->d:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    check-cast p0, Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 109
    .line 110
    .line 111
    :cond_5
    return-void
.end method

.method public l(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wdf;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/sdf;

    .line 4
    .line 5
    invoke-direct {v0, p2, p1}, Ll/sdf;-><init>(ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
