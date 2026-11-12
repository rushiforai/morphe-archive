.class public final Loxg;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Lwvg;

.field public final c:Lc61;

.field public final d:Lx5f;

.field public final e:Lbxc;

.field public f:Z


# direct methods
.method public constructor <init>(Lwvg;Lc61;Lx5f;Lbxc;)V
    .registers 6

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Loxg;->b:Lwvg;

    iput-object p2, p0, Loxg;->c:Lc61;

    iput-object p3, p0, Loxg;->d:Lx5f;

    iput-object p4, p0, Loxg;->e:Lbxc;

    return-void
.end method


# virtual methods
.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 7

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iget-object v1, p0, Loxg;->e:Lbxc;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1e

    const/4 v2, 0x1

    iput-boolean v2, p0, Loxg;->f:Z

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_1e
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-object p0, p0, Loxg;->b:Lwvg;

    iget-wide v3, p0, Lwvg;->c:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v1, 0x7f1413de

    invoke-virtual {p1, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object v0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140ebd

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150293

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f1413df    # 1.9682892E38f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f0804c3

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final k(Landroid/content/Context;)I
    .registers 3

    const p0, 0x7f040484

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const p0, 0x7f0403ad

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    iget-object p1, p0, Ld63;->mDismissReason:Lhjm;

    sget-object p2, Lhjm;->b:Lhjm;

    if-ne p1, p2, :cond_b

    sget-object p1, Lzq0;->d:Lzq0;

    invoke-virtual {p0, p1}, Loxg;->q(Lzq0;)V

    :cond_b
    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 8

    iget-object p1, p0, Loxg;->c:Lc61;

    new-instance v0, Lo8f;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lo8f;->b:Ljava/lang/Object;

    check-cast v0, Loxg;

    iget-object p0, p0, Loxg;->b:Lwvg;

    iget-object p0, p0, Lwvg;->h:Ljmk;

    sget-object v1, Lzq0;->b:Lzq0;

    sget-object v2, Lzq0;->c:Lzq0;

    const/4 v3, 0x1

    sget-object v4, Lmxg;->b:Lmxg;

    if-eqz p0, :cond_62

    iget-object p0, p0, Ljmk;->c:Lhmk;

    if-eqz p0, :cond_62

    :try_start_1e
    iget-object p0, p0, Lhmk;->a:Ljava/lang/String;

    iget-object p1, p1, Lc61;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lp12;->g(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const/high16 v5, 0x10000000

    invoke-virtual {p0, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_32
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1e .. :try_end_32} :catch_4b

    new-instance p0, Llxg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lmxg;->a:Lmxg;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_47

    if-ne p1, v3, :cond_4a

    check-cast p0, Lkxg;

    invoke-virtual {v0, v2}, Loxg;->q(Lzq0;)V

    goto :goto_4a

    :cond_47
    invoke-virtual {v0, v1}, Loxg;->q(Lzq0;)V

    :cond_4a
    :goto_4a
    return-void

    :catch_4b
    new-instance p0, Lkxg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_5c

    if-ne p1, v3, :cond_61

    invoke-virtual {v0, v2}, Loxg;->q(Lzq0;)V

    goto :goto_61

    :cond_5c
    check-cast p0, Llxg;

    invoke-virtual {v0, v1}, Loxg;->q(Lzq0;)V

    :cond_61
    :goto_61
    return-void

    :cond_62
    new-instance p0, Lkxg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_73

    if-ne p1, v3, :cond_78

    invoke-virtual {v0, v2}, Loxg;->q(Lzq0;)V

    goto :goto_78

    :cond_73
    check-cast p0, Llxg;

    invoke-virtual {v0, v1}, Loxg;->q(Lzq0;)V

    :cond_78
    :goto_78
    return-void
.end method

.method public final q(Lzq0;)V
    .registers 8

    iget-boolean v0, p0, Loxg;->f:Z

    iget-object p0, p0, Loxg;->d:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_9

    return-void

    :cond_9
    iget-object v1, p0, Lx5f;->d:Lzpa;

    new-instance v2, Lyq0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4, v4, v0}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v0

    invoke-virtual {v0, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3e

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3e

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_47

    :cond_3e
    invoke-static {v0, v1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v0, v1, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_47
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
