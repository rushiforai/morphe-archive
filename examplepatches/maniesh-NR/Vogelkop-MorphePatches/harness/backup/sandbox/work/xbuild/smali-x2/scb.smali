.class public final synthetic Lscb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lp12;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lscb;->a:B

    iput-object p1, p0, Lscb;->b:Lp12;

    iput-object p2, p0, Lscb;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 4

    iget-byte v0, p0, Lscb;->a:B

    const-class v1, Ld8j;

    iget-object v2, p0, Lscb;->c:Ljava/lang/Object;

    iget-object p0, p0, Lscb;->b:Lp12;

    packed-switch v0, :pswitch_data_3a

    check-cast v2, Ljava/lang/String;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    new-instance v0, Lc9g;

    invoke-direct {v0, v2}, Lc9g;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_25
    check-cast v2, Landroid/os/Bundle;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    const-class v0, Lwo3;

    invoke-virtual {p0, v0, v2}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
