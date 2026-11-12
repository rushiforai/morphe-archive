.class public final Li9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhh4;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(La5l;Ljava/lang/String;Lp6l;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    .line 282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li9c;->g:Ljava/lang/Object;

    .line 283
    iput-object p2, p0, Li9c;->c:Ljava/lang/Object;

    .line 284
    iput-object p3, p0, Li9c;->d:Ljava/lang/Object;

    .line 285
    iput-object p4, p0, Li9c;->e:Ljava/lang/Object;

    .line 286
    iget-object p2, p1, La5l;->a:Lumi;

    .line 287
    new-instance p3, Lrml;

    sget-object p4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p3, p4, p2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    .line 288
    new-instance p2, Ld7k;

    const/16 p4, 0xe

    invoke-direct {p2, p1, p0, p4}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p2

    .line 289
    iget-object p1, p1, La5l;->g:Lqie;

    .line 290
    invoke-virtual {p2, p1}, Lplk;->m(Lqie;)Lp1j;

    move-result-object p1

    iput-object p1, p0, Li9c;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 292
    iput-object p1, p0, Li9c;->c:Ljava/lang/Object;

    .line 293
    sget-object p1, Luf2;->c:Luf2;

    iput-object p1, p0, Li9c;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lye3;Lmgh;)V
    .registers 5

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzcf;->zzk()Lcom/google/android/gms/internal/play_billing/zzcf;

    move-result-object v0

    iput-object v0, p0, Li9c;->g:Ljava/lang/Object;

    iput-object p1, p0, Li9c;->c:Ljava/lang/Object;

    iput-object p2, p0, Li9c;->d:Ljava/lang/Object;

    iput-object p3, p0, Li9c;->e:Ljava/lang/Object;

    new-instance p1, Luop;

    const/4 p2, 0x1

    .line 295
    invoke-direct {p1, p0, p2}, Luop;-><init>(Li9c;Z)V

    iput-object p1, p0, Li9c;->a:Ljava/lang/Object;

    new-instance p1, Luop;

    const/4 p2, 0x0

    .line 296
    invoke-direct {p1, p0, p2}, Luop;-><init>(Li9c;Z)V

    iput-object p1, p0, Li9c;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lcie;Li16;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Li9c;->a:Ljava/lang/Object;

    iput-object p2, p0, Li9c;->c:Ljava/lang/Object;

    iput-object p3, p0, Li9c;->f:Ljava/lang/Object;

    iput-object p1, p0, Li9c;->d:Ljava/lang/Object;

    sget-object p3, Lr5n;->a:Ljava/util/WeakHashMap;

    const p3, 0x7f0a0445

    invoke-static {p1, p3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    check-cast p3, Landroid/view/ViewGroup;

    iput-object p3, p0, Li9c;->e:Ljava/lang/Object;

    const p3, 0x7f0a0451

    iget-object v0, p2, Lcie;->F:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Li9c;->d(ILjava/lang/CharSequence;)Landroid/widget/TextView;

    const p3, 0x7f0a0447

    iget-object v0, p2, Lcie;->G:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Li9c;->d(ILjava/lang/CharSequence;)Landroid/widget/TextView;

    const p3, 0x7f0a0450

    iget-object v0, p2, Lcie;->H:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Li9c;->d(ILjava/lang/CharSequence;)Landroid/widget/TextView;

    const p3, 0x7f0a044b

    iget-object v0, p2, Lcie;->q:Ljava/lang/String;

    invoke-virtual {p0, p3, v0}, Li9c;->d(ILjava/lang/CharSequence;)Landroid/widget/TextView;

    invoke-static {p2, p1}, Lg10;->o0(Lcie;Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p3

    new-instance v0, Lsma;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lsma;-><init>(Ljava/lang/Object;B)V

    sget v1, Lx00;->f:I

    instance-of v1, p3, Landroid/text/Spannable;

    const/4 v2, 0x0

    if-eqz v1, :cond_67

    move-object v1, p3

    check-cast v1, Landroid/text/Spannable;

    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const-class v4, Lx00;

    invoke-interface {v1, v2, v3, v4}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lx00;

    array-length v3, v1

    if-lez v3, :cond_67

    aget-object v1, v1, v2

    iput-object v0, v1, Lx00;->e:Landroid/view/View$OnClickListener;

    :cond_67
    const v0, 0x7f0a0453

    invoke-virtual {p0, v0, p3}, Li9c;->d(ILjava/lang/CharSequence;)Landroid/widget/TextView;

    move-result-object p3

    invoke-static {p3}, Lvwj;->a(Landroid/widget/TextView;)V

    const p3, 0x7f0a044e

    invoke-static {p1, p3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    check-cast p3, Landroid/widget/ImageView;

    iget-object v0, p2, Lcie;->p:Ljava/lang/String;

    invoke-static {p3, p1}, Lga6;->m(Landroid/widget/ImageView;Landroid/view/View;)Lga6;

    move-result-object p1

    invoke-static {v0, p3, p1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    iget-object p1, p2, Lcie;->I:Ljava/util/ArrayList;

    sget-object p2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-nez p1, :cond_8c

    move-object p1, p2

    :cond_8c
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_92
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_be

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lk7c;

    new-instance p3, Lh9c;

    iget-object v0, p0, Li9c;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v1, Ldnb;

    const/4 v3, 0x6

    invoke-direct {v1, p0, v3}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, v0, p2, v1}, Lh9c;-><init>(Landroid/view/ViewGroup;Lk7c;Ldnb;)V

    iget-object p2, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Li9c;->e:Ljava/lang/Object;

    check-cast p2, Landroid/view/ViewGroup;

    iget-object p3, p3, Lh9c;->b:Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_92

    :cond_be
    iget-object p1, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    move p3, v2

    :cond_c7
    if-ge p3, p2, :cond_d6

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p3, p3, 0x1

    check-cast v0, Lh9c;

    iget-boolean v0, v0, Lh9c;->f:Z

    if-nez v0, :cond_c7

    goto :goto_d7

    :cond_d6
    const/4 v2, 0x1

    :goto_d7
    iget-boolean p1, p0, Li9c;->b:Z

    if-eq p1, v2, :cond_ea

    iput-boolean v2, p0, Li9c;->b:Z

    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_ea

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_ea
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lncn;)V
    .registers 11

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 252
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Li9c;->e:Ljava/lang/Object;

    .line 253
    iput-object v1, p0, Li9c;->a:Ljava/lang/Object;

    .line 254
    iput-object v1, p0, Li9c;->f:Ljava/lang/Object;

    .line 255
    iput-object v1, p0, Li9c;->g:Ljava/lang/Object;

    .line 256
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Li9c;->c:Ljava/lang/Object;

    .line 257
    iput-object p2, p0, Li9c;->d:Ljava/lang/Object;

    .line 258
    new-instance v1, Ldvb;

    const-string v2, "**"

    const-string v3, "ThemeColor"

    filled-new-array {v2, v3, v2}, [Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object v4, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lwcn;

    invoke-direct {v6, p0, v0}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v1, v5, v6}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 259
    new-instance v0, Ldvb;

    const-string v1, "ThemeStroke"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ldvb;-><init>([Ljava/lang/String;)V

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lwcn;

    invoke-direct {v7, p0, v4}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v6, v7}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 260
    new-instance v0, Ldvb;

    filled-new-array {v2, v3, v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v6, Lwcn;

    invoke-direct {v6, p0, v5}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v6}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 261
    new-instance v0, Ldvb;

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v1, Lwcn;

    const/4 v5, 0x3

    invoke-direct {v1, p0, v5}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v1}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 262
    new-instance v0, Ldvb;

    const-string v1, "GradientLight"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v1, Lwcn;

    invoke-direct {v1, p0, v3}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v1}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 263
    new-instance v0, Ldvb;

    const-string v1, "GradientStrokeLight"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v1, Lwcn;

    const/4 v3, 0x5

    invoke-direct {v1, p0, v3}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v1}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 264
    new-instance v0, Ldvb;

    const-string v1, "GradientDark"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v1, Lwcn;

    const/4 v3, 0x6

    invoke-direct {v1, p0, v3}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v1}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 265
    new-instance v0, Ldvb;

    const-string v1, "GradientStrokeDark"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v1, Lwcn;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lwcn;-><init>(Li9c;B)V

    invoke-virtual {p2, v0, v4, v1}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    .line 266
    new-instance p2, Lsvk;

    const/16 v0, 0x16

    invoke-direct {p2, p0, v0}, Lsvk;-><init>(Ljava/lang/Object;B)V

    .line 267
    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-eqz p0, :cond_d3

    .line 268
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    .line 269
    :cond_d3
    invoke-virtual {p2, p1}, Lsvk;->a(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lndc;Lghj;Lk42;Lx5f;)V
    .registers 5

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iput-object p1, p0, Li9c;->c:Ljava/lang/Object;

    .line 237
    iput-object p2, p0, Li9c;->d:Ljava/lang/Object;

    .line 238
    iput-object p3, p0, Li9c;->e:Ljava/lang/Object;

    .line 239
    iput-object p4, p0, Li9c;->f:Ljava/lang/Object;

    .line 240
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Li9c;->a:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 241
    iput-boolean p1, p0, Li9c;->b:Z

    return-void
.end method

.method public constructor <init>(Lru9;Ldb;Lydn;)V
    .registers 8

    .line 270
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 271
    new-instance v0, Lnj2;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Li9c;->a:Ljava/lang/Object;

    .line 272
    new-instance v1, Lnlk;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lnlk;-><init>(Ljava/lang/Object;B)V

    .line 273
    iput-object p1, p0, Li9c;->c:Ljava/lang/Object;

    .line 274
    iput-object p2, p0, Li9c;->d:Ljava/lang/Object;

    .line 275
    iput-object p3, p0, Li9c;->e:Ljava/lang/Object;

    .line 276
    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    .line 277
    const-string v2, "vpn.vpnpro_expected"

    const/4 v3, 0x0

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 278
    iput-boolean p1, p0, Li9c;->b:Z

    if-eqz p1, :cond_28

    .line 279
    invoke-virtual {p2, v0}, Ldb;->a(Lcb;)V

    .line 280
    :cond_28
    invoke-virtual {p3, v1}, Lydn;->b(Ltdn;)V

    .line 281
    invoke-virtual {p0}, Li9c;->c()V

    return-void
.end method

.method public constructor <init>(Lumi;Lndc;Lkw3;Lhx5;Lydp;Lii;)V
    .registers 7

    sget-object p5, Lngh;->a:Lr16;

    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 243
    iput-object p1, p0, Li9c;->c:Ljava/lang/Object;

    .line 244
    iput-object p3, p0, Li9c;->d:Ljava/lang/Object;

    .line 245
    iput-object p4, p0, Li9c;->e:Ljava/lang/Object;

    .line 246
    iput-object p6, p0, Li9c;->a:Ljava/lang/Object;

    .line 247
    new-instance p3, Li32;

    invoke-direct {p3, p0, p1}, Li32;-><init>(Li9c;Lumi;)V

    iput-object p3, p0, Li9c;->g:Ljava/lang/Object;

    .line 248
    new-instance p1, Lt77;

    const/4 p5, 0x3

    invoke-direct {p1, p0, p5}, Lt77;-><init>(Ljava/lang/Object;B)V

    .line 249
    invoke-virtual {p3}, Lldk;->h()V

    .line 250
    invoke-virtual {p4, p2, p1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Li9c;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const v1, 0x7f040315

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Li9c;->e:Ljava/lang/Object;

    const v1, 0x7f040a77

    invoke-static {v1, v0}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v0

    iget-boolean v1, p0, Li9c;->b:Z

    const/4 v2, 0x0

    const/16 v3, 0x64

    if-eqz v1, :cond_26

    if-eqz v0, :cond_26

    move v1, v3

    goto :goto_27

    :cond_26
    move v1, v2

    :goto_27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Li9c;->a:Ljava/lang/Object;

    iget-boolean v1, p0, Li9c;->b:Z

    if-eqz v1, :cond_35

    if-nez v0, :cond_35

    move v0, v3

    goto :goto_36

    :cond_35
    move v0, v2

    :goto_36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Li9c;->f:Ljava/lang/Object;

    iget-boolean v0, p0, Li9c;->b:Z

    if-nez v0, :cond_41

    move v2, v3

    :cond_41
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Li9c;->g:Ljava/lang/Object;

    iget-object p0, p0, Li9c;->d:Ljava/lang/Object;

    check-cast p0, Lncn;

    invoke-virtual {p0}, Lf3d;->invalidateSelf()V

    return-void
.end method

.method public final b(Ljd7;Landroid/net/Uri;)V
    .registers 9

    invoke-virtual {p1}, Ljd7;->c()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    invoke-virtual {p1}, Ljd7;->b()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_52

    iget-boolean p2, p0, Li9c;->b:Z

    if-nez p2, :cond_52

    const/4 p2, 0x1

    iput-boolean p2, p0, Li9c;->b:Z

    iget-object v0, p0, Li9c;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v3, Ljdb;

    const/4 v4, 0x0

    invoke-direct {v3, p0, p1, v4}, Ljdb;-><init>(Li9c;Landroid/net/Uri;B)V

    new-instance v4, Lo62;

    const/4 v5, 0x4

    invoke-direct {v4, v3, v5}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v4}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v3

    new-instance v4, Lplk;

    new-instance v5, Leyi;

    invoke-direct {v5, v2, v3}, Leyi;-><init>(Ljava/lang/Object;Lnml;)V

    invoke-direct {v4, v0, v3, v5, v1}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ljdb;

    invoke-direct {v0, p0, p1, p2}, Ljdb;-><init>(Li9c;Landroid/net/Uri;B)V

    invoke-virtual {v4, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :cond_49
    if-eqz p2, :cond_52

    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Li32;

    invoke-virtual {p0, v1}, Lldk;->g(Ljava/lang/Object;)V

    :cond_52
    return-void
.end method

.method public final c()V
    .registers 8

    iget-object v0, p0, Li9c;->d:Ljava/lang/Object;

    check-cast v0, Ldb;

    iget-object v1, p0, Li9c;->e:Ljava/lang/Object;

    check-cast v1, Lydn;

    iget-object v2, v1, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_21

    iget-object v1, v0, Ldb;->a:Lbb;

    iget-boolean v1, v1, Lbb;->f:Z

    if-eqz v1, :cond_89

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_89

    invoke-virtual {p0, v3}, Li9c;->e(Z)V

    return-void

    :cond_21
    iget-boolean v2, p0, Li9c;->b:Z

    if-eqz v2, :cond_83

    iget-object v1, v1, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    if-eqz v1, :cond_83

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_83

    iget-object v0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast v0, Lqim;

    if-eqz v0, :cond_89

    iget-object v1, p0, Li9c;->g:Ljava/lang/Object;

    check-cast v1, Lgkj;

    if-nez v1, :cond_89

    new-instance v1, Lrxh;

    const v2, 0x7f1413db

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Lr2n;

    const/4 v4, 0x4

    invoke-direct {v2, p0, v4}, Lr2n;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lgkj;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5}, Lnz0;-><init>(ZZ)V

    const/4 v6, 0x0

    iput-object v6, v4, Lgkj;->a:Ljava/lang/String;

    iput-object v6, v4, Lgkj;->b:Ljava/lang/String;

    iput-object v6, v4, Lgkj;->c:Ljava/lang/String;

    iput-object v6, v4, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v6, v4, Lgkj;->e:Lekj;

    iput-object v2, v4, Lgkj;->f:Lfkj;

    iput-object v6, v4, Lgkj;->g:Lqp2;

    iput-object v6, v4, Lgkj;->h:Ldkj;

    iput-object v6, v4, Lgkj;->i:Ldkj;

    iput-object v6, v4, Lgkj;->j:Lql;

    const v2, 0x7f140bbb

    iput v2, v4, Lgkj;->k:I

    iput v5, v4, Lgkj;->l:I

    const v2, 0x7f1413dc

    iput v2, v4, Lgkj;->m:I

    iput-boolean v3, v4, Lgkj;->n:Z

    iput-object v1, v4, Lgkj;->o:Lpxh;

    iput-object v4, p0, Li9c;->g:Ljava/lang/Object;

    iget-object p0, v0, Lqim;->c:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_83
    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Lgkj;

    if-nez p0, :cond_8a

    :cond_89
    return-void

    :cond_8a
    sget-object v0, Lhjm;->b:Lhjm;

    invoke-interface {p0, v0}, Ljjm;->finish(Lhjm;)V

    return-void
.end method

.method public final cancel()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Li9c;->b:Z

    iget-object v0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast v0, Lp1j;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lp1j;->cancel(Z)Z

    iget-object p0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p0, Lhh4;

    if-eqz p0, :cond_14

    invoke-interface {p0}, Lhh4;->cancel()V

    :cond_14
    return-void
.end method

.method public final d(ILjava/lang/CharSequence;)Landroid/widget/TextView;
    .registers 4

    iget-object p0, p0, Li9c;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1a

    const/16 p1, 0x8

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-object p0
.end method

.method public final e(Z)V
    .registers 6

    iget-object v0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast v0, Lnj2;

    iget-object v1, p0, Li9c;->d:Ljava/lang/Object;

    check-cast v1, Ldb;

    iget-object v2, p0, Li9c;->g:Ljava/lang/Object;

    check-cast v2, Lgkj;

    if-eqz v2, :cond_13

    sget-object v3, Lhjm;->b:Lhjm;

    invoke-interface {v2, v3}, Ljjm;->finish(Lhjm;)V

    :cond_13
    iget-boolean v2, p0, Li9c;->b:Z

    if-ne v2, p1, :cond_18

    return-void

    :cond_18
    iput-boolean p1, p0, Li9c;->b:Z

    iget-object p0, p0, Li9c;->c:Ljava/lang/Object;

    check-cast p0, Lru9;

    const-string v2, "vpn.vpnpro_expected"

    if-eqz p1, :cond_35

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const/4 v3, 0x1

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    invoke-virtual {v1, v0}, Ldb;->a(Lcb;)V

    return-void

    :cond_35
    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    invoke-virtual {v1, v0}, Ldb;->h(Lcb;)V

    return-void
.end method

.method public final f(Lisl;)V
    .registers 3

    iget-object p0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_11

    :cond_21
    return-void
.end method

.method public final g()V
    .registers 12

    iget-object v0, p0, Li9c;->c:Ljava/lang/Object;

    check-cast v0, Lcie;

    const/4 v1, 0x0

    :try_start_5
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "description"

    iget-object v4, v0, Lcie;->r:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    iget-object v4, p0, Li9c;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v1

    :goto_1f
    if-ge v6, v5, :cond_4e

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lh9c;

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "leadType"

    iget-object v10, v7, Lh9c;->a:Lk7c;

    iget v10, v10, Lk7c;->a:I

    invoke-static {v10}, Lj7c;->i(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "content"

    iget-object v7, v7, Lh9c;->d:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1f

    :cond_4e
    const-string v4, "leadsItems"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v2, v0, Lcie;->N:Ljava/util/ArrayList;

    if-eqz v2, :cond_8f

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8f

    iget-object v2, v0, Lcie;->N:Ljava/util/ArrayList;

    new-instance v10, Lz0c;

    const/16 v3, 0x19

    invoke-direct {v10, v0, v7, v3}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v3, v1

    :goto_6f
    if-ge v3, v0, :cond_8f

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_84

    invoke-static {v10}, Lhyg;->b(Lmjo;)V

    goto :goto_6f

    :cond_84
    new-instance v5, Ljro;

    const/4 v9, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v5 .. v10}, Ljro;-><init>(Ljava/lang/String;Ljava/lang/String;IILmjo;)V

    invoke-static {v5}, Lhyg;->c(Ljro;)V
    :try_end_8e
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_8e} :catch_8f

    goto :goto_6f

    :catch_8f
    :cond_8f
    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Li16;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Li16;->x(ZZ)V

    return-void
.end method
