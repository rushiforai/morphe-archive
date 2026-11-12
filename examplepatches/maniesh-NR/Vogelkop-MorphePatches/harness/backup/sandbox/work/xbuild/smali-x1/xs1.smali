.class public final synthetic Lxs1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat1;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Lndc;

.field public final synthetic e:Lqs1;


# direct methods
.method public synthetic constructor <init>(Lat1;Landroid/content/Context;Lndc;Lqs1;B)V
    .registers 6

    iput-byte p5, p0, Lxs1;->a:B

    iput-object p1, p0, Lxs1;->b:Lat1;

    iput-object p2, p0, Lxs1;->c:Landroid/content/Context;

    iput-object p3, p0, Lxs1;->d:Lndc;

    iput-object p4, p0, Lxs1;->e:Lqs1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lxs1;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x2

    packed-switch v0, :pswitch_data_a0

    iget-object v6, p0, Lxs1;->b:Lat1;

    iget-object v0, v6, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    check-cast p1, Ls4i;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v8, p0, Lxs1;->d:Lndc;

    if-eqz p1, :cond_42

    if-eq p1, v1, :cond_34

    if-ne p1, v4, :cond_30

    iget-object p0, v6, Lat1;->n:Le4i;

    sget-object p1, Lo3i;->f:Lo3i;

    sget-object v1, Lzj6;->b:Lgpm;

    iget-object v1, v1, Lgpm;->g:Ljava/lang/String;

    invoke-virtual {p0, v8, p1, v1}, Le4i;->a(Lndc;Lo3i;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p0

    iget-boolean p1, v6, Lat1;->q:Z

    invoke-virtual {v6, p0, v2, p1}, Lat1;->k(Ld7j;ZZ)V

    goto :goto_5d

    :cond_30
    invoke-static {}, Lh9o;->p()V

    goto :goto_5f

    :cond_34
    sget-object p0, Lvb0;->d:Lvb0;

    iput-object p0, v6, Lat1;->t:Lvb0;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p0

    iget-boolean p1, v6, Lat1;->q:Z

    invoke-virtual {v6, p0, v2, p1}, Lat1;->k(Ld7j;ZZ)V

    goto :goto_5d

    :cond_42
    iget-object p1, v6, Lat1;->e:Lgjm;

    new-instance v0, Ljt1;

    iget-object v9, p0, Lxs1;->e:Lqs1;

    iget v1, v9, Lqs1;->b:I

    invoke-direct {v0, v1}, Ljt1;-><init>(I)V

    new-instance v5, Lxs1;

    const/4 v10, 0x0

    iget-object v7, p0, Lxs1;->c:Landroid/content/Context;

    invoke-direct/range {v5 .. v10}, Lxs1;-><init>(Lat1;Landroid/content/Context;Lndc;Lqs1;B)V

    new-instance p0, Lug;

    invoke-direct {p0, v5, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v0, v8, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    :goto_5d
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5f
    return-object v3

    :pswitch_60
    check-cast p1, Lpkj;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object v6, p0, Lxs1;->b:Lat1;

    if-eqz p1, :cond_7e

    if-eq p1, v1, :cond_72

    if-eq p1, v4, :cond_72

    invoke-static {}, Lh9o;->p()V

    goto :goto_9e

    :cond_72
    iget-object p0, v6, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object p0

    iget-boolean p1, v6, Lat1;->q:Z

    invoke-virtual {v6, p0, v2, p1}, Lat1;->k(Ld7j;ZZ)V

    goto :goto_9c

    :cond_7e
    iget-object p1, v6, Lat1;->i:Lumi;

    new-instance v0, Lvx;

    invoke-direct {v0, v6, v4}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance v5, Lws1;

    const/4 v10, 0x0

    iget-object v7, p0, Lxs1;->d:Lndc;

    iget-object v8, p0, Lxs1;->c:Landroid/content/Context;

    iget-object v9, p0, Lxs1;->e:Lqs1;

    invoke-direct/range {v5 .. v10}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v5}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    invoke-virtual {p0, v3, v3}, Loml;->a(Ljava/lang/Object;Ljri;)V

    :goto_9c
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9e
    return-object v3

    nop

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_60
    .end packed-switch
.end method
