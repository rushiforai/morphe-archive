.class public final synthetic Locb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lp12;Landroid/content/Intent;B)V
    .registers 4

    iput-byte p3, p0, Locb;->a:B

    iput-object p1, p0, Locb;->b:Lp12;

    iput-object p2, p0, Locb;->c:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 12

    iget-byte v0, p0, Locb;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Locb;->c:Landroid/content/Intent;

    iget-object p0, p0, Locb;->b:Lp12;

    packed-switch v0, :pswitch_data_4c

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Lxln;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lxln;

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    iget-object p0, p0, Lxln;->b:Lgjm;

    new-instance v2, Lrkn;

    sget-object v3, Lvln;->e:Lvln;

    invoke-direct {v2, v3, v0}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_27
    new-array v0, v1, [Ln6h;

    new-instance v4, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    const-class v5, Ldqi;

    invoke-direct {v4, v1, v5, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    new-instance v3, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v6, 0x1

    const/16 v7, 0x1003

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v10}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v3, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
