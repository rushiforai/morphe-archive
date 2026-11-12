.class public final synthetic Lew9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfw9;


# direct methods
.method public synthetic constructor <init>(Lfw9;B)V
    .registers 3

    iput-byte p2, p0, Lew9;->a:B

    iput-object p1, p0, Lew9;->b:Lfw9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-byte p1, p0, Lew9;->a:B

    iget-object p0, p0, Lew9;->b:Lfw9;

    packed-switch p1, :pswitch_data_2c

    invoke-virtual {p0}, Lfw9;->I0()Liw9;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "thumb_scroller_enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lfw9;->I0()Liw9;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "tab_switch_swipe_gesture_enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_1f
    invoke-virtual {p0}, Lfw9;->I0()Liw9;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "main_menu_swipe_gesture_enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method
