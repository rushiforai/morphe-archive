.class public final synthetic Luen;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lven;


# direct methods
.method public synthetic constructor <init>(Lven;B)V
    .registers 3

    iput-byte p2, p0, Luen;->a:B

    iput-object p1, p0, Luen;->b:Lven;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Luen;->a:B

    iget-object p0, p0, Luen;->b:Lven;

    packed-switch v0, :pswitch_data_88

    check-cast p1, Lb2l;

    iget-object p1, p0, Lven;->i:Lxq3;

    if-nez p1, :cond_1e

    new-instance p1, Lxq3;

    invoke-direct {p1, p0}, Lxq3;-><init>(Lven;)V

    iget-object v0, p0, Lven;->h:Lnej;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    iput-object p1, p0, Lven;->i:Lxq3;

    :cond_1e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    iget-object v0, p0, Lven;->g:Lru9;

    check-cast p1, Lb2l;

    iget-object p1, p0, Lven;->c:Lji;

    iget-object p1, p1, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p1}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsvg;

    const/16 v1, 0x800

    invoke-virtual {p1, v1}, Lsvg;->a(I)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_83

    iget-object p1, p0, Lven;->b:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljtg;

    invoke-virtual {p1}, Ljtg;->d()Z

    move-result p1

    if-eqz p1, :cond_83

    iget-object p0, p0, Lven;->a:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_83

    iget-object p0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "vpn.pro_adult_page_promo.show_count"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 p1, 0x2

    if-ge p0, p1, :cond_83

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.pro_adult_page_promo.show_timestamp"

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sub-long/2addr p0, v2

    const-wide/32 v2, 0x5265c00

    div-long/2addr p0, v2

    const-wide/16 v2, 0x7

    cmp-long p0, p0, v2

    if-ltz p0, :cond_83

    const/4 v1, 0x1

    :cond_83
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
