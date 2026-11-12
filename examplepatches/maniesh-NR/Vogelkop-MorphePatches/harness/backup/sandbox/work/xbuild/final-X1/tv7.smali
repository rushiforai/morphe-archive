.class public final synthetic Ltv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyv7;


# direct methods
.method public synthetic constructor <init>(Lyv7;B)V
    .registers 3

    iput-byte p2, p0, Ltv7;->a:B

    iput-object p1, p0, Ltv7;->b:Lyv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ltv7;->a:B

    iget-object p0, p0, Ltv7;->b:Lyv7;

    packed-switch v0, :pswitch_data_74

    check-cast p1, Ll0a;

    invoke-virtual {p0}, Lyv7;->n()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Ljava/lang/Boolean;

    iget-object p1, p0, Lyv7;->n:Lxv7;

    iget-boolean v0, p0, Lyv7;->m:Z

    iget-object v1, p0, Lyv7;->d:Liv7;

    iget-object v1, v1, Liv7;->k:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    xor-int/lit8 v2, v1, 0x1

    if-eq v0, v2, :cond_5f

    iput-boolean v2, p0, Lyv7;->m:Z

    if-nez v1, :cond_35

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lxv7;->j(Ljava/lang/CharSequence;)V

    goto :goto_5f

    :cond_35
    iget-object v0, p0, Lyv7;->i:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luv7;

    iget-object v0, v0, Luv7;->d:Lyl2;

    if-eqz v0, :cond_5f

    invoke-interface {v0}, Lyl2;->a()Z

    move-result v1

    if-eqz v1, :cond_48

    const/4 v0, 0x0

    :cond_48
    if-eqz v0, :cond_5f

    iget-object p1, p1, Lxv7;->e:Lyv7;

    iget-object v0, p1, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v0

    if-eqz v0, :cond_5f

    iget-object p1, p1, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lcom/opera/android/widget/UrlFieldEditText;->x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_5f
    :goto_5f
    invoke-virtual {p0}, Lyv7;->n()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_65
    check-cast p1, Leri;

    invoke-virtual {p0}, Lyv7;->n()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6d
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lyv7;->l(Ljava/lang/CharSequence;)Llbf;

    move-result-object p0

    return-object p0

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_6d
        :pswitch_65
        :pswitch_f
    .end packed-switch
.end method
