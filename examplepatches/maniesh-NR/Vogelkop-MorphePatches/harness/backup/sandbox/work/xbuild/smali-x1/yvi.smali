.class public final synthetic Lyvi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:Lawi;


# direct methods
.method public synthetic constructor <init>(Lawi;)V
    .registers 2

    iput-object p1, p0, Lyvi;->a:Lawi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-object p0, p0, Lyvi;->a:Lawi;

    iget-object p1, p0, Lawi;->r:Lvzk;

    iget-object p1, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p1, Lwc7;

    iget-object p1, p1, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "dns_over_https_enabled"

    invoke-virtual {p1, p2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object p0, p0, Lawi;->u:Lei;

    iget-object p0, p0, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaRadioGroup;

    if-eqz p2, :cond_19

    const/4 p1, 0x0

    goto :goto_1b

    :cond_19
    const/16 p1, 0x8

    :goto_1b
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
