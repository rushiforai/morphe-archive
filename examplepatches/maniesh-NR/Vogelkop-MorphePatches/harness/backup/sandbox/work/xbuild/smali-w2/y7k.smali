.class public final Ly7k;
.super Lq37;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(I[IB)V
    .registers 4

    iput-byte p3, p0, Ly7k;->c:B

    invoke-direct {p0, p1, p2}, Lq37;-><init>(I[I)V

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 12

    iget-byte v0, p0, Ly7k;->c:B

    packed-switch v0, :pswitch_data_36

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    return-void

    :pswitch_9
    move v0, p3

    move-object v1, p4

    move-object v2, p5

    move-object v3, p6

    move-object p6, p1

    new-instance p1, Lcek;

    move-object p3, v1

    check-cast p3, Ll1b;

    const/4 p5, 0x3

    const/4 p4, 0x0

    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    invoke-direct/range {p0 .. p5}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    sget-object p3, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p3, p1}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_34

    move-object p1, p6

    move p3, v0

    move-object p4, v1

    move-object p5, v2

    move-object p6, v3

    invoke-super/range {p0 .. p6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ly7k;->c:B

    sparse-switch v0, :sswitch_data_5a

    invoke-super {p0, p1, p2, p3}, Lq37;->b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :sswitch_a
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->J:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llz6;

    invoke-virtual {p0}, Llz6;->a()Lpad;

    move-result-object p0

    invoke-virtual {p0}, Lpad;->k()Lf99;

    move-result-object p0

    invoke-static {p0, p3}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :sswitch_27
    const-string p0, "rt"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string p3, "true"

    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_47

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "tab_gallery.tabui2_bubble_tour_shown"

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_47

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_58

    :cond_47
    const-string p0, "ra"

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_56

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_58

    :cond_56
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_58
    return-object p0

    nop

    :sswitch_data_5a
    .sparse-switch
        0x2 -> :sswitch_27
        0x7 -> :sswitch_a
    .end sparse-switch
.end method
