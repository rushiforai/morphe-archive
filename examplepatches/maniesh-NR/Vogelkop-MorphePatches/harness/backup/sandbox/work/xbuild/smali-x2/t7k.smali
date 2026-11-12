.class public final Lt7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv7k;


# direct methods
.method public synthetic constructor <init>(Lv7k;B)V
    .registers 3

    iput-byte p2, p0, Lt7k;->a:B

    iput-object p1, p0, Lt7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-byte p1, p0, Lt7k;->a:B

    iget-object p0, p0, Lt7k;->b:Lv7k;

    packed-switch p1, :pswitch_data_20

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_continue_booking"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_weather"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
