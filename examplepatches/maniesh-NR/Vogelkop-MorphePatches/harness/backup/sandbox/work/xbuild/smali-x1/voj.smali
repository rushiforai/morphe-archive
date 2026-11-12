.class public final synthetic Lvoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lvoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .registers 2

    const/16 p1, 0x11

    iput-byte p1, p0, Lvoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte p0, p0, Lvoj;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_270

    check-cast p1, Llml;

    check-cast p2, Lkotlin/coroutines/CoroutineContext$Element;

    instance-of p0, p2, Ldml;

    if-eqz p0, :cond_26

    check-cast p2, Ldml;

    iget-object p0, p1, Llml;->a:Lkotlin/coroutines/CoroutineContext;

    invoke-interface {p2}, Ldml;->updateThreadContext()Ljava/lang/Object;

    move-result-object p0

    iget-object v0, p1, Llml;->b:[Ljava/lang/Object;

    iget v1, p1, Llml;->d:I

    aput-object p0, v0, v1

    iget-object p0, p1, Llml;->c:[Ldml;

    add-int/lit8 v0, v1, 0x1

    iput v0, p1, Llml;->d:I

    aput-object p2, p0, v1

    :cond_26
    return-object p1

    :pswitch_27
    check-cast p1, Ldml;

    check-cast p2, Lkotlin/coroutines/CoroutineContext$Element;

    if-eqz p1, :cond_2f

    move-object v0, p1

    goto :goto_36

    :cond_2f
    instance-of p0, p2, Ldml;

    if-eqz p0, :cond_36

    move-object v0, p2

    check-cast v0, Ldml;

    :cond_36
    :goto_36
    return-object v0

    :pswitch_37
    check-cast p2, Lkotlin/coroutines/CoroutineContext$Element;

    instance-of p0, p2, Ldml;

    if-eqz p0, :cond_55

    instance-of p0, p1, Ljava/lang/Integer;

    if-eqz p0, :cond_44

    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    :cond_44
    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_4c

    :cond_4b
    move p0, v1

    :goto_4c
    if-nez p0, :cond_50

    move-object p1, p2

    goto :goto_55

    :cond_50
    add-int/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :cond_55
    :goto_55
    return-object p1

    :pswitch_56
    check-cast p1, Lrji;

    check-cast p2, Lvhl;

    iget-object p0, p2, Lvhl;->a:Lp0g;

    invoke-virtual {p0}, Lp0g;->h()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    iget-object p1, p2, Lvhl;->f:Lt0g;

    invoke-virtual {p1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfsf;

    sget-object p2, Lfsf;->a:Lfsf;

    if-eq p1, p2, :cond_71

    move v1, v2

    :cond_71
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_7e
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->c(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_8f
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->z(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a0
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->J(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_b1
    check-cast p1, Lpfd;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p1, p0}, Lpfd;->E(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_c2
    check-cast p1, Lfvl;

    check-cast p2, Lqp3;

    new-instance p0, Lfo8;

    invoke-direct {p0, p1, p2}, Lfo8;-><init>(Lfvl;Lqp3;)V

    return-object p0

    :pswitch_cc
    check-cast p1, Lw6l;

    check-cast p2, Lw6l;

    invoke-virtual {p1}, Lw6l;->a()I

    move-result p0

    invoke-virtual {p2}, Lw6l;->a()I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_e1
    check-cast p1, Lhxk;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lkxk;

    invoke-virtual {p1, p0}, Lkxk;->a([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f2
    check-cast p1, Lhv7;

    check-cast p2, Ll0a;

    iget-object p0, p1, Lhv7;->d:Ll42;

    if-nez p0, :cond_fe

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v1, v2

    :cond_fe
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_103
    check-cast p1, Lih5;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Laoh;->m(I)I

    move-result p0

    invoke-static {p1, p0}, Lkfo;->r(Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_114
    check-cast p1, Ld8j;

    check-cast p2, [I

    sget-object p0, Lc8j;->b:Lc8j;

    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p2

    check-cast p1, Lg8j;

    invoke-virtual {p1, p0, p2}, Lg8j;->j(Lc8j;[I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_127
    check-cast p1, Lk6k;

    check-cast p2, Lk6k;

    sget-object p0, Ld6k;->d:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v1, v2

    :goto_132
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, -0x1

    if-eqz v3, :cond_146

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le6k;

    iget-object v5, p1, Lk6k;->a:Le6k;

    if-eq v3, v5, :cond_147

    add-int/lit8 v1, v1, 0x1

    goto :goto_132

    :cond_146
    move v1, v4

    :cond_147
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_160

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le6k;

    iget-object v0, p2, Lk6k;->a:Le6k;

    if-ne p1, v0, :cond_15d

    move v4, v2

    goto :goto_160

    :cond_15d
    add-int/lit8 v2, v2, 0x1

    goto :goto_14b

    :cond_160
    :goto_160
    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_169
    check-cast p1, Ld8j;

    check-cast p2, [I

    array-length p0, p2

    invoke-static {p2, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    check-cast p1, Lg8j;

    invoke-virtual {p1, p0}, Lg8j;->i([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17a
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->b:Lgjm;

    new-instance p1, Lido;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18b
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f141130

    sget-object p2, Llag;->e:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19a
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f141123

    sget-object p2, Llag;->f:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a9
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f141131

    sget-object p2, Llag;->b:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b8
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f14095d

    sget-object p2, Llag;->i:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c7
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f14112d

    sget-object p2, Llag;->c:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d6
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->e:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lg0c;

    new-array p1, v2, [I

    invoke-virtual {p0, p1}, Lg0c;->a([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ea
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->d:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsyl;

    new-instance p1, Lvyl;

    invoke-direct {p1}, Lvyl;-><init>()V

    const/16 p2, 0x1003

    invoke-static {p1, p2}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lsyl;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_209
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->c:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrj;

    iget-object p0, p0, Lrj;->b:Lgjm;

    sget-object p1, Lij;->a:Lij;

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21f
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->b:Lgjm;

    new-instance p1, Lmoj;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_230
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f140cdf

    sget-object p2, Llag;->h:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23f
    check-cast p1, Lqoj;

    check-cast p2, [I

    const p0, 0x7f140d67

    sget-object p2, Llag;->d:Llag;

    invoke-virtual {p1, p0, p2}, Lqoj;->a(ILlag;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24e
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->b:Lgjm;

    new-instance p1, Lzl8;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25f
    check-cast p1, Lqoj;

    check-cast p2, [I

    iget-object p0, p1, Lqoj;->b:Lgjm;

    new-instance p1, Ld01;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_270
    .packed-switch 0x0
        :pswitch_25f
        :pswitch_24e
        :pswitch_23f
        :pswitch_230
        :pswitch_21f
        :pswitch_209
        :pswitch_1ea
        :pswitch_1d6
        :pswitch_1c7
        :pswitch_1b8
        :pswitch_1a9
        :pswitch_19a
        :pswitch_18b
        :pswitch_17a
        :pswitch_169
        :pswitch_127
        :pswitch_114
        :pswitch_103
        :pswitch_f2
        :pswitch_e1
        :pswitch_cc
        :pswitch_c2
        :pswitch_b1
        :pswitch_a0
        :pswitch_8f
        :pswitch_7e
        :pswitch_56
        :pswitch_37
        :pswitch_27
    .end packed-switch
.end method
