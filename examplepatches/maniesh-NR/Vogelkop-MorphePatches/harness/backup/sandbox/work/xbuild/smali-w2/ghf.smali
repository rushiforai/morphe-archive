.class public final Lghf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzkf;
.implements Lati;
.implements Ljvk;
.implements Lorg/chromium/printing/Printable;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x6

    iput-byte v0, p0, Lghf;->a:B

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lghf;->b:Ljava/lang/Object;

    .line 116
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lghf;->c:Ljava/lang/Object;

    .line 117
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/16 v0, 0xa

    iput-byte v0, p0, Lghf;->a:B

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lghf;->b:Ljava/lang/Object;

    .line 152
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lghf;->d:Ljava/lang/Object;

    .line 153
    new-instance v0, Lb8i;

    invoke-direct {v0, p0, p1}, Lb8i;-><init>(Lghf;Landroid/content/Context;)V

    iput-object v0, p0, Lghf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .registers 4

    const/16 v0, 0x1b

    iput-byte v0, p0, Lghf;->a:B

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 148
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lkw3;Lkw3;)V
    .registers 5

    const/16 v0, 0x16

    iput-byte v0, p0, Lghf;->a:B

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iput-object p2, p0, Lghf;->b:Ljava/lang/Object;

    .line 164
    iput-object p3, p0, Lghf;->c:Ljava/lang/Object;

    .line 165
    new-instance p2, Lqzj;

    const/4 p3, 0x0

    .line 166
    invoke-direct {p2, p1, p3}, Lqzj;-><init>(Landroid/content/Context;Ljava/lang/Integer;)V

    .line 167
    iput-object p2, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Llkk;)V
    .registers 7

    const/4 v0, 0x3

    iput-byte v0, p0, Lghf;->a:B

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    .line 156
    new-instance p1, Landroid/util/SparseArray;

    array-length v0, p2

    invoke-direct {p1, v0}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    .line 157
    array-length p1, p2

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_18
    if-ge v1, p1, :cond_24

    aget-object v3, p2, v1

    .line 158
    iget-byte v3, v3, Llkk;->a:B

    if-le v3, v2, :cond_21

    move v2, v3

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_24
    add-int/lit8 v2, v2, 0x1

    .line 159
    new-array p1, v2, [Lzsf;

    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 160
    array-length p1, p2

    :goto_2b
    if-ge v0, p1, :cond_3b

    aget-object v1, p2, v0

    .line 161
    iget-object v2, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    iget-byte v3, v1, Llkk;->a:B

    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    :cond_3b
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/FadingScrollView;Lwzg;Lkze;Lkze;Lxzg;)V
    .registers 9

    const/4 v0, 0x7

    iput-byte v0, p0, Lghf;->a:B

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 173
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 174
    iput-object p3, p0, Lghf;->d:Ljava/lang/Object;

    .line 175
    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    .line 176
    new-instance p2, Luzg;

    invoke-direct {p2, p1, p4, p6, p5}, Luzg;-><init>(Lh42;Lwzg;Lkze;Lkze;)V

    .line 177
    iget-object p3, p4, Lwzg;->c:Ljava/lang/Object;

    check-cast p3, Lkze;

    .line 178
    invoke-virtual {p1, p3, p2}, Lh42;->s(Lekc;Lf7f;)V

    .line 179
    invoke-virtual {p1, p6, p2}, Lh42;->s(Lekc;Lf7f;)V

    .line 180
    invoke-virtual {p1, p5, p2}, Lh42;->s(Lekc;Lf7f;)V

    .line 181
    new-instance p2, Lqzg;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p7, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Leck;)V
    .registers 4

    const/16 v0, 0x14

    iput-byte v0, p0, Lghf;->a:B

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 96
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 97
    new-instance p2, Lz61;

    const/16 v0, 0x16

    invoke-direct {p2, p0, v0}, Lz61;-><init>(Ljava/lang/Object;B)V

    .line 98
    invoke-static {p1, p2}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;Landroid/view/animation/PathInterpolator;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Lghf;->a:B

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 125
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 126
    new-instance p2, Lm42;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public constructor <init>(Ldx3;Lb2l;)V
    .registers 4

    const/16 v0, 0x1a

    iput-byte v0, p0, Lghf;->a:B

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lghf;->b:Ljava/lang/Object;

    const p2, 0x7f140d4a

    .line 120
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    .line 121
    sget-object p1, Lt8;->a:Landroid/content/Context;

    const p2, 0x7f1406c1

    .line 122
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgnh;)V
    .registers 10

    const/16 v0, 0x18

    iput-byte v0, p0, Lghf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    const p1, 0x7f140564

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    new-instance v0, Lmvk;

    new-instance p1, Li3d;

    sget-object v1, Lk3d;->a:Landroid/graphics/PointF;

    const v1, 0x7f0402c2

    const/4 v2, 0x1

    const-string v3, "states/on success"

    const/4 v4, 0x0

    invoke-direct {p1, v1, v2, v3, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v5, Li3d;

    const/4 v6, 0x2

    invoke-direct {v5, v1, v6, v3, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v1, Li3d;

    const v3, 0x7f0402eb

    const-string v7, "states/success"

    invoke-direct {v1, v3, v2, v7, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v2, Li3d;

    invoke-direct {v2, v3, v6, v7, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {p1, v5, v1, v2}, [Li3d;

    move-result-object v5

    const v1, 0x7f040928

    const v2, 0x7f14141d

    const v3, 0x7f040929

    const v4, 0x7f13003f

    invoke-direct/range {v0 .. v5}, Lmvk;-><init>(IIII[Li3d;)V

    iput-object v0, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lguf;)V
    .registers 3

    const/16 v0, 0x11

    iput-byte v0, p0, Lghf;->a:B

    sget-object v0, Ln65;->b:Ln65;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 112
    invoke-static {p1}, Lc26;->j(I)Lbf2;

    move-result-object p1

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    .line 113
    invoke-static {v0}, Lc26;->k(Ljava/lang/Object;)Lef2;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Li4d;)V
    .registers 3

    const/16 v0, 0x10

    iput-byte v0, p0, Lghf;->a:B

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lumi;)V
    .registers 4

    const/16 v0, 0xd

    iput-byte v0, p0, Lghf;->a:B

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 107
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 108
    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V
    .registers 5

    .line 99
    iput-byte p4, p0, Lghf;->a:B

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    iput-object p2, p0, Lghf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lghf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 77
    iput-byte p4, p0, Lghf;->a:B

    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    iput-object p3, p0, Lghf;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 4

    const/16 v0, 0xf

    iput-byte v0, p0, Lghf;->a:B

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lhyl;

    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    .line 130
    new-instance p1, Lpr;

    new-instance v0, Ltxi;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0}, Lpr;-><init>(Louh;)V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk6l;)V
    .registers 3

    const/16 v0, 0x19

    iput-byte v0, p0, Lghf;->a:B

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    .line 187
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lndc;Lplk;Lz77;)V
    .registers 5

    const/16 v0, 0x15

    iput-byte v0, p0, Lghf;->a:B

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput-object p2, p0, Lghf;->b:Ljava/lang/Object;

    .line 133
    iput-object p3, p0, Lghf;->c:Ljava/lang/Object;

    .line 134
    iget-object p2, p2, Lplk;->d:Ljava/lang/Object;

    check-cast p2, Lh42;

    .line 135
    new-instance p3, Lqzg;

    invoke-direct {p3, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p3}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lpne;Ljava/lang/String;ILumi;Lbnj;J)V
    .registers 17

    const/16 v0, 0x12

    iput-byte v0, p0, Lghf;->a:B

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v0, Lmni;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    .line 138
    new-instance v1, Lq65;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    .line 139
    iput-object v1, p0, Lghf;->b:Ljava/lang/Object;

    .line 140
    iput-object p5, p0, Lghf;->c:Ljava/lang/Object;

    .line 141
    iget-object p1, p1, Lpne;->a:Ljava/lang/String;

    invoke-static {p1, p2}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 142
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_29

    const/4 p0, 0x0

    .line 143
    invoke-interface {p5, p0}, Lbnj;->f(Z)V

    goto :goto_41

    .line 144
    :cond_29
    new-instance v8, Lrii;

    invoke-direct {v8, p0, v2}, Lrii;-><init>(Ljava/lang/Object;B)V

    const/4 v6, 0x0

    const/16 v7, 0xa

    move v5, p3

    move v4, p3

    invoke-static/range {v3 .. v8}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    if-eqz p1, :cond_41

    .line 145
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide p1, p6

    invoke-virtual {v1, p4, p1, p2, p0}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_41
    :goto_41
    return-void
.end method

.method public constructor <init>(Lsam;Lghf;)V
    .registers 4

    const/16 v0, 0x1d

    iput-byte v0, p0, Lghf;->a:B

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 184
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 185
    invoke-interface {p1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lx5f;Lq6e;)V
    .registers 5

    const/16 v0, 0xe

    iput-byte v0, p0, Lghf;->a:B

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 102
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 103
    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    .line 104
    new-instance p1, Lkv1;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lkv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Lq6e;->a(Lkri;)V

    return-void
.end method

.method public constructor <init>(Lwjh;Lfji;Laji;)V
    .registers 5

    const/16 v0, 0xc

    iput-byte v0, p0, Lghf;->a:B

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lghf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lghf;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;Luqe;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lghf;->a:B

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 80
    iput-object p2, p0, Lghf;->c:Ljava/lang/Object;

    .line 81
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5g;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lghf;->a:B

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Lghf;->b:Ljava/lang/Object;

    .line 84
    new-instance v0, Lode;

    .line 85
    invoke-direct {v0}, Lekc;-><init>()V

    .line 86
    iput-object v0, p0, Lghf;->c:Ljava/lang/Object;

    .line 87
    new-instance v1, Lz5g;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lz5g;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lghf;->d:Ljava/lang/Object;

    .line 88
    iget-object p0, p1, Lx5g;->e:La4g;

    if-eqz p0, :cond_22

    .line 89
    iget-object p0, p0, La4g;->a:Ljava/util/List;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    goto :goto_23

    :cond_22
    const/4 p0, 0x0

    :goto_23
    if-nez p0, :cond_27

    .line 90
    sget-object p0, Ll08;->a:Ll08;

    .line 91
    :cond_27
    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    .line 92
    invoke-virtual {p1}, Lx5g;->c()V

    .line 93
    iget-object p0, p1, Lx5g;->b:Li7f;

    invoke-virtual {p0, v1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lzd4;Lwtk;Ljava/lang/String;)V
    .registers 4

    const/16 p3, 0x17

    iput-byte p3, p0, Lghf;->a:B

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    iput-object p1, p0, Lghf;->c:Ljava/lang/Object;

    .line 170
    iput-object p2, p0, Lghf;->b:Ljava/lang/Object;

    return-void
.end method

.method public static H(IILandroid/content/Context;Landroid/util/AttributeSet;[I)Lghf;
    .registers 6

    new-instance v0, Lghf;

    invoke-virtual {p2, p3, p4, p0, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-direct {v0, p2, p0}, Lghf;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    return-object v0
.end method

.method public static r(Lghf;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Llth;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Llth;

    iget v1, v0, Llth;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Llth;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Llth;

    invoke-direct {v0, p0, p2}, Llth;-><init>(Lghf;Lnt5;)V

    :goto_18
    iget-object p2, v0, Llth;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Llth;->v:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6d

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lfvh;

    invoke-direct {p2}, Lfvh;-><init>()V

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lrma;

    const/4 v6, 0x4

    invoke-direct {v5, v6}, Lrma;-><init>(B)V

    invoke-virtual {v5, v2, v4}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v5}, Lrma;->d()Lhra;

    move-result-object v2

    iput-object v2, p2, Lfvh;->a:Lhra;

    const-string v2, "Accept-Language"

    invoke-virtual {p2, v2, p1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lkvh;

    invoke-direct {p1, p2}, Lkvh;-><init>(Lfvh;)V

    iget-object p2, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p2, Ljg8;

    new-instance v2, Lp71;

    const/16 v5, 0x13

    invoke-direct {v2, p0, p1, v4, v5}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Llth;->v:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_6d

    return-object v1

    :cond_6d
    :goto_6d
    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public static y(Ljava/util/Map;Ljava/lang/String;Lirg;)Llrg;
    .registers 5

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_22

    new-instance v0, Llrg;

    iget-boolean v1, p2, Lirg;->d:Z

    invoke-direct {v0, v1}, Llrg;-><init>(Z)V

    iget-object p2, p2, Lirg;->a:Ljava/lang/String;

    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, p2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v1}, [Lkotlin/Pair;

    move-result-object p2

    invoke-static {p2}, Lrbd;->d([Lkotlin/Pair;)Ljava/util/LinkedHashMap;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_22
    iget-object p0, p2, Lirg;->a:Ljava/lang/String;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llrg;

    if-nez p0, :cond_38

    new-instance p0, Llrg;

    iget-boolean p1, p2, Lirg;->d:Z

    invoke-direct {p0, p1}, Llrg;-><init>(Z)V

    iget-object p1, p2, Lirg;->a:Ljava/lang/String;

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_38
    return-object p0
.end method


# virtual methods
.method public final A()Ljava/util/ArrayList;
    .registers 8

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_15
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llrg;

    invoke-virtual {v4}, Llrg;->b()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    new-instance v6, Lkotlin/Pair;

    invoke-direct {v6, v5, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3e

    :cond_65
    invoke-static {v3}, Lrbd;->h(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v1

    new-instance v3, Lbqg;

    invoke-direct {v3, v2, v1}, Lbqg;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_72
    return-object v0
.end method

.method public final B(Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_73

    check-cast p1, Ljava/lang/Iterable;

    instance-of v1, p1, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_26

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6e

    :cond_26
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v3, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_2a

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    if-eqz v1, :cond_2a

    check-cast v1, Ljava/lang/Iterable;

    instance-of v3, v1, Ljava/util/Collection;

    if-eqz v3, :cond_57

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2a

    :cond_57
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llrg;

    invoke-virtual {v3}, Llrg;->b()Z

    move-result v3

    if-eqz v3, :cond_5b

    const/4 v2, 0x1

    :cond_6e
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_74

    :cond_73
    const/4 p0, 0x0

    :goto_74
    if-eqz v0, :cond_96

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    if-eqz p1, :cond_96

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_80
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_96

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llrg;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Llrg;->a(Z)V

    goto :goto_80

    :cond_96
    return-void
.end method

.method public final D(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    invoke-virtual {p0, p1, p2, p3}, Lghf;->N(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object p2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_11
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_2c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    move-object v1, p3

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    goto :goto_2d

    :cond_2c
    move-object p3, v0

    :goto_2d
    check-cast p3, Ljava/util/Map$Entry;

    if-eqz p3, :cond_38

    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    :cond_38
    if-eqz v0, :cond_3d

    invoke-virtual {p0, v0}, Lghf;->B(Ljava/lang/String;)V

    :cond_3d
    return-void
.end method

.method public final E()Z
    .registers 3

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lsam;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lghf;->d:Ljava/lang/Object;

    if-ne v0, v1, :cond_1a

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lghf;

    if-eqz p0, :cond_18

    invoke-virtual {p0}, Lghf;->E()Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final G()Z
    .registers 5

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_96

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    if-eqz v0, :cond_96

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    if-eqz v0, :cond_96

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_96

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-nez v0, :cond_96

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->beginFakeDrag()Z

    move-result v0

    if-eqz v0, :cond_96

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v0

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/viewpager/widget/ViewPager;

    sget-object v2, Ll2c;->j:Lc2c;

    invoke-interface {v2, v1}, Lc2c;->b(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/viewpager/widget/ViewPager;

    const/4 v3, 0x1

    if-ne v1, v3, :cond_54

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int v1, v0, v1

    goto :goto_59

    :cond_54
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    :goto_59
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lghf;->d:Ljava/lang/Object;

    iget-object v1, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x2bc

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    new-instance v1, Ljq3;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Ljq3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    new-instance v1, Lkc;

    const/16 v2, 0x19

    invoke-direct {v1, p0, v2}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return v3

    :cond_96
    const/4 p0, 0x0

    return p0
.end method

.method public final I(Landroid/content/Context;)Ljjm;
    .registers 9

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroid/content/Intent;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->Q0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzcj;

    iget-object v1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lb2l;

    invoke-virtual {v0, v2, v1}, Lzcj;->c(Landroid/content/Intent;Lb2l;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_40

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_40

    :cond_35
    new-instance v0, Lp8f;

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Ldcj;

    invoke-direct {v0, v2, v3, p0}, Lp8f;-><init>(Landroid/content/Intent;Ljava/util/ArrayList;Ldcj;)V

    move-object p0, p1

    goto :goto_6c

    :cond_40
    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_54

    new-instance v1, Lqn;

    const/16 v6, 0x14

    move-object v5, p1

    move-object v4, v3

    move-object v3, v2

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object p0, v5

    :goto_52
    move-object v5, v1

    goto :goto_5a

    :cond_54
    move-object v4, v3

    move-object v3, v2

    move-object v2, p0

    move-object p0, p1

    const/4 v1, 0x0

    goto :goto_52

    :goto_5a
    new-instance v1, Ljvg;

    iget-object p1, v2, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Lb2l;

    iget-object v0, v2, Lghf;->c:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ldcj;

    move-object v2, v3

    move-object v3, v4

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Ljvg;-><init>(Landroid/content/Intent;Ljava/util/ArrayList;Lb2l;Lqn;Ldcj;)V

    move-object v0, v1

    :goto_6c
    invoke-interface {v0, p0}, Licj;->f(Landroid/content/Context;)Ljjm;

    move-result-object p0

    return-object p0
.end method

.method public final J()V
    .registers 1

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/TypedArray;

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public final K()V
    .registers 3

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lwtk;

    invoke-interface {v0}, Lwtk;->release()V

    new-instance v0, Lqlk;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lxug;->q(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final L(Ljava/lang/String;Lp6l;)Ljava/lang/String;
    .registers 5

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3f

    const-string v1, "redirector.opera.com"

    invoke-static {v0, v1}, Lwqm;->y(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1a

    const-string v1, "redirector.op-test.net"

    invoke-static {v0, v1}, Lwqm;->y(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    :cond_1a
    iget-object p2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p2, Lesk;

    invoke-interface {p2}, Lesk;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_28

    const-string p2, ""

    :cond_28
    const-string v0, "$gaid$"

    invoke-static {p1, v0, p2}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string p2, "$huid$"

    invoke-static {p1, p2, p0}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3f
    invoke-static {p1}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_79

    sget-object v0, Lp6l;->b:Lp6l;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lesk;

    if-ne p2, v0, :cond_60

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh1a;

    invoke-virtual {p0}, Lh1a;->i()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_72

    const-string p0, "android-ofa-b-pr"

    goto :goto_72

    :cond_60
    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh1a;

    invoke-virtual {p0}, Lh1a;->j()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_72

    const-string p0, "android-ofa-b-re"

    :cond_72
    :goto_72
    const-string p2, "#{OPRClient}"

    invoke-static {p1, p2, p0}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_79
    return-object p1
.end method

.method public final M(Lwo2;)Lfn7;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Lwtk;

    invoke-static {}, Lxug;->i()V

    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v3, v1, Lwo2;->a:Lntk;

    iget-object v1, v1, Lwo2;->b:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_29

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco2;

    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_19

    :cond_29
    new-instance v4, Lfn7;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v0, Lghf;->d:Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_34
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_ac

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco2;

    iget-object v6, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v6, Lfn7;

    iget-object v7, v4, Lco2;->d:Landroid/graphics/Rect;

    iget v8, v4, Lco2;->f:I

    iget-boolean v9, v4, Lco2;->g:Z

    new-instance v14, Landroid/graphics/Matrix;

    iget-object v10, v3, Lntk;->b:Landroid/graphics/Matrix;

    invoke-direct {v14, v10}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v10, Landroid/graphics/RectF;

    invoke-direct {v10, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v11, v4, Lco2;->e:Landroid/util/Size;

    invoke-static {v11}, Ld2m;->i(Landroid/util/Size;)Landroid/graphics/RectF;

    move-result-object v12

    invoke-static {v10, v12, v8, v9}, Ld2m;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v10

    invoke-virtual {v14, v10}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    invoke-static {v7}, Ld2m;->f(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v7

    invoke-static {v8, v7}, Ld2m;->h(ILandroid/util/Size;)Landroid/util/Size;

    move-result-object v7

    const/4 v10, 0x0

    invoke-static {v7, v10, v11}, Ld2m;->d(Landroid/util/Size;ZLandroid/util/Size;)Z

    move-result v7

    invoke-static {v7}, Ljpo;->j(Z)V

    new-instance v7, Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/util/Size;->getWidth()I

    move-result v12

    invoke-virtual {v11}, Landroid/util/Size;->getHeight()I

    move-result v13

    invoke-direct {v7, v10, v10, v12, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v12, v3, Lntk;->g:Lto2;

    invoke-virtual {v12}, Lto2;->b()Lne5;

    move-result-object v12

    iput-object v11, v12, Lne5;->a:Ljava/lang/Object;

    invoke-virtual {v12}, Lne5;->p()Lto2;

    move-result-object v13

    new-instance v10, Lntk;

    iget-byte v11, v4, Lco2;->b:B

    iget-short v12, v4, Lco2;->c:S

    iget v15, v3, Lntk;->i:I

    sub-int v17, v15, v8

    iget-boolean v8, v3, Lntk;->e:Z

    if-eq v8, v9, :cond_9e

    move/from16 v19, v5

    goto :goto_a0

    :cond_9e
    const/16 v19, 0x0

    :goto_a0
    const/4 v15, 0x0

    const/16 v18, -0x1

    move-object/from16 v16, v7

    invoke-direct/range {v10 .. v19}, Lntk;-><init>(IILto2;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V

    invoke-virtual {v6, v4, v10}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_34

    :cond_ac
    iget-object v1, v0, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Lzd4;

    invoke-virtual {v3, v1, v5}, Lntk;->d(Lzd4;Z)Lbuk;

    move-result-object v1

    invoke-interface {v2, v1}, Lwtk;->c(Lbuk;)V

    iget-object v1, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lfn7;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-virtual {v0, v3, v2}, Lghf;->p(Lntk;Ljava/util/Map$Entry;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lntk;

    new-instance v5, Ljbd;

    const/16 v6, 0x13

    invoke-direct {v5, v0, v3, v2, v6}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Lntk;->a(Ljava/lang/Runnable;)V

    goto :goto_c3

    :cond_e3
    iget-object v1, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lfn7;

    new-instance v2, Lip1;

    const/4 v4, 0x7

    invoke-direct {v2, v1, v4}, Lip1;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v3, Lntk;->o:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lfn7;

    return-object v0
.end method

.method public final N(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 8

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_12

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llrg;

    if-nez v0, :cond_2c

    new-instance v0, Llrg;

    invoke-direct {v0, p3}, Llrg;-><init>(Z)V

    new-instance v2, Lrd1;

    const/4 v3, 0x2

    invoke-direct {v2, p0, p1, p2, v3}, Lrd1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, v0, Llrg;->a:Lkotlin/jvm/functions/Function1;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2c
    invoke-virtual {v0, p3}, Llrg;->a(Z)V

    return-void
.end method

.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final b()Z
    .registers 2

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    if-eqz p0, :cond_20

    check-cast p0, Ld7l;

    iget-boolean v0, p0, Ld7l;->m:Z

    if-nez v0, :cond_20

    invoke-virtual {p0}, Ld7l;->o0()Z

    move-result v0

    if-nez v0, :cond_20

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->c0()Z

    move-result p0

    if-eqz p0, :cond_22

    :cond_20
    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public final c(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function2;)V
    .registers 8

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_9

    invoke-interface {p2, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_32
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    goto :goto_4d

    :cond_4c
    const/4 v3, 0x0

    :goto_4d
    check-cast v3, Ljava/util/Map$Entry;

    if-eqz v3, :cond_9

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_9

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_5d
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_61
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_71

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lghf;->B(Ljava/lang/String;)V

    goto :goto_61

    :cond_71
    return-void
.end method

.method public final d(Lcom/google/android/gms/ads/AdError;)V
    .registers 4

    iget-byte v0, p0, Lghf;->a:B

    const-string v1, "loadAd: initialize onError, error="

    packed-switch v0, :pswitch_data_3a

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lqpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lqpf;->b:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lmpf;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmpf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lmpf;->a:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_20
    .end packed-switch
.end method

.method public final e()V
    .registers 8

    iget-byte v0, p0, Lghf;->a:B

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    const-string v2, "loadAd: initialize onSuccess"

    packed-switch v0, :pswitch_data_a2

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lqpf;

    invoke-virtual {v0, v2}, Lqpf;->a(Ljava/lang/String;)V

    check-cast v1, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;

    invoke-static {v1}, Lrm5;->a0(Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;)V

    new-instance v0, Lqie;

    const/4 v2, 0x5

    invoke-direct {v0, p0, v2}, Lqie;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lwjo;->b:Lwjo;

    invoke-static {v0}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_54

    invoke-static {v0, v1}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_54

    invoke-static {v0, p0}, Lfcp;->c(Lcn;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_54

    sget-object v3, Lfko;->a:Lejo;

    invoke-static {v1}, Lfko;->a(Landroid/content/Context;)V

    new-instance v3, Li2i;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v4, Lpro;

    sget-object v5, Lsm;->f:Lsm;

    sget-object v6, Leq;->e:Leq;

    invoke-direct {v4, p0, v5, v6, v2}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    invoke-direct {v3, v1, v4}, Lm4b;-><init>(Landroid/content/Context;Lpro;)V

    invoke-virtual {v3, v0}, Lk8;->J(Lcn;)V

    invoke-virtual {v3}, Lk8;->I()V

    :cond_54
    return-void

    :pswitch_55
    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lmpf;

    invoke-virtual {v0, v2}, Lmpf;->a(Ljava/lang/String;)V

    check-cast v1, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;

    invoke-static {v1}, Lrm5;->a0(Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;)V

    new-instance v0, Lqfb;

    const/16 v2, 0x11

    invoke-direct {v0, p0, v2}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lwjo;->b:Lwjo;

    invoke-static {v0}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a1

    invoke-static {v0, v1}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a1

    invoke-static {v0, p0}, Lfcp;->c(Lcn;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object v3

    if-eqz v3, :cond_a1

    sget-object v3, Lfko;->a:Lejo;

    invoke-static {v1}, Lfko;->a(Landroid/content/Context;)V

    new-instance v3, Lvt1;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v4, Lpro;

    sget-object v5, Lsm;->h:Lsm;

    sget-object v6, Leq;->e:Leq;

    invoke-direct {v4, p0, v5, v6, v2}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    invoke-direct {v3, v1, v4}, Lk8;-><init>(Landroid/content/Context;Lpro;)V

    invoke-virtual {v3, v0}, Lk8;->J(Lcn;)V

    invoke-virtual {v3}, Lk8;->I()V

    :cond_a1
    return-void

    :pswitch_data_a2
    .packed-switch 0x1
        :pswitch_55
    .end packed-switch
.end method

.method public final g(Lesi;)V
    .registers 2

    return-void
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-eqz v0, :cond_24

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_19

    return-object v1

    :cond_19
    invoke-virtual {v0}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_24

    return-object v0

    :cond_24
    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 6

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lmvk;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lmvk;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_17

    aput-object p0, p2, v2

    aput-object v0, p2, v1

    return-void

    :cond_17
    aput-object v0, p2, v2

    aput-object p0, p2, v1

    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final j(II)Z
    .registers 4

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lghf;->b()Z

    move-result p0

    if-eqz p0, :cond_23

    check-cast v0, Ld7l;

    iget-boolean p0, v0, Ld7l;->k:Z

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ld7l;->r0(Z)V

    :cond_1c
    iget-object p0, v0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1, p2}, Le7l;->j(II)Z

    move-result p0

    return p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 5

    instance-of v0, p1, Lonh;

    if-eqz v0, :cond_3c

    move-object v0, p1

    check-cast v0, Lonh;

    invoke-virtual {v0}, Lonh;->V()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3c

    iget-object v1, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v1, Lmvk;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lovk;

    const/4 v1, 0x0

    invoke-direct {p2, p0, v0, v1}, Lovk;-><init>(Lghf;Ljava/util/List;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_27
    iget-object v1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v1, Lmvk;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3c

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lovk;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v0, v1}, Lovk;-><init>(Lghf;Ljava/util/List;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3c
    return-void
.end method

.method public final l()V
    .registers 2

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lx5g;

    iget-object p0, p0, Lx5g;->e:La4g;

    if-eqz p0, :cond_13

    iget-object p0, p0, La4g;->a:Ljava/util/List;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    if-nez p0, :cond_18

    sget-object p0, Ll08;->a:Ll08;

    :cond_18
    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final m()Lekc;
    .registers 1

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    return-object p0
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    instance-of p0, p1, Lonh;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Lonh;

    invoke-virtual {p1}, Lonh;->U()Z

    move-result p0

    return p0
.end method

.method public final o()V
    .registers 8

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_26
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llrg;

    new-instance v5, Lmrg;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v1, v3, v6}, Lmrg;-><init>(Lghf;Ljava/util/Map$Entry;Ljava/util/Map$Entry;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v4, Llrg;->a:Lkotlin/jvm/functions/Function1;

    goto :goto_26

    :cond_44
    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_50
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_88

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_50

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llrg;

    new-instance v5, Lmrg;

    const/4 v6, 0x1

    invoke-direct {v5, p0, v1, v3, v6}, Lmrg;-><init>(Lghf;Ljava/util/Map$Entry;Ljava/util/Map$Entry;B)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v4, Llrg;->a:Lkotlin/jvm/functions/Function1;

    goto :goto_6a

    :cond_88
    return-void
.end method

.method public final p(Lntk;Ljava/util/Map$Entry;)V
    .registers 12

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lntk;

    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v0, p1, Lntk;->g:Lto2;

    iget-object v4, v0, Lto2;->a:Landroid/util/Size;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco2;

    iget-object v5, v0, Lco2;->d:Landroid/graphics/Rect;

    iget-boolean p1, p1, Lntk;->c:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_21

    iget-object p1, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p1, Lzd4;

    move-object v6, p1

    goto :goto_22

    :cond_21
    move-object v6, v0

    :goto_22
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lco2;

    iget v7, p1, Lco2;->f:I

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lco2;

    iget-boolean v8, p1, Lco2;->g:Z

    new-instance v3, Luo2;

    invoke-direct/range {v3 .. v8}, Luo2;-><init>(Landroid/util/Size;Landroid/graphics/Rect;Lzd4;IZ)V

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lco2;

    iget-short v4, p1, Lco2;->c:S

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    invoke-virtual {v2}, Lntk;->b()V

    iget-boolean p1, v2, Lntk;->j:Z

    const/4 p2, 0x1

    xor-int/2addr p1, p2

    const-string v1, "Consumer can only be linked once."

    invoke-static {v1, p1}, Ljpo;->n(Ljava/lang/String;Z)V

    iput-boolean p2, v2, Lntk;->j:Z

    move-object v5, v3

    iget-object v3, v2, Lntk;->l:Lmtk;

    invoke-virtual {v3}, Lg07;->c()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    new-instance v1, Lltk;

    move-object v6, v0

    invoke-direct/range {v1 .. v6}, Lltk;-><init>(Lntk;Lmtk;ILuo2;Luo2;)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p2

    invoke-static {p1, v1, p2}, Lk1g;->i0(Lcom/google/common/util/concurrent/ListenableFuture;Led2;Ljava/util/concurrent/Executor;)Lfr4;

    move-result-object p1

    new-instance p2, Ld7h;

    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-direct {p2, v0, p0, v2, v1}, Ld7h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p0

    new-instance v0, Lwr9;

    invoke-direct {v0, p1, p2, v1}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, p0}, Lsr9;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public final q(Len8;Ls7m;)V
    .registers 11

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, [Lhyl;

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    array-length v3, v0

    if-ge v2, v3, :cond_70

    invoke-virtual {p2}, Ls7m;->a()V

    invoke-virtual {p2}, Ls7m;->b()V

    iget v3, p2, Ls7m;->d:I

    const/4 v4, 0x3

    invoke-interface {p1, v3, v4}, Len8;->track(II)Lhyl;

    move-result-object v3

    iget-object v4, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loj9;

    iget-object v5, v4, Loj9;->n:Ljava/lang/String;

    const-string v6, "application/cea-608"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_34

    const-string v6, "application/cea-708"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_34

    move v6, v1

    goto :goto_35

    :cond_34
    const/4 v6, 0x1

    :goto_35
    const-string v7, "Invalid closed caption MIME type provided: %s"

    invoke-static {v6, v7, v5}, Lz4o;->y(ZLjava/lang/String;Ljava/lang/Object;)V

    iget-object v6, v4, Loj9;->a:Ljava/lang/String;

    if-nez v6, :cond_43

    invoke-virtual {p2}, Ls7m;->b()V

    iget-object v6, p2, Ls7m;->e:Ljava/lang/String;

    :cond_43
    new-instance v7, Lnj9;

    invoke-direct {v7}, Lnj9;-><init>()V

    iput-object v6, v7, Lnj9;->a:Ljava/lang/String;

    const-string v6, "video/mp2t"

    invoke-static {v6}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v7, Lnj9;->l:Ljava/lang/String;

    invoke-static {v5}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v7, Lnj9;->m:Ljava/lang/String;

    iget v5, v4, Loj9;->e:I

    iput v5, v7, Lnj9;->e:I

    iget-object v5, v4, Loj9;->d:Ljava/lang/String;

    iput-object v5, v7, Lnj9;->d:Ljava/lang/String;

    iget v5, v4, Loj9;->K:I

    iput v5, v7, Lnj9;->J:I

    iget-object v4, v4, Loj9;->q:Ljava/util/List;

    iput-object v4, v7, Lnj9;->p:Ljava/util/List;

    invoke-static {v7, v3}, Lz1m;->q(Lnj9;Lhyl;)V

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_70
    return-void
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Lw3g;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lx5g;

    iget-object v0, p0, Lx5g;->e:La4g;

    if-eqz v0, :cond_18

    iget-object v1, v0, La4g;->a:Ljava/util/List;

    invoke-static {v1, p1}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v2

    iget-wide v3, v0, La4g;->b:J

    invoke-static {v3, v4, v2}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_18
    iget-object p0, p0, Lx5g;->d:Lw4g;

    iget-object p0, p0, Lw4g;->a:Lvnj;

    invoke-static {p1}, Lw4g;->a(Lw3g;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->j(Lknj;)V

    return-void
.end method

.method public final s(I)Landroid/content/res/ColorStateList;
    .registers 4

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1c

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_1c

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {v1, p0}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_1c

    return-object p0

    :cond_1c
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public final t(I)Landroid/graphics/drawable/Drawable;
    .registers 4

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_1a

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {v1, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_1a
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final u(I)Landroid/graphics/drawable/Drawable;
    .registers 4

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    if-eqz p1, :cond_1e

    invoke-static {}, Landroidx/appcompat/widget/AppCompatDrawableManager;->a()Landroidx/appcompat/widget/AppCompatDrawableManager;

    move-result-object v0

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {v0, p1, p0}, Landroidx/appcompat/widget/AppCompatDrawableManager;->c(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_1e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final v(IILrq1;)Landroid/graphics/Typeface;
    .registers 13

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_26

    iget-object p1, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p1, Landroid/util/TypedValue;

    if-nez p1, :cond_18

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    iput-object p1, p0, Lghf;->d:Ljava/lang/Object;

    :cond_18
    move-object v4, p1

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    sget-object p0, Landroidx/core/content/res/ResourcesCompat;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Landroid/content/Context;->isRestricted()Z

    move-result p0

    if-eqz p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return-object p0

    :cond_28
    const/4 v7, 0x1

    const/4 v8, 0x0

    move v5, p2

    move-object v6, p3

    invoke-static/range {v2 .. v8}, Landroidx/core/content/res/ResourcesCompat;->c(Landroid/content/Context;ILandroid/util/TypedValue;ILdbh;ZZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public final w(Lnpg;)Llrg;
    .registers 9

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lnpg;->d:Lirg;

    if-nez v1, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    iget-object v2, p1, Lnpg;->a:Ljava/lang/String;

    iget-object p1, p1, Lnpg;->g:Ljava/util/List;

    move-object v3, p1

    check-cast v3, Ljava/util/Collection;

    if-eqz v3, :cond_4b

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4b

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcqg;

    iget-object v5, v4, Lcqg;->a:Ljava/lang/String;

    iget-object v6, v4, Lcqg;->b:Lirg;

    invoke-static {v0, v5, v6}, Lghf;->y(Ljava/util/Map;Ljava/lang/String;Lirg;)Llrg;

    iget-object v4, v4, Lcqg;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    :cond_3b
    iget-object p1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-static {p0, v2, v1}, Lghf;->y(Ljava/util/Map;Ljava/lang/String;Lirg;)Llrg;

    move-result-object p0

    return-object p0

    :cond_4b
    invoke-static {v0, v2, v1}, Lghf;->y(Ljava/util/Map;Ljava/lang/String;Lirg;)Llrg;

    move-result-object p0

    return-object p0
.end method

.method public final x(Ljava/lang/String;Ljava/util/Map;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lpbi;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lpbi;

    iget v1, v0, Lpbi;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpbi;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lpbi;

    invoke-direct {v0, p0, p3}, Lpbi;-><init>(Lghf;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lpbi;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lpbi;->x:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2c

    iget-object p1, v0, Lpbi;->u:Ljava/lang/String;

    iget-object p0, v0, Lpbi;->t:Lghf;

    :try_start_28
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_7d

    goto :goto_67

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_35
    iget-object p3, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p3, Lu7d;

    invoke-virtual {p3}, Lu7d;->a()Ljava/lang/String;

    move-result-object p3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "/ruleSet/"

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ".json"

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iget-object v2, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v2, Leqa;

    iput-object p0, v0, Lpbi;->t:Lghf;

    iput-object p1, v0, Lpbi;->u:Ljava/lang/String;

    iput v3, v0, Lpbi;->x:I

    invoke-virtual {v2, p3, p2, v0}, Leqa;->b(Ljava/lang/String;Ljava/util/Map;Lmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_67

    return-object v1

    :cond_67
    :goto_67
    move-object p2, p3

    check-cast p2, Lgqa;

    iget p2, p2, Lgqa;->c:I

    const/16 v0, 0x193

    if-eq p2, v0, :cond_75

    const/16 v0, 0x194

    if-eq p2, v0, :cond_75

    return-object p3

    :cond_75
    new-instance p2, Lhwm;

    const-string p3, "Unable to initialise due to wrong configuration, please make sure your settingsID/ruleSetID is correct."

    invoke-direct {p2, p3, v4}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_7d} :catch_7d

    :catch_7d
    move-exception p2

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lowm;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Failed while fetching ruleSet using id: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p2}, Lowm;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    instance-of p0, p2, Lhwm;

    if-eqz p0, :cond_9a

    move-object v4, p2

    check-cast v4, Lhwm;

    :cond_9a
    if-nez v4, :cond_a3

    new-instance v4, Lhwm;

    const-string p0, "Unable to initialise due to poor or no network connection while fetching the rule Set."

    invoke-direct {v4, p0, p2}, Lhwm;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_a3
    throw v4
.end method

.method public final z(I)Lzsf;
    .registers 5

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, [Lzsf;

    aget-object v1, v0, p1

    if-nez v1, :cond_2a

    sget-object v1, Lcom/opera/android/osp/OspCollectorService;->g:Ljava/util/HashMap;

    iget-object v2, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwbk;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    iget-object v1, v1, Lwbk;->a:Lz43;

    iget-object v1, v1, Lz43;->i:Ljava/lang/Object;

    check-cast v1, Lxbk;

    invoke-virtual {v1, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzsf;

    aput-object p0, v0, p1

    :cond_2a
    aget-object p0, v0, p1

    return-object p0
.end method
