.class public final Lqt5;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lhnd;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lqt5;->a:B

    iput-object p1, p0, Lqt5;->h:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqt5;->b:Ljava/lang/Object;

    iget-object p1, p1, Lhnd;->i:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lqt5;->c:Ljava/lang/Object;

    const v0, 0x7f0406d5

    invoke-static {v0, p1}, Lo0g;->T(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lqt5;->d:Ljava/lang/Object;

    const v0, 0x7f0406de

    invoke-static {v0, p1}, Lo0g;->T(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lqt5;->e:Ljava/lang/Object;

    const v0, 0x7f0406db

    invoke-static {v0, p1}, Lo0g;->T(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lqt5;->f:Ljava/lang/Object;

    const v0, 0x7f0406da

    invoke-static {v0, p1}, Lo0g;->T(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lqt5;->g:Ljava/lang/Object;

    invoke-virtual {p0}, Lqt5;->G()V

    return-void
.end method

.method public constructor <init>(Lrt5;Lrt5;Ls2;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lqt5;->a:B

    .line 63
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 64
    iput-object p1, p0, Lqt5;->b:Ljava/lang/Object;

    .line 65
    iput-object p2, p0, Lqt5;->c:Ljava/lang/Object;

    .line 66
    iput-object p3, p0, Lqt5;->d:Ljava/lang/Object;

    .line 67
    sget-object p1, Ll08;->a:Ll08;

    .line 68
    iput-object p1, p0, Lqt5;->e:Ljava/lang/Object;

    .line 69
    new-instance p2, Lyv4;

    const/4 p3, 0x3

    invoke-direct {p2, p3}, Lyv4;-><init>(B)V

    iput-object p2, p0, Lqt5;->g:Ljava/lang/Object;

    .line 70
    new-instance p2, Lpde;

    const/4 p3, 0x0

    .line 71
    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 72
    iput-object p2, p0, Lqt5;->h:Ljava/lang/Object;

    .line 73
    iput-object p1, p0, Lqt5;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final G()V
    .registers 7

    iget-object v0, p0, Lqt5;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    new-instance v1, Lfnd;

    iget-object v2, p0, Lqt5;->h:Ljava/lang/Object;

    check-cast v2, Lhnd;

    iget-object v3, v2, Lhnd;->i:Landroid/content/Context;

    const v4, 0x7f140a6f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lfnd;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, v2, Lhnd;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_23
    if-ge v3, v2, :cond_36

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lcod;

    new-instance v5, Lfnd;

    invoke-direct {v5, v4}, Lfnd;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    :cond_36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final H(Ljava/util/ArrayList;)V
    .registers 10

    iput-object p1, p0, Lqt5;->e:Ljava/lang/Object;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v1, :cond_2e

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lj8f;

    new-instance v4, Lyt5;

    invoke-interface {v3}, Lj8f;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lj8f;->c()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Lj8f;->d()Ljava/lang/Double;

    move-result-object v7

    invoke-interface {v3}, Lj8f;->b()Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v4, v5, v6, v7, v3}, Lyt5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;Landroid/net/Uri;)V

    invoke-virtual {v0, v4}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_2e
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p1

    iput-object p1, p0, Lqt5;->f:Ljava/lang/Object;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object p1, p0, Lqt5;->h:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p0, p0, Lqt5;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move-object v1, v0

    :cond_45
    :goto_45
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_62

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj8f;

    invoke-interface {v2}, Lj8f;->a()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_63

    if-nez v1, :cond_5b

    move-object v1, v2

    goto :goto_45

    :cond_5b
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_45

    goto :goto_63

    :cond_62
    move-object v0, v1

    :cond_63
    :goto_63
    invoke-static {p1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final getItemCount()I
    .registers 2

    iget-byte v0, p0, Lqt5;->a:B

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lqt5;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    iget-object p0, p0, Lqt5;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final getItemId(I)J
    .registers 7

    iget-byte v0, p0, Lqt5;->a:B

    packed-switch v0, :pswitch_data_38

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    iget-object v0, p0, Lqt5;->g:Ljava/lang/Object;

    check-cast v0, Lyv4;

    iget-object p0, p0, Lqt5;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    iget-object p1, v0, Lyv4;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    if-eqz v1, :cond_27

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    goto :goto_36

    :cond_27
    iget-wide v1, v0, Lyv4;->b:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    iput-wide v3, v0, Lyv4;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-wide p0, v1

    :goto_36
    return-wide p0

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-byte v0, p0, Lqt5;->a:B

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lqt5;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfnd;

    iget-byte p0, p0, Lfnd;->b:B

    return p0

    :pswitch_12
    const p0, 0x7f0d00db

    return p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 12

    iget-byte v0, p0, Lqt5;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_13c

    invoke-virtual {p0, p2}, Lqt5;->getItemViewType(I)I

    move-result v0

    iget-object p0, p0, Lqt5;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfnd;

    if-eq v0, v3, :cond_85

    const/4 p2, 0x2

    if-ne v0, p2, :cond_95

    check-cast p1, Lgnd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lfnd;->a:Ljava/lang/Object;

    check-cast p0, Lcod;

    iget-object v0, p1, Lgnd;->b:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p1, Lgnd;->d:Landroid/widget/ProgressBar;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Ljf7;

    const/16 v4, 0x14

    invoke-direct {v2, p1, p0, v4}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p1, Lgnd;->e:Landroid/widget/TextView;

    iget-object v2, p0, Lcod;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lgnd;->c:Landroid/widget/ImageView;

    iget-object p1, p1, Lgnd;->f:Lqt5;

    iget-object v2, p0, Lcod;->f:Landroid/net/Uri;

    if-eqz v2, :cond_60

    :try_start_48
    iget-object v4, p1, Lqt5;->h:Ljava/lang/Object;

    check-cast v4, Lhnd;

    iget-object v4, v4, Lhnd;->i:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_5a} :catch_5d

    if-eqz v1, :cond_60

    goto :goto_81

    :catch_5d
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_60
    iget v1, p0, Lcod;->n:I

    if-eq v1, v3, :cond_7c

    if-eq v1, p2, :cond_77

    invoke-virtual {p0}, Lcod;->e()Z

    move-result p0

    if-eqz p0, :cond_72

    iget-object p0, p1, Lqt5;->g:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    :goto_70
    move-object v1, p0

    goto :goto_81

    :cond_72
    iget-object p0, p1, Lqt5;->d:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    goto :goto_70

    :cond_77
    iget-object p0, p1, Lqt5;->f:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    goto :goto_70

    :cond_7c
    iget-object p0, p1, Lqt5;->e:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    goto :goto_70

    :goto_81
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_95

    :cond_85
    check-cast p1, Lend;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lfnd;->a:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lend;->b:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_95
    :goto_95
    return-void

    :pswitch_96
    check-cast p1, Lxt5;

    iget-object p0, p0, Lqt5;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyt5;

    iget-object p2, p1, Lxt5;->b:Lor2;

    iget-object v0, p2, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, p0, Lyt5;->a:Ljava/lang/String;

    iget-object v5, p0, Lyt5;->c:Ljava/lang/Double;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lyt5;->b:Ljava/lang/String;

    if-eqz v0, :cond_e5

    const/16 v4, 0x3a

    const/4 v6, 0x6

    invoke-static {v0, v4, v2, v6}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, -0x1

    if-ne v4, v7, :cond_c2

    move-object v6, v1

    :cond_c2
    if-eqz v6, :cond_e5

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4, v0}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :try_start_cc
    invoke-static {v6}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object v6
    :try_end_d0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_cc .. :try_end_d0} :catch_e5

    add-int/2addr v4, v3

    :try_start_d1
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7
    :try_end_d9
    .catch Ljava/lang/NumberFormatException; {:try_start_d1 .. :try_end_d9} :catch_e5

    invoke-static {}, Ljava/text/NumberFormat;->getCurrencyInstance()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/text/NumberFormat;->setCurrency(Ljava/util/Currency;)V

    invoke-virtual {v0, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_e6

    :catch_e5
    :cond_e5
    move-object v0, v1

    :goto_e6
    iget-object v4, p2, Lor2;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    const/16 v6, 0x8

    if-eqz v0, :cond_f0

    move v7, v2

    goto :goto_f1

    :cond_f0
    move v7, v6

    :goto_f1
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p2, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    if-nez v5, :cond_fe

    move v2, v6

    :cond_fe
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz v5, :cond_11e

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    const-string v4, "%.1f"

    invoke-static {v0, v4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11f

    :cond_11e
    move-object v0, v1

    :goto_11f
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Lxt5;->U(Landroid/graphics/Bitmap;)V

    sget-object p2, Lyne;->b:Ldeg;

    iget-object p0, p0, Lyt5;->d:Landroid/net/Uri;

    invoke-virtual {p2, p0}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p0

    new-instance p2, Lphi;

    new-instance v0, Ltu;

    invoke-direct {v0, p1, v3}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, v0}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p0, p2}, Ldwh;->f(Lacl;)V

    return-void

    nop

    :pswitch_data_13c
    .packed-switch 0x0
        :pswitch_96
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 12

    iget-byte v0, p0, Lqt5;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_b2

    iget-object v0, p0, Lqt5;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/LayoutInflater;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p2, v2, :cond_22

    const/4 v2, 0x2

    if-ne p2, v2, :cond_1e

    const p2, 0x7f0d02a7

    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance v1, Lgnd;

    invoke-direct {v1, p0, p1}, Lgnd;-><init>(Lqt5;Landroid/view/View;)V

    goto :goto_39

    :cond_1e
    invoke-static {}, Lh9o;->e()V

    goto :goto_39

    :cond_22
    const p0, 0x7f0d02a6

    invoke-virtual {v0, p0, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    new-instance v1, Lend;

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const p1, 0x7f0a0713

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iput-object p0, v1, Lend;->b:Landroid/widget/TextView;

    :goto_39
    return-object v1

    :pswitch_3a
    iget-object p1, p0, Lqt5;->b:Ljava/lang/Object;

    check-cast p1, Lrt5;

    const p2, 0x7f0d00db

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lrt5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/view/View;

    const p1, 0x7f0a02d7

    invoke-static {p1, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/Barrier;

    if-eqz p2, :cond_a0

    const p1, 0x7f0a0571

    invoke-static {p1, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_a0

    const p1, 0x7f0a0866

    invoke-static {p1, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_a0

    const p1, 0x7f0a08a0

    invoke-static {p1, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_a0

    const p1, 0x7f0a06c5

    invoke-static {p1, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    move-object v7, p2

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_a0

    new-instance v2, Lor2;

    const/4 v8, 0x5

    invoke-direct/range {v2 .. v8}, Lor2;-><init>(Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;B)V

    new-instance v1, Lxt5;

    new-instance p1, Lwg5;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lcv2;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v2, v0}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, p1, p2}, Lxt5;-><init>(Lor2;Lwg5;Lcv2;)V

    goto :goto_b1

    :cond_a0
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b1
    return-object v1

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
