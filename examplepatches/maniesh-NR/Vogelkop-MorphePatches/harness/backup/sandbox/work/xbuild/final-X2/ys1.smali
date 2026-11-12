.class public final synthetic Lys1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat1;


# direct methods
.method public synthetic constructor <init>(Lat1;B)V
    .registers 3

    iput-byte p2, p0, Lys1;->a:B

    iput-object p1, p0, Lys1;->b:Lat1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lys1;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lys1;->b:Lat1;

    packed-switch v0, :pswitch_data_62

    sget-object v0, Lvb0;->d:Lvb0;

    iput-object v0, p0, Lat1;->t:Lvb0;

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v2, p0, Lat1;->q:Z

    invoke-virtual {p0, v0, v1, v2}, Lat1;->k(Ld7j;ZZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    sget-object v0, Lvb0;->c:Lvb0;

    iput-object v0, p0, Lat1;->t:Lvb0;

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v2, p0, Lat1;->q:Z

    invoke-virtual {p0, v0, v1, v2}, Lat1;->k(Ld7j;ZZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c
    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v2, p0, Lat1;->q:Z

    invoke-virtual {p0, v0, v1, v2}, Lat1;->k(Ld7j;ZZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a
    iget-object p0, p0, Lat1;->j:Lit1;

    iget-boolean v0, p0, Lit1;->c:Z

    if-nez v0, :cond_5e

    const/4 v0, 0x1

    iput-boolean v0, p0, Lit1;->c:Z

    iget-object v0, p0, Lit1;->b:Lumi;

    new-instance v1, Lvx;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v1, Lbi;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    :cond_5e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_2c
        :pswitch_1a
    .end packed-switch
.end method
