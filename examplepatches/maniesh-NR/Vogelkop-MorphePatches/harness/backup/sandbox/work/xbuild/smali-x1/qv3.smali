.class public final Lqv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7l;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqv3;->a:B

    iput-object p1, p0, Lqv3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final c(ILb8l;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final a(ILdyg;)V
    .registers 5

    iget-byte v0, p0, Lqv3;->a:B

    iget-object p0, p0, Lqv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8a

    check-cast p0, Lkol;

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v1, v0, Lhol;->a:Lfol;

    iget v1, v1, Lfol;->c:I

    if-ne v1, p1, :cond_47

    iget-boolean p1, p0, Lkol;->g:Z

    if-eqz p1, :cond_34

    instance-of p1, p2, Ls7l;

    if-eqz p1, :cond_34

    sget-object p1, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    iget-object p1, p0, Lkol;->a:Landroid/content/Context;

    check-cast p2, Ls7l;

    iget-object p2, p2, Ls7l;->b:Lyni;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lxvg;->s(Landroid/content/Context;Lyni;Lcyj;)Lir;

    move-result-object p1

    new-instance p2, Lznl;

    sget-object v0, Leol;->a:Leol;

    invoke-direct {p2, v0}, Lznl;-><init>(Leol;)V

    invoke-virtual {p0, p1, p2}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    goto :goto_47

    :cond_34
    instance-of p1, p2, Ls7l;

    if-nez p1, :cond_47

    iget-object p1, v0, Lhol;->b:Lbwg;

    instance-of p2, p1, Lcol;

    if-eqz p2, :cond_47

    check-cast p1, Lcol;

    iget-boolean p1, p1, Lcol;->a:Z

    if-nez p1, :cond_47

    invoke-virtual {p0}, Lkol;->h()V

    :cond_47
    :goto_47
    return-void

    :pswitch_48
    check-cast p0, Le8l;

    instance-of p1, p2, Ls7l;

    if-eqz p1, :cond_56

    iget-object p0, p0, Le8l;->c:Lpde;

    sget-object p1, Lh8l;->c:Lh8l;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_79

    :cond_56
    sget-object p1, Lr7l;->b:Lr7l;

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_76

    const/4 p1, 0x0

    iput-boolean p1, p0, Le8l;->d:Z

    iget-object p1, p0, Le8l;->f:Lqlk;

    invoke-virtual {p0}, Le8l;->a()Z

    move-result p2

    if-eqz p2, :cond_72

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v0, 0x1f4

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_79

    :cond_72
    invoke-virtual {p0}, Le8l;->b()V

    goto :goto_79

    :cond_76
    invoke-static {}, Lh9o;->p()V

    :goto_79
    return-void

    :pswitch_7a
    check-cast p0, Lyt3;

    instance-of p1, p2, Ls7l;

    if-eqz p1, :cond_85

    check-cast p2, Ls7l;

    iget-object p1, p2, Ls7l;->b:Lyni;

    goto :goto_86

    :cond_85
    const/4 p1, 0x0

    :goto_86
    invoke-virtual {p0, p1}, Lyt3;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_7a
        :pswitch_48
    .end packed-switch
.end method

.method public final b(ILb8l;)V
    .registers 5

    iget-byte v0, p0, Lqv3;->a:B

    iget-object p0, p0, Lqv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_78

    check-cast p0, Lkol;

    iget-object v0, p0, Lkol;->e:Lhol;

    iget-object v1, v0, Lhol;->a:Lfol;

    iget v1, v1, Lfol;->c:I

    if-ne v1, p1, :cond_51

    iget-object p1, v0, Lhol;->b:Lbwg;

    instance-of p2, p2, La8l;

    if-eqz p2, :cond_44

    instance-of p2, p1, Lznl;

    if-eqz p2, :cond_40

    iget-boolean p2, p0, Lkol;->g:Z

    if-eqz p2, :cond_35

    sget-object p2, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    check-cast p1, Lznl;

    iget-object p1, p1, Lznl;->a:Leol;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_51

    const/4 p2, 0x1

    if-eq p1, p2, :cond_51

    const/4 p2, 0x2

    if-eq p1, p2, :cond_35

    invoke-static {}, Lh9o;->p()V

    goto :goto_51

    :cond_35
    new-instance p1, Lthk;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lthk;-><init>(B)V

    invoke-virtual {p0, p1}, Lkol;->e(Lkotlin/jvm/functions/Function0;)V

    goto :goto_51

    :cond_40
    invoke-virtual {p0}, Lkol;->h()V

    goto :goto_51

    :cond_44
    instance-of p2, p1, Lcol;

    if-eqz p2, :cond_51

    check-cast p1, Lcol;

    iget-boolean p1, p1, Lcol;->a:Z

    if-nez p1, :cond_51

    invoke-virtual {p0}, Lkol;->h()V

    :cond_51
    :goto_51
    return-void

    :pswitch_52
    check-cast p0, Le8l;

    const/4 p1, 0x0

    iput-boolean p1, p0, Le8l;->d:Z

    sget-object p1, Ly7l;->a:Ly7l;

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_73

    sget-object p1, Lz7l;->a:Lz7l;

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_73

    instance-of p1, p2, La8l;

    if-eqz p1, :cond_6f

    invoke-virtual {p0}, Le8l;->b()V

    goto :goto_76

    :cond_6f
    invoke-static {}, Lh9o;->p()V

    goto :goto_76

    :cond_73
    invoke-virtual {p0}, Le8l;->b()V

    :goto_76
    :pswitch_76
    return-void

    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_76
        :pswitch_52
    .end packed-switch
.end method
