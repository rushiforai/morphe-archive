.class public Ll/an20;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/tz2;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/tz2;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/data/CommonData;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/an20;->c:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Ll/an20;->d:I

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    iput v0, p0, Ll/an20;->e:I

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    iput v0, p0, Ll/an20;->f:I

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/an20;->g:Ljava/util/List;

    .line 22
    .line 23
    iput-object p1, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    return-void
.end method

.method public static G(Ll/tz2;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Ll/h0f;

    .line 2
    .line 3
    return p0
.end method

.method public static H(Ll/tz2;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Ll/hy2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Ll/pz2;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p0, Ll/ky2;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    instance-of v0, p0, Ll/ny2;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    instance-of p0, p0, Ll/h1k0;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static I(Ll/tz2;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Ll/syb;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Ll/d760;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of p0, p0, Ll/ph60;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static J(Ll/tz2;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Ll/tor;

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/tz2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/an20;->E(Landroid/view/View;Ll/tz2;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an20;->g:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/sec0;->s0:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p1, 0x2

    .line 19
    const/4 v0, -0x2

    .line 20
    if-ne p2, p1, :cond_1

    .line 21
    .line 22
    new-instance p1, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 23
    .line 24
    iget-object p0, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    const/high16 p0, 0x41700000    # 15.0f

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    sget p0, Ll/qa00;->o:I

    .line 43
    .line 44
    sget p2, Ll/qa00;->e:I

    .line 45
    .line 46
    invoke-virtual {p1, p0, v1, p0, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    const-string p0, "#4D000000"

    .line 50
    .line 51
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    return-object p1

    .line 59
    :cond_1
    const/4 p1, 0x4

    .line 60
    if-ne p2, p1, :cond_3

    .line 61
    .line 62
    new-instance p1, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 63
    .line 64
    iget-object p2, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    const/4 v2, -0x1

    .line 72
    invoke-direct {p2, v2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    sget p2, Ll/qa00;->o:I

    .line 79
    .line 80
    sget v0, Ll/qa00;->i:I

    .line 81
    .line 82
    invoke-virtual {p1, p2, v0, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    const/high16 p2, 0x41400000    # 12.0f

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 88
    .line 89
    .line 90
    const-string p2, "#FF6244"

    .line 91
    .line 92
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    sget p2, Ll/kbc0;->z1:I

    .line 102
    .line 103
    invoke-virtual {p0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_2

    .line 112
    .line 113
    sget p2, Ll/qa00;->k:I

    .line 114
    .line 115
    invoke-virtual {p0, v1, v1, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 116
    .line 117
    .line 118
    const/4 p2, 0x0

    .line 119
    invoke-virtual {p1, p0, p2, p2, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 120
    .line 121
    .line 122
    sget p0, Ll/qa00;->e:I

    .line 123
    .line 124
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 125
    .line 126
    .line 127
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->P1:I

    .line 128
    .line 129
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 130
    .line 131
    .line 132
    sget p0, Ll/qa00;->e:I

    .line 133
    .line 134
    invoke-static {p1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    const-string p0, "#14FF6244"

    .line 138
    .line 139
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 144
    .line 145
    .line 146
    return-object p1

    .line 147
    :cond_3
    new-instance p1, Landroid/view/View;

    .line 148
    .line 149
    iget-object p0, p0, Ll/an20;->h:Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 152
    .line 153
    .line 154
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 155
    .line 156
    sget p2, Ll/qa00;->q:I

    .line 157
    .line 158
    invoke-direct {p0, v0, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    .line 163
    .line 164
    return-object p1
.end method

.method public E(Landroid/view/View;Ll/tz2;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p4}, Ll/an20;->F(I)Ll/tz2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 p4, 0x3

    .line 6
    if-ne p3, p4, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;

    .line 9
    .line 10
    iget-object p0, p0, Ll/an20;->i:Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    invoke-virtual {p2, p1, p0}, Ll/tz2;->a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 p0, 0x2

    .line 17
    if-ne p3, p0, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 20
    .line 21
    iget-object p0, p2, Ll/tz2;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public F(I)Ll/tz2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/an20;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tz2;

    .line 8
    .line 9
    return-object p0
.end method

.method public K(Ljava/util/List;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tz2;",
            ">;",
            "Lcom/p1/mobile/putong/data/CommonData;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/an20;->g:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/an20;->i:Lcom/p1/mobile/putong/data/CommonData;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/an20;->F(I)Ll/tz2;

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
    invoke-virtual {p0, p1}, Ll/an20;->F(I)Ll/tz2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/an20;->H(Ll/tz2;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x3

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {p0}, Ll/an20;->I(Ll/tz2;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x2

    .line 20
    return p0

    .line 21
    :cond_1
    invoke-static {p0}, Ll/an20;->G(Ll/tz2;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_2
    invoke-static {p0}, Ll/an20;->J(Ll/tz2;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 p0, 0x4

    .line 36
    return p0

    .line 37
    :cond_3
    const/4 p0, 0x0

    .line 38
    return p0
.end method
