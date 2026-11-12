.class public Lrii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lre;
.implements Lmya;
.implements Lrr9;
.implements Lhpf;
.implements Lrba;
.implements Ln5o;
.implements Lmf1;
.implements Lgln;
.implements Lf2o;
.implements Lbpo;
.implements Ljrp;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x1b

    iput-byte v0, p0, Lrii;->a:B

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(FFLif1;)V
    .registers 9

    const/16 v0, 0x10

    iput-byte v0, p0, Lrii;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p3}, Lif1;->b()I

    move-result v0

    new-array v1, v0, [Lw89;

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v0, :cond_1e

    new-instance v3, Lw89;

    invoke-virtual {p3, v2}, Lif1;->a(I)F

    move-result v4

    invoke-direct {v3, p1, p2, v4}, Lw89;-><init>(FFF)V

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_1e
    iput-object v1, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/webkit/WebView;Lauj;)V
    .registers 3

    const/16 p2, 0x18

    iput-byte p2, p0, Lrii;->a:B

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p2, "WebView is null"

    invoke-static {p1, p2}, Lzch;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 33
    iput-byte p2, p0, Lrii;->a:B

    iput-object p1, p0, Lrii;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lrii;->a:B

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltu;Lvqi;)V
    .registers 3

    const/4 p2, 0x1

    iput-byte p2, p0, Lrii;->a:B

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lw6j;Lctl;)V
    .registers 5

    const/16 v0, 0xd

    iput-byte v0, p0, Lrii;->a:B

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iget-object p2, p2, Lctl;->e:Lpde;

    .line 37
    iget-object p1, p1, Lw6j;->c:Ljava/lang/Object;

    check-cast p1, Lpde;

    .line 38
    new-instance v0, Lsul;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lsul;-><init>(B)V

    invoke-static {p2, p1, v0}, Lxf8;->z(Likc;Lpde;Lkotlin/jvm/functions/Function2;)Ltsd;

    move-result-object p1

    iput-object p1, p0, Lrii;->b:Ljava/lang/Object;

    return-void
.end method

.method public static l(ILjava/lang/CharSequence;)Lo1;
    .registers 7

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p0, v0, :cond_17

    const-string v0, "{{"

    invoke-static {p1, v0, p0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result v1

    const-string v2, "}}"

    const/4 v3, -0x1

    if-ne v1, v3, :cond_27

    invoke-static {p1, v2, p0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result p0

    if-ne p0, v3, :cond_19

    :cond_17
    const/4 p0, 0x0

    return-object p0

    :cond_19
    new-instance p1, Leel;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "End tag with no start tag at index "

    invoke-static {p0, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_27
    add-int/lit8 p0, v1, 0x2

    invoke-static {p1, v2, p0}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result v4

    if-eq v4, v3, :cond_61

    invoke-static {p1, p0, v4}, Landroid/text/TextUtils;->substring(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_53

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_53

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_53

    new-instance p1, Lo1;

    add-int/lit8 v4, v4, 0x2

    sub-int/2addr v4, v1

    const/4 v0, 0x6

    invoke-direct {p1, p0, v1, v4, v0}, Lo1;-><init>(Ljava/lang/String;IIB)V

    return-object p1

    :cond_53
    new-instance p0, Leel;

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p1, "Invalid argument at index "

    invoke-static {v1, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_61
    new-instance p0, Leel;

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p1, "Start tag with no end tag at index "

    invoke-static {v1, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final w(Ljava/lang/Throwable;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 6

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object v0, p0, Ldyk;->h:Ld7h;

    iget-object v1, p1, Lfpf;->d:Ljava/lang/String;

    new-instance v2, Leof;

    const/16 v3, 0x1c

    invoke-direct {v2, p0, p1, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Ld7h;->c(Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final a()V
    .registers 1

    .line 12
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lny3;

    iget-object p0, p0, Lny3;->e:Ljava/lang/Object;

    check-cast p0, Lu6p;

    invoke-virtual {p0, p1}, Lu6p;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()V
    .registers 4

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lioc;

    iget-object p0, p0, Lioc;->e:Ljava/lang/Object;

    check-cast p0, Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "tab_gallery.gallery_button_hint_bubble_shown"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final e(Ljava/util/ArrayList;)V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lvq8;

    const/4 v0, 0x0

    iput-object v0, p0, Lvq8;->l:Ljava/lang/Object;

    iget-object v0, p0, Lvq8;->j:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lvq8;->k:Ljava/lang/Object;

    check-cast p0, Lvl9;

    invoke-virtual {p0}, Lvl9;->run()V

    return-void
.end method

.method public final f(Landroid/view/View;Landroid/view/View;IILjava/lang/Integer;)Z
    .registers 11

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    const/4 v0, 0x0

    if-eqz p2, :cond_71

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_71

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_71

    :cond_15
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result p1

    if-eqz p1, :cond_71

    invoke-virtual {p2, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_71

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    int-to-long p0, p0

    mul-long/2addr v1, p0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-long p0, p0

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    int-to-long v3, p2

    mul-long/2addr p0, v3

    const-wide/16 v3, 0x0

    cmp-long p2, p0, v3

    if-lez p2, :cond_71

    const/4 p2, 0x1

    if-eqz p5, :cond_50

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_50

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long p0, p0

    cmp-long p0, v1, p0

    if-ltz p0, :cond_71

    goto :goto_70

    :cond_50
    const-wide/16 v3, 0x64

    mul-long/2addr v1, v3

    if-lez p4, :cond_6a

    int-to-long p4, p4

    mul-long/2addr p4, p0

    cmp-long p4, v1, p4

    if-gtz p4, :cond_5d

    move p4, p2

    goto :goto_5e

    :cond_5d
    move p4, v0

    :goto_5e
    if-eqz p4, :cond_63

    if-nez p4, :cond_71

    goto :goto_70

    :cond_63
    int-to-long p3, p3

    mul-long/2addr p3, p0

    cmp-long p0, v1, p3

    if-ltz p0, :cond_71

    goto :goto_70

    :cond_6a
    int-to-long p3, p3

    mul-long/2addr p3, p0

    cmp-long p0, v1, p3

    if-ltz p0, :cond_71

    :goto_70
    return p2

    :cond_71
    return v0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lhlm;

    iget-object p0, p0, Lhlm;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "uid"

    if-nez p1, :cond_1a

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1d

    :cond_1a
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_1d
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final get(I)Ln89;
    .registers 2

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, [Lw89;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final h(Lcpf;)V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->n:Lode;

    new-instance p1, Lbyk;

    const/4 v0, 0x0

    invoke-direct {p1, v0, v0, v0}, Lbyk;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public i()V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_1a
    return-void
.end method

.method public final j()Z
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, La12;

    iget-object p0, p0, La12;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "ofa-migration-version"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_19

    invoke-static {p0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    :cond_19
    if-eqz v1, :cond_21

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-gez p0, :cond_23

    :cond_21
    const/4 p0, 0x1

    return p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method

.method public final k(Lse;Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lyyi;

    iget-object p1, p0, Lltl;->m:Lse;

    if-nez p1, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    invoke-virtual {p0, p2}, Lyyi;->H0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object p2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p2, Lq65;

    invoke-virtual {p2}, Ln1;->S()V

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Lbnj;

    invoke-interface {p0, p1}, Lbnj;->F(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->n:Lode;

    sget-object p1, Layk;->a:Layk;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final o(Lpr;Lhjm;)V
    .registers 4

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p2, v0, :cond_b

    sget-object p1, Lvb0;->d:Lvb0;

    goto :goto_1a

    :cond_b
    iget-object p2, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->a:Li16;

    iget-object v0, p1, Lpr;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p1, p1, Lpr;->f:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p2, v0, p1}, Li16;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lvb0;->c:Lvb0;

    :goto_1a
    iget-object p2, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->b:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object p2, p2, Ld6j;->c:Lx5f;

    invoke-virtual {p2, p1}, Lx5f;->x0(Lvb0;)V

    iget-wide p0, p0, Lcom/opera/android/browser/autofill/SaveCardDialogRequest;->e:J

    invoke-static {p0, p1}, LJ/N;->MltfAxC5(J)V

    return-void
.end method

.method public final onFailure()V
    .registers 2

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lvq8;

    const/4 v0, 0x0

    iput-object v0, p0, Lvq8;->l:Ljava/lang/Object;

    iget-object v0, p0, Lvq8;->j:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    iput-boolean v0, p0, Lvq8;->a:Z

    iget-object p0, p0, Lvq8;->k:Ljava/lang/Object;

    check-cast p0, Lvl9;

    invoke-virtual {p0}, Lvl9;->run()V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 2

    iget-byte p1, p0, Lrii;->a:B

    packed-switch p1, :pswitch_data_e

    .line 31
    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lcyd;

    invoke-virtual {p0}, Lcyd;->e()V

    :pswitch_c
    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x9
        :pswitch_c
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lrii;->a:B

    packed-switch v0, :pswitch_data_12

    check-cast p1, Lf28;

    return-void

    :pswitch_8
    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lktk;

    invoke-virtual {p0}, Lktk;->run()V

    return-void

    :pswitch_data_12
    .packed-switch 0x9
        :pswitch_8
    .end packed-switch
.end method

.method public final p(Lse;)V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lyyi;

    iget-object p1, p0, Lyyi;->r:Ltzi;

    invoke-virtual {p1}, Ltzi;->d()V

    iget-object p1, p0, Lyyi;->v:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    const/4 v0, 0x0

    if-eqz p1, :cond_12

    invoke-virtual {p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setVisibility(I)V

    return-void

    :cond_12
    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    if-eqz p0, :cond_19

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_19
    return-void
.end method

.method public final q(Lse;Litd;)Z
    .registers 5

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lyyi;

    iget v0, p0, Lyyi;->u:I

    if-eqz v0, :cond_11

    invoke-virtual {p1}, Lse;->d()Landroid/view/MenuInflater;

    move-result-object v0

    iget v1, p0, Lyyi;->u:I

    invoke-virtual {v0, v1, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    :cond_11
    invoke-virtual {p1}, Lse;->d()Landroid/view/MenuInflater;

    move-result-object p1

    const v0, 0x7f100032

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    iget-object p1, p0, Lyyi;->v:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    const/4 p2, 0x4

    if-eqz p1, :cond_24

    invoke-virtual {p1, p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setVisibility(I)V

    goto :goto_2b

    :cond_24
    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    if-eqz p0, :cond_2b

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_2b
    :goto_2b
    const/4 p0, 0x1

    return p0
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->n:Lode;

    sget-object p1, Layk;->a:Layk;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final s()V
    .registers 1

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final u(I)V
    .registers 4

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lghf;

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lbnj;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    invoke-static {p1}, Lvep;->A(I)I

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_25

    const/4 v1, 0x1

    if-eq p0, v1, :cond_21

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1d

    return-void

    :cond_1d
    invoke-interface {v0, p1}, Lbnj;->f(Z)V

    return-void

    :cond_21
    invoke-interface {v0, v1}, Lbnj;->f(Z)V

    return-void

    :cond_25
    invoke-interface {v0, p1}, Lbnj;->f(Z)V

    return-void
.end method

.method public final v(Lse;Litd;)Z
    .registers 8

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Lyyi;

    iget-object v0, p0, Lyyi;->r:Ltzi;

    iget-object v1, v0, Ltzi;->a:Le5d;

    iget-object v1, v1, Le5d;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    move-result v1

    iget v0, v0, Ltzi;->f:I

    if-ne v1, v0, :cond_25

    if-lez v0, :cond_25

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    const v3, 0x7f140f2a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lse;->m(Ljava/lang/CharSequence;)V

    goto :goto_3f

    :cond_25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f12005d

    invoke-virtual {v2, v4, v1, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lse;->m(Ljava/lang/CharSequence;)V

    :goto_3f
    const p1, 0x7f0a069c

    invoke-virtual {p2, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p1, :cond_54

    if-lez v0, :cond_50

    if-ge v1, v0, :cond_50

    move v0, v3

    goto :goto_51

    :cond_50
    move v0, v2

    :goto_51
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_54
    const p1, 0x7f0a0692

    invoke-virtual {p2, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_63

    if-lez v1, :cond_60

    move v2, v3

    :cond_60
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_63
    invoke-virtual {p0, p2, v1}, Lyyi;->J0(Litd;I)V

    return v3
.end method

.method public final x(Ljava/lang/String;)Ljava/lang/String;
    .registers 13

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    move v1, p1

    :goto_7
    invoke-static {v1, v0}, Lrii;->l(ILjava/lang/CharSequence;)Lo1;

    move-result-object v1

    if-eqz v1, :cond_ac

    iget v2, v1, Lo1;->c:I

    iget-object v3, v1, Lo1;->b:Ljava/lang/String;

    iget-object v4, p0, Lrii;->b:Ljava/lang/Object;

    check-cast v4, Lu7k;

    const/4 v5, 0x2

    invoke-static {v5}, Lvep;->B(I)[I

    move-result-object v5

    array-length v6, v5

    move v7, p1

    :goto_1c
    const/4 v8, 0x0

    if-ge v7, v6, :cond_8f

    aget v9, v5, v7

    invoke-static {v9}, Lfki;->h(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8c

    invoke-static {v9}, Lfki;->h(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    iget-object v4, v4, Lu7k;->a:Ljava/lang/Object;

    check-cast v4, Lcsh;

    invoke-virtual {v4, p1}, Lh1b;->u(I)La1b;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_42
    invoke-virtual {v4}, Lq4;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_60

    invoke-virtual {v4}, Lq4;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lamk;

    if-eqz v7, :cond_42

    iget-object v7, v7, Lamk;->a:Lzsk;

    iget-object v7, v7, Lzsk;->a:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_42

    invoke-static {v6}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object v4

    goto :goto_62

    :cond_60
    sget-object v4, Lh3;->a:Lh3;

    :goto_62
    invoke-virtual {v4}, Lorf;->g()Z

    move-result v5

    if-eqz v5, :cond_8f

    invoke-virtual {v4}, Lorf;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lamk;

    invoke-static {v9}, Lvep;->A(I)I

    move-result v5

    if-eqz v5, :cond_85

    const/4 v6, 0x1

    if-ne v5, v6, :cond_8f

    iget-object v5, v4, Lamk;->c:Lxlk;

    iget-object v5, v5, Lxlk;->c:Lwlk;

    iget-object v5, v5, Lwlk;->b:Ljava/lang/String;

    iget v4, v4, Lamk;->d:F

    float-to-double v6, v4

    invoke-static {v5, v6, v7}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object v8

    goto :goto_8f

    :cond_85
    iget-object v4, v4, Lamk;->c:Lxlk;

    iget-object v4, v4, Lxlk;->c:Lwlk;

    iget-object v8, v4, Lwlk;->a:Ljava/lang/String;

    goto :goto_8f

    :cond_8c
    add-int/lit8 v7, v7, 0x1

    goto :goto_1c

    :cond_8f
    :goto_8f
    if-eqz v8, :cond_9e

    iget v1, v1, Lo1;->d:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v2, v1, v8}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v2

    goto/16 :goto_7

    :cond_9e
    new-instance p0, Le22;

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p1, "Unknown argument "

    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_ac
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public y()V
    .registers 3

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_3d

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->onCheckIsTextEditor()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v0

    goto :goto_1f

    :cond_1b
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    move-object v0, p0

    :goto_1f
    if-nez v0, :cond_2c

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :cond_2c
    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    move-result p0

    if-eqz p0, :cond_3d

    new-instance p0, Lca;

    const/4 v1, 0x6

    invoke-direct {p0, v0, v1}, Lca;-><init>(Landroid/view/View;B)V

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3d
    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method

.method public final zza()Ljava/lang/Object;
    .registers 8

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ljrp;

    invoke-interface {p0}, Ljrp;->zza()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    const/4 v0, 0x0

    if-nez p0, :cond_e

    return-object v0

    :cond_e
    sget-object v1, Ltop;->c:Lg40;

    const-class v1, Ljava/lang/Throwable;

    new-instance v2, Ljava/io/File;

    const-string v3, "local_testing_config.xml"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_22

    sget-object p0, Lirp;->c:Lirp;

    return-object p0

    :cond_22
    :try_start_22
    new-instance p0, Ljava/io/FileReader;

    invoke-direct {p0, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_27} :catch_88
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_22 .. :try_end_27} :catch_88
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_27} :catch_88

    :try_start_27
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v2

    invoke-virtual {v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    invoke-interface {v2, p0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    new-instance v4, Ltop;

    invoke-direct {v4, v2}, Ltop;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string v2, "local-testing-config"

    new-instance v5, Lbxk;

    const/16 v6, 0x17

    invoke-direct {v5, v4, v6}, Lbxk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v2, v5}, Ltop;->a(Ljava/lang/String;Levp;)V

    iget-object v2, v4, Ltop;->b:Lwci;

    iget-object v4, v2, Lwci;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_67

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_61

    iput-object v4, v2, Lwci;->c:Ljava/lang/Object;

    new-instance v0, Lirp;

    iget-object v4, v2, Lwci;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    iget-object v2, v2, Lwci;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    invoke-direct {v0, v4, v2}, Lirp;-><init>(Ljava/lang/Integer;Ljava/util/Map;)V

    goto :goto_6c

    :cond_61
    const-string v2, "Null splitInstallErrorCodeByModule"

    invoke-static {v2}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_6c

    :cond_67
    const-string v2, "Property \"splitInstallErrorCodeByModule\" has not been set"

    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V
    :try_end_6c
    .catchall {:try_start_27 .. :try_end_6c} :catchall_70

    :goto_6c
    :try_start_6c
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_88
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6c .. :try_end_6f} :catch_88
    .catch Ljava/lang/RuntimeException; {:try_start_6c .. :try_end_6f} :catch_88

    return-object v0

    :catchall_70
    move-exception v0

    :try_start_71
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_74
    .catchall {:try_start_71 .. :try_end_74} :catchall_75

    goto :goto_87

    :catchall_75
    move-exception p0

    :try_start_76
    const-string v2, "addSuppressed"

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_87} :catch_87

    :catch_87
    :goto_87
    :try_start_87
    throw v0
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_88} :catch_88
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_87 .. :try_end_88} :catch_88
    .catch Ljava/lang/RuntimeException; {:try_start_87 .. :try_end_88} :catch_88

    :catch_88
    move-exception p0

    sget-object v0, Ltop;->c:Lg40;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "%s can not be parsed, using default. Error: %s"

    invoke-virtual {v0, v1, p0}, Lg40;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object p0, Lirp;->c:Lirp;

    return-object p0
.end method
