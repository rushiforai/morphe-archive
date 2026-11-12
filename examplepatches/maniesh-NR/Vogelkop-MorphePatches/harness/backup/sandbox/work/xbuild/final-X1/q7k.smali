.class public final Lq7k;
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

    iput-byte p2, p0, Lq7k;->a:B

    iput-object p1, p0, Lq7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 7

    iget-byte p1, p0, Lq7k;->a:B

    iget-object p0, p0, Lq7k;->b:Lv7k;

    packed-switch p1, :pswitch_data_4c

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "live_scores_enabled"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p1

    iget-object p0, p0, Lv7k;->w:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc8j;

    if-nez p2, :cond_43

    iget-object v0, p1, Lc8k;->i:Lskm;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    sget-object v1, Lfc0;->b:Lfc0;

    if-eqz p0, :cond_3e

    const/4 v2, 0x1

    if-eq p0, v2, :cond_3e

    const/4 v2, 0x2

    sget-object v3, Lfc0;->d:Lfc0;

    if-eq p0, v2, :cond_3d

    const/4 v2, 0x3

    if-eq p0, v2, :cond_3d

    const/4 v2, 0x4

    if-eq p0, v2, :cond_3e

    invoke-static {}, Lh9o;->p()V

    goto :goto_4a

    :cond_3d
    move-object v1, v3

    :cond_3e
    check-cast v0, Lx5f;

    invoke-virtual {v0, v1}, Lx5f;->h0(Lfc0;)V

    :cond_43
    iget-object p0, p1, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_newsfeed"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :goto_4a
    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
