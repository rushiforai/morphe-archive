.class public final synthetic Ld4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lg4l;


# direct methods
.method public synthetic constructor <init>(Lg4l;B)V
    .registers 3

    iput-byte p2, p0, Ld4l;->a:B

    iput-object p1, p0, Ld4l;->b:Lg4l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ld4l;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ld4l;->b:Lg4l;

    packed-switch v0, :pswitch_data_8a

    sget-object v0, Lf4l;->c:Lf4l;

    iget-object v2, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    new-instance v0, Ld4l;

    invoke-direct {v0, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    iget-object v0, p0, Lg4l;->l:Lbz0;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Lzp1;->dismiss()V

    :cond_21
    iget-object p0, p0, Lg4l;->g:Lbp3;

    sget-object v0, Luz3;->h:Luz3;

    invoke-virtual {p0, v0}, Lbp3;->h(Luz3;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b
    invoke-virtual {p0}, Lg4l;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    iput-boolean v1, p0, Lg4l;->m:Z

    sget-object v0, La4l;->c:La4l;

    iget-object p0, p0, Lg4l;->i:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3d
    iput-boolean v1, p0, Lg4l;->m:Z

    sget-object v0, La4l;->d:La4l;

    iget-object p0, p0, Lg4l;->i:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_49
    iget-object p0, p0, Lg4l;->o:La4l;

    return-object p0

    :pswitch_4c
    invoke-virtual {p0}, Lg4l;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_52
    invoke-virtual {p0}, Lg4l;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_58
    iget-boolean v0, p0, Lg4l;->p:Z

    iget-object v2, p0, Lg4l;->j:Ljava/util/ArrayList;

    if-eqz v0, :cond_7e

    sget-object v0, Lf4l;->c:Lf4l;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7e

    iput-boolean v1, p0, Lg4l;->p:Z

    iget-object v0, p0, Lg4l;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    sget-object v1, Loyi;->a:Loyi;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7e

    iget-object p0, p0, Lg4l;->h:Ltn;

    invoke-virtual {p0}, Ltn;->C()V

    goto :goto_87

    :cond_7e
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_87

    invoke-virtual {p0}, Lg4l;->c()V

    :cond_87
    :goto_87
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_58
        :pswitch_52
        :pswitch_4c
        :pswitch_49
        :pswitch_3d
        :pswitch_31
        :pswitch_2b
        :pswitch_1a
    .end packed-switch
.end method
