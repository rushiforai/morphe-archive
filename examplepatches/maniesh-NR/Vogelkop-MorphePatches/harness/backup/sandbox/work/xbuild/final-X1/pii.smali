.class public final Lpii;
.super Lltl;
.source "SourceFile"


# instance fields
.field public A:[Ljava/lang/CharSequence;

.field public B:Lro9;

.field public C:[Ljava/lang/CharSequence;

.field public D:Lcom/google/android/material/textfield/TextInputLayout;

.field public E:I

.field public F:Lcii;

.field public final G:Llii;

.field public H:Lhii;

.field public I:Landroid/os/ParcelFileDescriptor;

.field public J:Lm9f;

.field public K:Lk8g;

.field public L:Z

.field public M:Z

.field public N:Z

.field public final r:Ljava/util/ArrayList;

.field public final s:Lumi;

.field public final t:Lx5f;

.field public u:Lqji;

.field public v:Lro9;

.field public w:[Ljava/lang/CharSequence;

.field public x:Lro9;

.field public y:[Ljava/lang/CharSequence;

.field public z:Lro9;


# direct methods
.method public constructor <init>(Lumi;Lx5f;Z)V
    .registers 8

    const v0, 0x7f0d036e

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140a3a

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->d:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    const/high16 v0, -0x80000000

    iput v0, p0, Lpii;->E:I

    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lhrd;->a:[Landroid/print/PrintAttributes$MediaSize;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lpii;->r:Ljava/util/ArrayList;

    new-instance v2, Lc9;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Lc9;-><init>(B)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object p1, p0, Lpii;->s:Lumi;

    iput-object p2, p0, Lpii;->t:Lx5f;

    const/4 p1, 0x0

    if-nez p3, :cond_4e

    invoke-static {}, Li0l;->g()Z

    move-result p2

    if-nez p2, :cond_4e

    new-instance p2, Lvzk;

    new-instance p3, Lkii;

    invoke-direct {p3, p0, p1}, Lkii;-><init>(Lpii;B)V

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p3, p2, Lvzk;->a:Ljava/lang/Object;

    iput-object p2, p0, Lpii;->G:Llii;

    return-void

    :cond_4e
    new-instance p2, Lr9i;

    new-instance p3, Lkii;

    invoke-direct {p3, p0, p1}, Lkii;-><init>(Lpii;B)V

    new-instance p1, Lkii;

    invoke-direct {p1, p0, v1}, Lkii;-><init>(Lpii;B)V

    invoke-direct {p2, p3, p1}, Lr9i;-><init>(Lkii;Lkii;)V

    iput-object p2, p0, Lpii;->G:Llii;

    return-void
.end method

.method public static varargs I0(Landroid/content/Context;[Ljava/lang/Integer;)[Ljava/lang/CharSequence;
    .registers 5

    array-length v0, p1

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v1, 0x0

    :goto_4
    array-length v2, p1

    if-ge v1, v2, :cond_16

    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_16
    return-object v0
.end method


# virtual methods
.method public final G0()V
    .registers 4

    iget-object v0, p0, Lpii;->u:Lqji;

    if-eqz v0, :cond_15

    iget-object v1, p0, Lpii;->F:Lcii;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    invoke-virtual {v0, v1}, Lqji;->e(Lnji;)V

    iput-object v2, p0, Lpii;->F:Lcii;

    :cond_e
    iget-object v0, p0, Lpii;->u:Lqji;

    invoke-virtual {v0}, Lqji;->b()V

    iput-object v2, p0, Lpii;->u:Lqji;

    :cond_15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-nez v0, :cond_1c

    return-void

    :cond_1c
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ldx3;

    if-eqz v0, :cond_39

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    const v1, 0x7f140747

    const/16 v2, 0x1388

    invoke-static {v1, v2, v0}, Lam2;->i(IILysj;)Lglj;

    move-result-object v1

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_39
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/w;->U()V

    return-void
.end method

.method public final H0(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpii;->L:Z

    new-instance v0, Low3;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, v1}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lpii;->s:Lumi;

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v1, Lbii;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lbii;-><init>(Lpii;B)V

    invoke-virtual {p1, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final J0()V
    .registers 3

    iget-object v0, p0, Lpii;->J:Lm9f;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lpii;->K:Lk8g;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lpii;->G:Llii;

    invoke-interface {v0, v1}, Llii;->y(Lk8g;)V

    iput-object v1, p0, Lpii;->K:Lk8g;

    :cond_11
    iget-object v0, p0, Lpii;->J:Lm9f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, p0, Lpii;->J:Lm9f;

    return-void
.end method

.method public final K0()V
    .registers 7

    const/4 v0, 0x1

    iget-object v1, p0, Lpii;->G:Llii;

    invoke-interface {v1, v0}, Llii;->g(Z)V

    iget-object v0, p0, Lpii;->J:Lm9f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v0, Lm9f;->b:I

    iget v3, v0, Lm9f;->a:I

    iget-object v4, p0, Lpii;->K:Lk8g;

    iget-object v0, v0, Lm9f;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/pdf/PdfRenderer;

    if-nez v4, :cond_2d

    new-instance v4, Lk8g;

    invoke-direct {v4}, Landroidx/recyclerview/widget/d;-><init>()V

    iput v3, v4, Lk8g;->a:I

    iput v2, v4, Lk8g;->b:I

    new-instance v2, Lro9;

    invoke-direct {v2, v0}, Lro9;-><init>(Landroid/graphics/pdf/PdfRenderer;)V

    iput-object v2, v4, Lk8g;->c:Lro9;

    iput-object v4, p0, Lpii;->K:Lk8g;

    invoke-interface {v1, v4}, Llii;->y(Lk8g;)V

    goto :goto_5d

    :cond_2d
    iget-object p0, v4, Lk8g;->c:Lro9;

    iget-object v5, p0, Lro9;->c:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/pdf/PdfRenderer;

    if-ne v5, v0, :cond_48

    iget v0, v4, Lk8g;->a:I

    if-ne v0, v3, :cond_3d

    iget v0, v4, Lk8g;->b:I

    if-eq v0, v2, :cond_5d

    :cond_3d
    iput v3, v4, Lk8g;->a:I

    iput v2, v4, Lk8g;->b:I

    iget p0, p0, Lro9;->b:I

    const/4 v0, 0x0

    invoke-virtual {v4, v0, p0}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    goto :goto_5d

    :cond_48
    iget-object p0, p0, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    new-instance p0, Lro9;

    invoke-direct {p0, v0}, Lro9;-><init>(Landroid/graphics/pdf/PdfRenderer;)V

    iput-object p0, v4, Lk8g;->c:Lro9;

    iput v3, v4, Lk8g;->a:I

    iput v2, v4, Lk8g;->b:I

    invoke-virtual {v4}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_5d
    :goto_5d
    invoke-interface {v1}, Llii;->q()V

    return-void
.end method

.method public final L0()V
    .registers 3

    iget-object v0, p0, Lpii;->u:Lqji;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    iget-object v1, p0, Lpii;->G:Llii;

    invoke-interface {v1, v0}, Llii;->g(Z)V

    const v0, 0x7f140d4c

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Llii;->n(Ljava/lang/String;)V

    const/4 p0, 0x4

    invoke-interface {v1, p0}, Llii;->l(I)V

    invoke-interface {v1}, Llii;->i()V

    return-void
.end method

.method public final M0()V
    .registers 3

    const/4 v0, 0x1

    iget-object v1, p0, Lpii;->G:Llii;

    invoke-interface {v1, v0}, Llii;->g(Z)V

    const v0, 0x7f140d4b

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0}, Llii;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-interface {v1, p0}, Llii;->l(I)V

    invoke-interface {v1}, Llii;->i()V

    return-void
.end method

.method public final N0()V
    .registers 7

    iget-object v0, p0, Lpii;->u:Lqji;

    iget-object v1, p0, Lpii;->v:Lro9;

    iget v1, v1, Lro9;->b:I

    iget-object v2, p0, Lpii;->r:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/print/PrintAttributes$MediaSize;

    iget-object v2, p0, Lpii;->x:Lro9;

    iget v2, v2, Lro9;->b:I

    if-nez v2, :cond_19

    invoke-virtual {v1}, Landroid/print/PrintAttributes$MediaSize;->asPortrait()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v1

    goto :goto_1d

    :cond_19
    invoke-virtual {v1}, Landroid/print/PrintAttributes$MediaSize;->asLandscape()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v1

    :goto_1d
    iget-object p0, p0, Lpii;->z:Lro9;

    iget p0, p0, Lro9;->b:I

    if-nez p0, :cond_3e

    invoke-virtual {v1}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    move-result p0

    const/16 v2, 0x18a

    const/4 v3, 0x0

    const/16 v4, 0x3e8

    if-ge p0, v4, :cond_30

    move p0, v3

    goto :goto_31

    :cond_30
    move p0, v2

    :goto_31
    invoke-virtual {v1}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    move-result v5

    if-ge v5, v4, :cond_38

    move v2, v3

    :cond_38
    new-instance v3, Landroid/print/PrintAttributes$Margins;

    invoke-direct {v3, p0, v2, p0, v2}, Landroid/print/PrintAttributes$Margins;-><init>(IIII)V

    goto :goto_40

    :cond_3e
    sget-object v3, Landroid/print/PrintAttributes$Margins;->NO_MARGINS:Landroid/print/PrintAttributes$Margins;

    :goto_40
    new-instance p0, Landroid/print/PrintAttributes$Builder;

    invoke-direct {p0}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {p0, v1}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/print/PrintAttributes$Builder;->setMinMargins(Landroid/print/PrintAttributes$Margins;)Landroid/print/PrintAttributes$Builder;

    move-result-object p0

    new-instance v1, Landroid/print/PrintAttributes$Resolution;

    const-string v2, "PDF resolution"

    const/16 v3, 0x12c

    invoke-direct {v1, v2, v2, v3, v3}, Landroid/print/PrintAttributes$Resolution;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {p0, v1}, Landroid/print/PrintAttributes$Builder;->setResolution(Landroid/print/PrintAttributes$Resolution;)Landroid/print/PrintAttributes$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object p0

    invoke-virtual {v0}, Lqji;->c()Landroid/print/PrintAttributes;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/print/PrintAttributes;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10f

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lqji;->o:J

    const/4 v1, 0x0

    iput-object v1, v0, Lqji;->p:[Landroid/print/PageRange;

    iput-object p0, v0, Lqji;->e:Landroid/print/PrintAttributes;

    iget-object p0, v0, Lqji;->d:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    iget-object v2, v0, Lqji;->e:Landroid/print/PrintAttributes;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$MediaSize;->getId()Ljava/lang/String;

    move-result-object v3

    const-string v4, "media_size"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$MediaSize;->isPortrait()Z

    move-result v3

    const-string v4, "media_portrait"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$Margins;->getLeftMils()I

    move-result v3

    const-string v4, "margin_left"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$Margins;->getTopMils()I

    move-result v3

    const-string v4, "margin_top"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$Margins;->getRightMils()I

    move-result v3

    const-string v4, "margin_right"

    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object v2

    invoke-virtual {v2}, Landroid/print/PrintAttributes$Margins;->getBottomMils()I

    move-result v2

    const-string v3, "margin_bottom"

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-byte p0, v0, Lqji;->l:B

    if-eqz p0, :cond_10b

    const/4 v2, 0x1

    if-eq p0, v2, :cond_fc

    const/4 v3, 0x3

    if-ne p0, v3, :cond_110

    iget-boolean p0, v0, Lqji;->n:Z

    if-nez p0, :cond_10f

    iget-object p0, v0, Lqji;->k:Lpji;

    if-eqz p0, :cond_ed

    iput-object v1, v0, Lqji;->k:Lpji;

    invoke-interface {p0}, Lpji;->T()V

    :cond_ed
    iget-object p0, v0, Lqji;->g:Landroid/os/CancellationSignal;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    new-instance p0, Landroid/os/CancellationSignal;

    invoke-direct {p0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object p0, v0, Lqji;->g:Landroid/os/CancellationSignal;

    iput-boolean v2, v0, Lqji;->n:Z

    return-void

    :cond_fc
    iput-object v1, v0, Lqji;->h:Llji;

    iget-object p0, v0, Lqji;->g:Landroid/os/CancellationSignal;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    new-instance p0, Landroid/os/CancellationSignal;

    invoke-direct {p0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object p0, v0, Lqji;->g:Landroid/os/CancellationSignal;

    goto :goto_110

    :cond_10b
    iget-object p0, v0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    if-nez p0, :cond_110

    :cond_10f
    return-void

    :cond_110
    :goto_110
    iget-object p0, v0, Lqji;->e:Landroid/print/PrintAttributes;

    invoke-virtual {v0, p0}, Lqji;->g(Landroid/print/PrintAttributes;)V

    return-void
.end method

.method public final O0(I)V
    .registers 3

    if-eqz p1, :cond_20

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1c

    const/4 v0, 0x2

    if-eq p1, v0, :cond_c

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1c

    goto :goto_1b

    :cond_c
    iget-object p1, p0, Lpii;->J:Lm9f;

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Lpii;->K0()V

    return-void

    :cond_14
    iget-boolean p1, p0, Lpii;->L:Z

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lpii;->M0()V

    :cond_1b
    :goto_1b
    return-void

    :cond_1c
    invoke-virtual {p0}, Lpii;->M0()V

    return-void

    :cond_20
    iget-boolean p1, p0, Lpii;->M:Z

    if-eqz p1, :cond_28

    invoke-virtual {p0}, Lpii;->L0()V

    return-void

    :cond_28
    invoke-virtual {p0}, Lpii;->M0()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_92

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    instance-of v1, v1, Ldx3;

    if-eqz v1, :cond_92

    const-string v1, "tab_id"

    const/high16 v2, -0x80000000

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lpii;->E:I

    if-eq p1, v2, :cond_92

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Ldx3;

    iget p1, p0, Lpii;->E:I

    invoke-virtual {v3}, Ldx3;->W()Lk6l;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_82

    invoke-virtual {v1, p1}, Lk6l;->r(I)Lb2l;

    move-result-object v4

    if-eqz v4, :cond_82

    move-object p1, v4

    check-cast p1, Ld7l;

    iget-boolean v1, p1, Ld7l;->m:Z

    if-nez v1, :cond_82

    sget-object v1, Lvml;->d:Lumi;

    iget-object v5, p1, Ld7l;->j:Le7l;

    invoke-interface {v5}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v5

    if-eqz v5, :cond_82

    iget-object v5, p1, Ld7l;->j:Le7l;

    invoke-interface {v5}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v5

    invoke-static {v5}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object v5

    invoke-virtual {v5}, Llyg;->d()Z

    move-result v6

    if-nez v6, :cond_82

    move-object v2, v5

    new-instance v5, Lqji;

    invoke-direct {v5, v3, v1, v4}, Lqji;-><init>(Ldx3;Lumi;Lb2l;)V

    iget-object v1, v2, Llyg;->b:Ljyg;

    if-eqz v1, :cond_61

    iput-boolean v0, v1, Ljyg;->m:Z

    :cond_61
    new-instance v1, Lqn;

    const/16 v6, 0x12

    invoke-direct/range {v1 .. v6}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, p1, Ld7l;->j:Le7l;

    invoke-interface {v2, v1}, Lb9l;->D(Ljava/lang/Runnable;)Lhh4;

    move-result-object v1

    new-instance v2, Lc23;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v5, v3}, Lc23;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v2}, Ld7l;->e0(La2l;)V

    new-instance p1, Lkji;

    invoke-direct {p1, v1, v4, v2}, Lkji;-><init>(Lhh4;Lb2l;Lc23;)V

    iget-object v1, v5, Lqji;->c:Lh7f;

    invoke-virtual {v1, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    move-object v2, v5

    :cond_82
    iput-object v2, p0, Lpii;->u:Lqji;

    if-eqz v2, :cond_92

    new-instance p1, Lcii;

    invoke-direct {p1, p0}, Lcii;-><init>(Lpii;)V

    iput-object p1, p0, Lpii;->F:Lcii;

    iget-object v1, v2, Lqji;->c:Lh7f;

    invoke-virtual {v1, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_92
    iget-object p1, p0, Lpii;->u:Lqji;

    if-eqz p1, :cond_a8

    new-instance p1, Lhii;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, p0, v1, v0}, Lhii;-><init>(Lndc;Ljava/lang/Object;B)V

    iput-object p1, p0, Lpii;->H:Lhii;

    iget-object p0, p0, Lpii;->u:Lqji;

    iget-object p0, p0, Lqji;->c:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_a8
    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lpii;->u:Lqji;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    iget-object v2, p0, Lpii;->F:Lcii;

    if-eqz v2, :cond_11

    invoke-virtual {v0, v2}, Lqji;->e(Lnji;)V

    iput-object v1, p0, Lpii;->F:Lcii;

    :cond_11
    iget-object v0, p0, Lpii;->u:Lqji;

    invoke-virtual {v0}, Lqji;->b()V

    iput-object v1, p0, Lpii;->u:Lqji;

    :cond_18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lpii;->N:Z

    invoke-virtual {p0}, Lpii;->J0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Lt1;

    const/16 v3, 0xe

    invoke-direct {v2, v0, v3}, Lt1;-><init>(Landroid/content/Context;B)V

    iget-object p0, p0, Lpii;->s:Lumi;

    invoke-interface {p0, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lpii;->v:Lro9;

    iput-object v0, p0, Lpii;->x:Lro9;

    iput-object v0, p0, Lpii;->z:Lro9;

    iput-object v0, p0, Lpii;->B:Lro9;

    iput-object v0, p0, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lpii;->K:Lk8g;

    iget-object p0, p0, Lpii;->G:Llii;

    invoke-interface {p0}, Llii;->destroy()V

    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lpii;->u:Lqji;

    if-nez v0, :cond_a

    invoke-virtual {p0}, Lpii;->G0()V

    :cond_a
    return-void
.end method

.method public final s0()I
    .registers 1

    const p0, 0x7f14044d

    return p0
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f080522

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 11

    const v0, 0x7f0a0269

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iget-object v0, p0, Lpii;->G:Llii;

    invoke-interface {v0, p1, p2}, Llii;->v(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0}, Llii;->A()Lx79;

    move-result-object p2

    new-instance v0, Lza9;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lza9;->a:Z

    iput-boolean v1, v0, Lza9;->b:Z

    new-instance v2, Lro9;

    iget-object v3, p2, Lx79;->a:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v4, Lbii;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lbii;-><init>(Lpii;B)V

    invoke-direct {v2, v3, v4}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iput-object v2, p0, Lpii;->x:Lro9;

    const v2, 0x7f140eed

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    const v2, 0x7f140eef

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v3, 0x7f140eee

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v2}, Lpii;->I0(Landroid/content/Context;[Ljava/lang/Integer;)[Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lpii;->y:[Ljava/lang/CharSequence;

    iget-object v3, p0, Lpii;->x:Lro9;

    iget-object v4, v3, Lro9;->c:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v6, Lth6;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v6, v3, v4, v2, v0}, Lth6;-><init>(Lro9;Landroid/content/Context;[Ljava/lang/Object;Lza9;)V

    iget-object v2, v3, Lro9;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v2, v6}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v2, Lro9;

    iget-object v3, p2, Lx79;->b:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v4, Lmgf;

    const/16 v6, 0x13

    invoke-direct {v4, p0, v0, v6}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3, v4}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iput-object v2, p0, Lpii;->v:Lro9;

    const v0, 0x7f140ef6

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lpii;->r:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v3, v2, [Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    move v6, v5

    :goto_9b
    if-ge v6, v2, :cond_ac

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v7, v4}, Landroid/print/PrintAttributes$MediaSize;->getLabel(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_9b

    :cond_ac
    iput-object v3, p0, Lpii;->w:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lpii;->v:Lro9;

    iget-object v4, v2, Lro9;->c:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v6, Landroid/widget/ArrayAdapter;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v7, 0x7f0d03b6

    invoke-direct {v6, v4, v7, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    iget-object v2, v2, Lro9;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v2, v6}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v2, Lro9;

    iget-object v3, p2, Lx79;->c:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v4, Lbii;

    invoke-direct {v4, p0, v1}, Lbii;-><init>(Lpii;B)V

    invoke-direct {v2, v3, v4}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iput-object v2, p0, Lpii;->z:Lro9;

    const v2, 0x7f140eea

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    const v2, 0x7f140eeb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v3, 0x7f140eec

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v2}, Lpii;->I0(Landroid/content/Context;[Ljava/lang/Integer;)[Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lpii;->A:[Ljava/lang/CharSequence;

    iget-object v3, p0, Lpii;->z:Lro9;

    iget-object v4, v3, Lro9;->c:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v6, Landroid/widget/ArrayAdapter;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v6, v4, v7, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    iget-object v2, v3, Lro9;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v2, v6}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v2, p2, Lx79;->e:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v2, p0, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v2, Lro9;

    iget-object p2, p2, Lx79;->d:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v3, Lbii;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Lbii;-><init>(Lpii;B)V

    invoke-direct {v2, p2, v3}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    iput-object v2, p0, Lpii;->B:Lro9;

    const v2, 0x7f140ef1

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    const p2, 0x7f140ef2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const v2, 0x7f140ef5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {p2, v2}, [Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lpii;->I0(Landroid/content/Context;[Ljava/lang/Integer;)[Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lpii;->C:[Ljava/lang/CharSequence;

    iget-object p2, p0, Lpii;->B:Lro9;

    iget-object v2, p2, Lro9;->c:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v3, Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v3, v2, v7, p1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    iget-object p1, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1, v3}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance p2, Lnu;

    invoke-direct {p2, v1}, Lnu;-><init>(B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object p1, p0, Lpii;->u:Lqji;

    if-eqz p1, :cond_1c7

    invoke-virtual {p1}, Lqji;->c()Landroid/print/PrintAttributes;

    move-result-object p1

    invoke-virtual {p1}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    move-result-object p2

    move v2, v5

    :goto_17f
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1a6

    invoke-virtual {p2}, Landroid/print/PrintAttributes$MediaSize;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v6}, Landroid/print/PrintAttributes$MediaSize;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a3

    iget-object v0, p0, Lpii;->v:Lro9;

    iget-object v3, p0, Lpii;->w:[Ljava/lang/CharSequence;

    aget-object v3, v3, v2

    invoke-virtual {v0, v2, v3}, Lro9;->a0(ILjava/lang/CharSequence;)V

    goto :goto_1a6

    :cond_1a3
    add-int/lit8 v2, v2, 0x1

    goto :goto_17f

    :cond_1a6
    :goto_1a6
    invoke-virtual {p2}, Landroid/print/PrintAttributes$MediaSize;->isPortrait()Z

    move-result p2

    xor-int/2addr p2, v1

    iget-object v0, p0, Lpii;->x:Lro9;

    iget-object v1, p0, Lpii;->y:[Ljava/lang/CharSequence;

    aget-object v1, v1, p2

    invoke-virtual {v0, p2, v1}, Lro9;->a0(ILjava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    move-result-object p1

    sget-object p2, Landroid/print/PrintAttributes$Margins;->NO_MARGINS:Landroid/print/PrintAttributes$Margins;

    invoke-virtual {p1, p2}, Landroid/print/PrintAttributes$Margins;->equals(Ljava/lang/Object;)Z

    move-result p1

    iget-object p2, p0, Lpii;->z:Lro9;

    iget-object v0, p0, Lpii;->A:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    invoke-virtual {p2, p1, v0}, Lro9;->a0(ILjava/lang/CharSequence;)V

    :cond_1c7
    iget-object p1, p0, Lpii;->B:Lro9;

    iget-object p2, p0, Lpii;->C:[Ljava/lang/CharSequence;

    aget-object p2, p2, v5

    invoke-virtual {p1, v5, p2}, Lro9;->a0(ILjava/lang/CharSequence;)V

    iget-object p1, p0, Lpii;->u:Lqji;

    if-eqz p1, :cond_1ec

    iget-byte p1, p1, Lqji;->l:B

    if-ne p1, v4, :cond_1e8

    iget-object p2, p0, Lpii;->J:Lm9f;

    if-nez p2, :cond_1e8

    iget-boolean p2, p0, Lpii;->L:Z

    if-nez p2, :cond_1e8

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpii;->H0(Landroid/content/Context;)V

    return-void

    :cond_1e8
    invoke-virtual {p0, p1}, Lpii;->O0(I)V

    return-void

    :cond_1ec
    invoke-virtual {p0}, Lpii;->M0()V

    return-void
.end method
