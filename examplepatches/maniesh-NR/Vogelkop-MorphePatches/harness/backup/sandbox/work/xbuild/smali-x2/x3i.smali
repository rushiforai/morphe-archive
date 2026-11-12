.class public final Lx3i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Lhr5;

.field public static final g:J


# instance fields
.field public final a:Lj4c;

.field public final b:Lj4c;

.field public final c:Lhv1;

.field public final d:Landroid/content/Context;

.field public e:Lnej;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhr5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lx3i;->f:Lhr5;

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x5

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lx3i;->g:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lj4c;Lj4c;Lhv1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lx3i;->a:Lj4c;

    iput-object p3, p0, Lx3i;->b:Lj4c;

    iput-object p4, p0, Lx3i;->c:Lhv1;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lx3i;->d:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Ln0f;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lv3i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lv3i;

    iget v1, v0, Lv3i;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lv3i;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lv3i;

    invoke-direct {v0, p0, p2}, Lv3i;-><init>(Lx3i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lv3i;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lv3i;->v:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_35

    if-eq v2, v4, :cond_31

    if-ne v2, v3, :cond_2b

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_31
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_35
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lx3i;->a:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "rewards_notifications"

    invoke-virtual {p2, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_7c

    iget-object p2, p0, Lx3i;->b:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lk3i;

    invoke-virtual {p2}, Lk3i;->c()Z

    move-result p2

    if-eqz p2, :cond_7c

    iput v4, v0, Lv3i;->v:I

    invoke-virtual {p0, p1, v0}, Lx3i;->b(Ln0f;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_7a

    :goto_5e
    check-cast p2, Lo4i;

    if-nez p2, :cond_65

    sget-object p0, Lx1f;->c:Lx1f;

    return-object p0

    :cond_65
    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Ls6d;->a:Ld7a;

    iget-object p1, p1, Ld7a;->e:Ld7a;

    new-instance v2, Lfb9;

    const/16 v4, 0x1a

    invoke-direct {v2, p0, p2, v5, v4}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lv3i;->v:I

    invoke-static {p1, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_7b

    :cond_7a
    return-object v1

    :cond_7b
    return-object p0

    :cond_7c
    sget-object p0, Lx1f;->b:Lx1f;

    return-object p0
.end method

.method public final b(Ln0f;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p2, Lw3i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lw3i;

    iget v1, v0, Lw3i;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lw3i;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lw3i;

    invoke-direct {v0, p0, p2}, Lw3i;-><init>(Lx3i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lw3i;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lw3i;->x:I

    const/16 v3, 0x14

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    iget-object p0, p0, Lx3i;->d:Landroid/content/Context;

    sget-object v8, Lx3i;->f:Lhr5;

    const/4 v9, 0x0

    if-eqz v2, :cond_58

    if-eq v2, v7, :cond_52

    if-eq v2, v6, :cond_4c

    if-eq v2, v5, :cond_42

    if-ne v2, v4, :cond_3c

    iget-object p1, v0, Lw3i;->u:Landroid/graphics/Bitmap;

    iget-object v0, v0, Lw3i;->t:Ln0f;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_db

    :cond_3c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_42
    iget-object p1, v0, Lw3i;->u:Landroid/graphics/Bitmap;

    check-cast p1, Ljava/lang/String;

    iget-object p1, v0, Lw3i;->t:Ln0f;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a7

    :cond_4c
    iget-object p1, v0, Lw3i;->t:Ln0f;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7b

    :cond_52
    iget-object p1, v0, Lw3i;->t:Ln0f;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_67

    :cond_58
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p1, Ln0f;->E:Lm0f;

    iput-object p1, v0, Lw3i;->t:Ln0f;

    iput v7, v0, Lw3i;->x:I

    invoke-virtual {v8, p2, p0, v0}, Lhr5;->m(Lm0f;Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_d7

    :goto_67
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_128

    iget-object p2, p1, Ln0f;->F:Lm0f;

    iput-object p1, v0, Lw3i;->t:Ln0f;

    iput v6, v0, Lw3i;->x:I

    invoke-virtual {v8, p2, p0, v0}, Lhr5;->m(Lm0f;Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_d7

    :goto_7b
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_128

    iget-object p2, p1, Ln0f;->C:Ljava/lang/String;

    if-eqz p2, :cond_8d

    invoke-static {p2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8e

    :cond_8d
    move-object p2, v9

    :cond_8e
    if-eqz p2, :cond_af

    iput-object p1, v0, Lw3i;->t:Ln0f;

    iput-object v9, v0, Lw3i;->u:Landroid/graphics/Bitmap;

    iput v5, v0, Lw3i;->x:I

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Ls6d;->a:Ld7a;

    iget-object v2, v2, Ld7a;->e:Ld7a;

    new-instance v5, Lagb;

    invoke-direct {v5, v3, v9, p2}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v2, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_d7

    :goto_a7
    check-cast p2, Landroid/graphics/Bitmap;

    if-eqz p2, :cond_128

    move-object v10, p2

    move-object p2, p1

    move-object p1, v10

    goto :goto_b1

    :cond_af
    move-object p2, p1

    move-object p1, v9

    :goto_b1
    if-nez p1, :cond_e3

    iget-object v2, p2, Ln0f;->B:Ljava/lang/String;

    if-eqz v2, :cond_bd

    invoke-static {v2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_be

    :cond_bd
    move-object v2, v9

    :cond_be
    if-eqz v2, :cond_e3

    iput-object p2, v0, Lw3i;->t:Ln0f;

    iput-object p1, v0, Lw3i;->u:Landroid/graphics/Bitmap;

    iput v4, v0, Lw3i;->x:I

    sget-object v4, Lbb7;->a:Lcv6;

    sget-object v4, Ls6d;->a:Ld7a;

    iget-object v4, v4, Ld7a;->e:Ld7a;

    new-instance v5, Lagb;

    invoke-direct {v5, v3, v9, v2}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v4, v5, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_d8

    :cond_d7
    return-object v1

    :cond_d8
    move-object v10, v0

    move-object v0, p2

    move-object p2, v10

    :goto_db
    check-cast p2, Landroid/graphics/Bitmap;

    if-eqz p2, :cond_128

    move-object v8, p1

    move-object v7, p2

    move-object p2, v0

    goto :goto_e5

    :cond_e3
    move-object v8, p1

    move-object v7, v9

    :goto_e5
    new-instance p1, Lqie;

    const/16 v0, 0xf

    invoke-direct {p1, p0, v0}, Lqie;-><init>(Landroid/content/Context;B)V

    :try_start_ec
    iget-object p0, p2, Ln0f;->A:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lqie;->p(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object v3

    iget-object p0, p2, Ln0f;->D:Ljava/lang/String;

    if-eqz p0, :cond_fc

    invoke-virtual {p1, p0}, Lqie;->p(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object p0
    :try_end_fa
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ec .. :try_end_fa} :catch_128

    move-object v4, p0

    goto :goto_fd

    :cond_fc
    move-object v4, v9

    :goto_fd
    iget-object v2, p2, Ln0f;->z:Ljava/lang/String;

    new-instance v5, Ln4i;

    iget-object p0, p2, Ln0f;->E:Lm0f;

    iget-object p0, p0, Lm0f;->a:Ljava/lang/String;

    new-instance p1, Lrmg;

    const/16 v0, 0x16

    invoke-direct {p1, p2, v0}, Lrmg;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v5, p0, p1}, Ln4i;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object p0, p2, Ln0f;->F:Lm0f;

    if-eqz p0, :cond_121

    new-instance v9, Ln4i;

    iget-object p1, p0, Lm0f;->a:Ljava/lang/String;

    new-instance p2, Lrmg;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Lrmg;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v9, p1, p2}, Ln4i;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    :cond_121
    move-object v6, v9

    new-instance v1, Lo4i;

    invoke-direct/range {v1 .. v8}, Lo4i;-><init>(Ljava/lang/String;Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ln4i;Ln4i;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-object v1

    :catch_128
    :cond_128
    return-object v9
.end method
