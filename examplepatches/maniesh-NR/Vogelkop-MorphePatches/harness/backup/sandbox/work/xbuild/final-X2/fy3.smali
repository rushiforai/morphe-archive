.class public final synthetic Lfy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgy3;


# direct methods
.method public synthetic constructor <init>(Lgy3;B)V
    .registers 3

    iput-byte p2, p0, Lfy3;->a:B

    iput-object p1, p0, Lfy3;->b:Lgy3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-byte p1, p0, Lfy3;->a:B

    iget-object p0, p0, Lfy3;->b:Lgy3;

    packed-switch p1, :pswitch_data_20

    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_rewards"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "tab_auto_grouping"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
