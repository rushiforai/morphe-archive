.class public final synthetic Lmu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpu1;


# direct methods
.method public synthetic constructor <init>(Lpu1;B)V
    .registers 3

    iput-byte p2, p0, Lmu1;->a:B

    iput-object p1, p0, Lmu1;->b:Lpu1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, Lmu1;->a:B

    iget-object p0, p0, Lmu1;->b:Lpu1;

    packed-switch p1, :pswitch_data_3a

    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->i:Lyu1;

    if-eqz p2, :cond_12

    sget-object p1, Le7j;->d:Le7j;

    goto :goto_14

    :cond_12
    sget-object p1, Le7j;->c:Le7j;

    :goto_14
    iget-object p2, p0, Lyu1;->b:Lev1;

    iget-object v0, p2, Lev1;->a:Le7j;

    if-eq v0, p1, :cond_1f

    iput-object p1, p2, Lev1;->a:Le7j;

    invoke-virtual {p0}, Lyu1;->c()V

    :cond_1f
    return-void

    :pswitch_20
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "darken_websites_dark_theme"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_2c
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->h:Ldxe;

    if-eqz p0, :cond_38

    const/4 p1, 0x1

    invoke-virtual {p0, p2, p1}, Ldxe;->T(ZZ)V

    :cond_38
    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_20
    .end packed-switch
.end method
