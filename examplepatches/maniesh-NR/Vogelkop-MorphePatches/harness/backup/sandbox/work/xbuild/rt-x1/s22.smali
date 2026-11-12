.class public final synthetic Ls22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv22;


# direct methods
.method public synthetic constructor <init>(Lv22;B)V
    .registers 3

    iput-byte p2, p0, Ls22;->a:B

    iput-object p1, p0, Ls22;->b:Lv22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ls22;->a:B

    sget-object v1, Log;->a:Log;

    const/4 v2, 0x0

    iget-object p0, p0, Ls22;->b:Lv22;

    packed-switch v0, :pswitch_data_116

    check-cast p1, Lndc;

    iget-object p1, p0, Lv22;->i:Lx22;

    iget-object v0, p1, Lx22;->l:Lmrn;

    iget-object v1, v0, Lmrn;->z:Lndc;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    iput-object p0, v0, Lmrn;->z:Lndc;

    :cond_1a
    iget-object v0, p1, Lx22;->n:Lr22;

    iget-object p0, p0, Lv22;->h:Lr22;

    if-ne v0, p0, :cond_32

    if-eqz p0, :cond_39

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    if-eqz p0, :cond_39

    iget-object p0, p0, Lvsn;->l:Lkze;

    if-eqz p0, :cond_39

    sget-object v0, Lng;->a:Lng;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_39

    :cond_32
    if-eqz p0, :cond_39

    iput-object p0, p1, Lx22;->n:Lr22;

    invoke-virtual {p1, p0}, Lx22;->h(Lr22;)V

    :cond_39
    :goto_39
    iget-object p0, p1, Lx22;->g:Landroid/view/ViewGroup;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_42
    check-cast p1, Lndc;

    iget-object p1, p0, Lv22;->i:Lx22;

    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_5b

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_5b

    iget-object v0, v0, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object v0

    if-eqz v0, :cond_5b

    invoke-virtual {v0}, Lqyj;->f()V

    :cond_5b
    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_6c

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_6c

    iget-object v0, v0, Lvsn;->l:Lkze;

    if-eqz v0, :cond_6c

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_6c
    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_81

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_81

    iget-object v0, v0, Lvsn;->k:Lg7m;

    iget-object v0, v0, Lg7m;->g:Ljava/lang/Object;

    check-cast v0, Ld5o;

    sget-object v1, Lu70;->c:Lu70;

    invoke-virtual {v0, v1}, Ld5o;->w(Lu70;)V

    :cond_81
    iget-boolean v0, p0, Lv22;->c:Z

    if-nez v0, :cond_99

    iget-object v0, p1, Lx22;->n:Lr22;

    iget-object p0, p0, Lv22;->h:Lr22;

    if-ne v0, p0, :cond_99

    iget-object p0, p1, Lx22;->l:Lmrn;

    iget-object v0, p0, Lmrn;->z:Lndc;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_97

    iput-object v2, p0, Lmrn;->z:Lndc;

    :cond_97
    iput-object v2, p1, Lx22;->n:Lr22;

    :cond_99
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9c
    check-cast p1, Lndc;

    iget-object p1, p0, Lv22;->i:Lx22;

    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_b5

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_b5

    iget-object v0, v0, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object v0

    if-eqz v0, :cond_b5

    invoke-virtual {v0}, Lqyj;->f()V

    :cond_b5
    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_c6

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_c6

    iget-object v0, v0, Lvsn;->l:Lkze;

    if-eqz v0, :cond_c6

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_c6
    iget-object v0, p0, Lv22;->h:Lr22;

    if-eqz v0, :cond_db

    invoke-virtual {v0}, Lr22;->g()Lvsn;

    move-result-object v0

    if-eqz v0, :cond_db

    iget-object v0, v0, Lvsn;->k:Lg7m;

    iget-object v0, v0, Lg7m;->g:Ljava/lang/Object;

    check-cast v0, Ld5o;

    sget-object v1, Lu70;->d:Lu70;

    invoke-virtual {v0, v1}, Ld5o;->w(Lu70;)V

    :cond_db
    iget-object v0, p1, Lx22;->n:Lr22;

    iget-object v1, p0, Lv22;->h:Lr22;

    if-ne v0, v1, :cond_ef

    iget-object v0, p1, Lx22;->l:Lmrn;

    iget-object v1, v0, Lmrn;->z:Lndc;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_ed

    iput-object v2, v0, Lmrn;->z:Lndc;

    :cond_ed
    iput-object v2, p1, Lx22;->n:Lr22;

    :cond_ef
    iput-object v2, p0, Lv22;->h:Lr22;

    iget-object p0, p1, Lx22;->o:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_f7
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_109

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbx0;

    iget-object p1, p1, Lbx0;->a:Lex0;

    invoke-virtual {p1}, Lex0;->b()V

    goto :goto_f7

    :cond_109
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10c
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lv22;->d:Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_116
    .packed-switch 0x0
        :pswitch_10c
        :pswitch_9c
        :pswitch_42
    .end packed-switch
.end method
