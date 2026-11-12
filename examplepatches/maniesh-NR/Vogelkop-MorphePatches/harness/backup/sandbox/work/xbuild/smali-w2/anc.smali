.class public final synthetic Lanc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhnc;


# direct methods
.method public synthetic constructor <init>(Lhnc;B)V
    .registers 3

    iput-byte p2, p0, Lanc;->a:B

    iput-object p1, p0, Lanc;->b:Lhnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lanc;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lanc;->b:Lhnc;

    packed-switch v0, :pswitch_data_52

    check-cast p1, Landroid/net/Uri;

    iget-object p0, p0, Lhnc;->l:Ljze;

    if-eqz p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljze;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    check-cast p1, Lf3j;

    iget-object p0, p0, Lhnc;->k:Lh42;

    if-eqz p1, :cond_23

    iget-object v1, p1, Lf3j;->c:Landroid/net/Uri;

    :cond_23
    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    check-cast p1, Ltpc;

    if-eqz p1, :cond_4f

    iget-object p0, p0, Lhnc;->m:Lpr;

    if-eqz p0, :cond_4f

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v2, "language"

    iget-object v3, p1, Ltpc;->c:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Ltpc;->b:Ljava/lang/String;

    if-eqz p1, :cond_46

    const-string v2, "country"

    invoke-virtual {v0, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_46
    const-string p1, "set_user_preferences"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0, v1}, Lpr;->e(Ljava/lang/String;Ljava/util/List;Lv9i;)V

    :cond_4f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_29
        :pswitch_1b
    .end packed-switch
.end method
