.class public final Lr7k;
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

    iput-byte p2, p0, Lr7k;->a:B

    iput-object p1, p0, Lr7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 7

    iget-byte p1, p0, Lr7k;->a:B

    iget-object p0, p0, Lr7k;->b:Lv7k;

    packed-switch p1, :pswitch_data_3c

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_search_shortcuts"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p1, p0, Lc8k;->h:Lorm;

    check-cast p1, Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_34

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-static {v0, v1}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v0

    iget-object v0, v0, Lqp0;->b:Lb66;

    const/16 v2, 0x48

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, p2}, Ljf0;->r(IIZ)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_34
    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_start_page_customize_button"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
