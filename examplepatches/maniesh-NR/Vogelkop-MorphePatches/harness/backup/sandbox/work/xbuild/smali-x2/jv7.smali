.class public final synthetic Ljv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ligi;


# direct methods
.method public synthetic constructor <init>(Ligi;B)V
    .registers 3

    iput-byte p2, p0, Ljv7;->a:B

    iput-object p1, p0, Ljv7;->b:Ligi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Ljv7;->a:B

    iget-object p0, p0, Ljv7;->b:Ligi;

    packed-switch v0, :pswitch_data_9a

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_12

    iget-object p0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Lzqk;

    invoke-virtual {p0, p1}, Lzqk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    check-cast p1, Lhbn;

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    instance-of v1, p1, Lgbn;

    if-eqz v1, :cond_27

    move-object v1, p1

    check-cast v1, Lgbn;

    iget-object v1, v1, Lgbn;->a:Labn;

    iput-object v1, p0, Ligi;->g:Ljava/lang/Object;

    goto :goto_85

    :cond_27
    instance-of v1, p1, Lebn;

    const/4 v2, 0x0

    if-eqz v1, :cond_3b

    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    iget-object p0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Lzqk;

    move-object v1, p1

    check-cast v1, Lebn;

    iget-object v1, v1, Lebn;->a:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lzqk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_85

    :cond_3b
    sget-object v1, Lcbn;->a:Lcbn;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    goto :goto_85

    :cond_46
    instance-of v1, p1, Lfbn;

    if-eqz v1, :cond_75

    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lfbn;

    iget-object v1, v1, Lfbn;->a:Lzan;

    sget-object v3, Lkv7;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v3, v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_85

    invoke-static {v0, v2}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    iget-object p1, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljbn;

    sget-object v0, Libn;->b:Libn;

    new-instance v1, Ljv7;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Ljv7;-><init>(Ligi;B)V

    invoke-virtual {p1, v0, v1}, Ljbn;->f(Libn;Lkotlin/jvm/functions/Function1;)V

    goto :goto_88

    :cond_75
    instance-of p0, p1, Lbbn;

    if-nez p0, :cond_85

    sget-object p0, Ldbn;->a:Ldbn;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_85

    invoke-static {}, Lh9o;->p()V

    goto :goto_8a

    :cond_85
    :goto_85
    invoke-static {v0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :goto_88
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_8a
    return-object v2

    :pswitch_8b
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_96

    invoke-virtual {p0}, Ligi;->y0()V

    :cond_96
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_15
    .end packed-switch
.end method
