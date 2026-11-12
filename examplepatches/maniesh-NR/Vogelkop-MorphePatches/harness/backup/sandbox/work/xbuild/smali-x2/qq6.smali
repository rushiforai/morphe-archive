.class public final Lqq6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg38;
.implements Lmya;
.implements Lkc9;
.implements Lkkm;
.implements Lw7e;
.implements Lkm3;
.implements Lm94;
.implements Lzqb;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 5

    iput-byte p1, p0, Lqq6;->a:B

    sparse-switch p1, :sswitch_data_4a

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ls14;

    const/16 v0, 0x12

    invoke-direct {p1, v0}, Ls14;-><init>(B)V

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void

    :sswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void

    :sswitch_1d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lisd;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lisd;-><init>(B)V

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void

    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lyp9;

    const/4 v0, 0x5

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {p1, v0, v1, v2, v2}, Lyp9;-><init>(IFZB)V

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void

    :sswitch_38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_3c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lawj;

    sget-object v0, Lfsp;->e:Lyg9;

    invoke-direct {p1, v0}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_4a
    .sparse-switch
        0x4 -> :sswitch_3c
        0x9 -> :sswitch_38
        0xf -> :sswitch_29
        0x12 -> :sswitch_1d
        0x1b -> :sswitch_12
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lqq6;->a:B

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    const/16 v0, 0x17

    iput-byte v0, p0, Lqq6;->a:B

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    .line 85
    new-instance p0, Lz61;

    .line 86
    invoke-direct {p0}, Lz61;-><init>()V

    .line 87
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 88
    invoke-virtual {p0, p1}, Lz61;->onViewAttachedToWindow(Landroid/view/View;)V

    .line 89
    :cond_17
    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 74
    iput-byte p2, p0, Lqq6;->a:B

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lr9i;)V
    .registers 6

    const/16 v0, 0x18

    iput-byte v0, p0, Lqq6;->a:B

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iget-object v0, p1, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf99;

    .line 77
    new-instance v1, Lzp6;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v1, v3, v2, p1}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    .line 78
    invoke-static {v0, v1}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object p1

    .line 79
    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    .line 80
    new-instance v0, Lyc1;

    const/16 v1, 0xf

    invoke-direct {v0, p1, v1}, Lyc1;-><init>(Lf99;B)V

    .line 81
    invoke-static {v0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p1

    .line 82
    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    iput-object p1, p0, Lqq6;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final E()Ljava/io/InputStream;
    .registers 2

    new-instance v0, Ljava/io/FileInputStream;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 5

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Lguh;

    const/4 v2, -0x1

    invoke-direct {v1, v0, v2}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2f
    new-instance p1, Le5d;

    sget-object v0, Ll08;->a:Ll08;

    const/4 v1, 0x2

    invoke-direct {p1, p0, v0, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final a(I)V
    .registers 2

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    invoke-virtual {p0, p1}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->E0(I)V

    return-void
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast v0, Lohc;

    iget-object v1, v0, Lohc;->f:Ll94;

    if-nez v1, :cond_a

    const/4 v1, 0x1

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    const-string v2, "The result can only set once!"

    invoke-static {v2, v1}, Ljpo;->n(Ljava/lang/String;Z)V

    iput-object p1, v0, Lohc;->f:Ll94;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "ListFuture["

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lm3c;)V
    .registers 3

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "DepthSortedSet.add called on an unattached node"

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_b
    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lawj;

    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(B)V
    .registers 2

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Landroid/os/Parcel;

    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeByte(B)V

    return-void
.end method

.method public final d(F)V
    .registers 2

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Landroid/os/Parcel;

    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method

.method public final e(J)V
    .registers 10

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    invoke-virtual {p0}, Ll2b;->B0()V

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object v0, Lv2b;->b:Lv2b;

    invoke-virtual {p0, v0, p1, p2}, Ll2b;->L0(Lv2b;J)V

    new-instance v1, Lk3b;

    const/4 v5, 0x0

    const/16 v6, 0xc

    const/4 v2, 0x1

    move-wide v3, p1

    invoke-direct/range {v1 .. v6}, Lk3b;-><init>(IJLjava/lang/String;I)V

    invoke-static {v1}, Lac8;->b(Ljava/lang/Object;)V

    return-void
.end method

.method public final f(J)V
    .registers 11

    invoke-static {p1, p2}, Lrkl;->b(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lskl;->a(JJ)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_26

    const-wide v6, 0x100000000L

    invoke-static {v0, v1, v6, v7}, Lskl;->a(JJ)Z

    move-result v4

    if-eqz v4, :cond_1a

    const/4 v5, 0x1

    goto :goto_26

    :cond_1a
    const-wide v6, 0x200000000L

    invoke-static {v0, v1, v6, v7}, Lskl;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v5, 0x2

    :cond_26
    :goto_26
    invoke-virtual {p0, v5}, Lqq6;->c(B)V

    invoke-static {p1, p2}, Lrkl;->b(J)J

    move-result-wide v0

    invoke-static {v0, v1, v2, v3}, Lskl;->a(JJ)Z

    move-result v0

    if-nez v0, :cond_3a

    invoke-static {p1, p2}, Lrkl;->c(J)F

    move-result p1

    invoke-virtual {p0, p1}, Lqq6;->d(F)V

    :cond_3a
    return-void
.end method

.method public final g(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lor6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lor6;

    iget v1, v0, Lor6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lor6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lor6;

    invoke-direct {v0, p0, p2}, Lor6;-><init>(Lqq6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lor6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lor6;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p1, v0, Lor6;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_46

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lbpd;

    iget-object p0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p0, Lf99;

    iput-object p1, v0, Lor6;->t:Ljava/lang/String;

    iput v3, v0, Lor6;->w:I

    invoke-static {p0, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    check-cast p2, Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V
    .registers 4

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Ls14;

    new-instance v0, Ls2k;

    invoke-direct {v0, p1, p2}, Ls2k;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    invoke-virtual {p0, v0}, Ls14;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final i(Ljava/lang/Exception;)V
    .registers 5

    const-string v0, "Audio sink error"

    invoke-static {v0, p1}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lkgd;

    iget-object p0, p0, Lkgd;->E0:Lpad;

    iget-object v0, p0, Lpad;->b:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    if-eqz v0, :cond_1b

    new-instance v1, Lfh2;

    const/16 v2, 0x8

    invoke-direct {v1, p0, p1, v2}, Lfh2;-><init>(Lpad;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1b
    return-void
.end method

.method public final j(Lm3c;)Z
    .registers 3

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "DepthSortedSet.remove called on an unattached node"

    invoke-static {v0}, La8b;->b(Ljava/lang/String;)V

    :cond_b
    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lawj;

    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final k(Landroid/view/MotionEvent;Z)V
    .registers 5

    iget-object v0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast v0, Lzy9;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    invoke-static {p1}, Lexg;->j(I)I

    move-result p1

    if-eqz p1, :cond_22

    const/16 v1, 0x9

    if-eq p1, v1, :cond_22

    const/4 v1, 0x7

    if-eq p1, v1, :cond_22

    if-eqz p2, :cond_21

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1d

    const/4 p2, 0x3

    if-ne p1, p2, :cond_21

    :cond_1d
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lqq6;->l(FF)V

    :cond_21
    return-void

    :cond_22
    iget-object p1, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->B:I

    int-to-float p1, p1

    neg-float p1, p1

    const/high16 p2, -0x80000000

    invoke-virtual {p0, p2, p1}, Lqq6;->l(FF)V

    return-void
.end method

.method public final l(FF)V
    .registers 4

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    if-eqz p0, :cond_1c

    iput p1, p0, Lorg/chromium/ui/base/EventForwarder;->i:F

    iput p2, p0, Lorg/chromium/ui/base/EventForwarder;->j:F

    :cond_1c
    return-void
.end method

.method public final length()J
    .registers 3

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 7

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lyr8;

    new-instance p2, Ljl6;

    iget-object v0, p0, Lyr8;->c:Lgjf;

    iget v1, p0, Lyr8;->d:I

    iget-object v2, p0, Lyr8;->b:Lxr8;

    invoke-interface {v2}, Lxr8;->i()I

    move-result v3

    invoke-direct {p2, p1, v0, v1, v3}, Ljl6;-><init>(Landroid/graphics/Bitmap;Lgjf;II)V

    iput-object p2, p0, Lyr8;->g:Ljl6;

    invoke-interface {v2}, Lxr8;->h()V

    invoke-interface {v2}, Lxr8;->invalidate()V

    return-void
.end method

.method public final s(Ljava/lang/String;)Ljava/lang/Object;
    .registers 8

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lu38;

    const-string v0, "GmsCore_OpenSSL"

    const-string v1, "AndroidOpenSSL"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_13
    const/4 v4, 0x2

    if-ge v3, v4, :cond_24

    aget-object v4, v0, v3

    invoke-static {v4}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v4

    if-eqz v4, :cond_21

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_24
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    move-object v4, v3

    :cond_2a
    :goto_2a
    if-ge v2, v0, :cond_3e

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    check-cast v5, Ljava/security/Provider;

    :try_start_34
    invoke-interface {p0, p1, v5}, Lu38;->d(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    move-result-object p0
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_38} :catch_39

    return-object p0

    :catch_39
    move-exception v5

    if-nez v4, :cond_2a

    move-object v4, v5

    goto :goto_2a

    :cond_3e
    invoke-interface {p0, p1, v3}, Lu38;->d(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final t(Le5d;)V
    .registers 4

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Ldda;

    iget-object p0, p0, Ldda;->C:Ljy0;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Ljy0;->e:Ljava/util/LinkedHashSet;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_24
    invoke-virtual {p0}, Ljy0;->M()V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lqq6;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lawj;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x4
        :pswitch_a
    .end packed-switch
.end method

.method public final u(I)V
    .registers 2

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lyr8;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyr8;->i(Z)V

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 2

    new-instance p1, Lqoa;

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lisd;

    invoke-direct {p1, p0}, Lqoa;-><init>(Lisd;)V

    return-object p1
.end method

.method public final z(Lorb;)V
    .registers 2

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void
.end method
