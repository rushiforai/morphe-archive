.class public final Ls7k;
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

    iput-byte p2, p0, Ls7k;->a:B

    iput-object p1, p0, Ls7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, Ls7k;->a:B

    iget-object p0, p0, Ls7k;->b:Lv7k;

    packed-switch p1, :pswitch_data_30

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_search_shortcuts_tablet"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lc8k;->j:Lmgh;

    iget-object p0, p0, Lmgh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v0, "enable_start_page_opera_logo"

    invoke-interface {p1, v0}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2c

    xor-int/lit8 p1, p2, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_2c
    invoke-virtual {p0, p2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
