.class public final synthetic Lnyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqyj;


# direct methods
.method public synthetic constructor <init>(Lqyj;B)V
    .registers 3

    iput-byte p2, p0, Lnyj;->a:B

    iput-object p1, p0, Lnyj;->b:Lqyj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lnyj;->a:B

    iget-object p0, p0, Lnyj;->b:Lqyj;

    packed-switch v0, :pswitch_data_92

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_10

    iget-object p0, p0, Lqyj;->g:Ll62;

    invoke-virtual {p0, p1}, Ll62;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_21

    invoke-virtual {p0}, Lqyj;->f()V

    invoke-virtual {p0}, Lqyj;->m()V

    :cond_21
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24
    check-cast p1, Lju4;

    invoke-virtual {p0}, Lqyj;->f()V

    invoke-virtual {p0}, Lqyj;->m()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f
    check-cast p1, Lhbn;

    iget-object v0, p0, Lqyj;->i:Lode;

    instance-of v1, p1, Lgbn;

    if-eqz v1, :cond_3f

    move-object v1, p1

    check-cast v1, Lgbn;

    iget-object v1, v1, Lgbn;->a:Labn;

    iput-object v1, p0, Lqyj;->l:Labn;

    goto :goto_8b

    :cond_3f
    instance-of v1, p1, Lebn;

    const/4 v2, 0x0

    if-nez v1, :cond_89

    sget-object v1, Lcbn;->a:Lcbn;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_89

    instance-of v1, p1, Lfbn;

    if-eqz v1, :cond_79

    iput-object v2, p0, Lqyj;->l:Labn;

    move-object v1, p1

    check-cast v1, Lfbn;

    iget-object v1, v1, Lfbn;->a:Lzan;

    sget-object v3, Lpyj;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v3, v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_8b

    invoke-static {v0, v2}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    iget-object p1, p0, Lqyj;->e:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljbn;

    sget-object v0, Libn;->b:Libn;

    new-instance v1, Lnyj;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lnyj;-><init>(Lqyj;B)V

    invoke-virtual {p1, v0, v1}, Ljbn;->f(Libn;Lkotlin/jvm/functions/Function1;)V

    goto :goto_8e

    :cond_79
    instance-of p0, p1, Lbbn;

    if-nez p0, :cond_8b

    sget-object p0, Ldbn;->a:Ldbn;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8b

    invoke-static {}, Lh9o;->p()V

    goto :goto_90

    :cond_89
    iput-object v2, p0, Lqyj;->l:Labn;

    :cond_8b
    :goto_8b
    invoke-static {v0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :goto_8e
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_90
    return-object v2

    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_24
        :pswitch_13
    .end packed-switch
.end method
