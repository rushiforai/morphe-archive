.class public final Lt9c;
.super Lcom/leanplum/callbacks/PostponableAction;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/callbacks/ActionCallback;Ljava/lang/Comparable;B)V
    .registers 4

    iput-byte p3, p0, Lt9c;->a:B

    iput-object p2, p0, Lt9c;->b:Ljava/lang/Object;

    iput-object p1, p0, Lt9c;->c:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lt9c;->a:B

    iput-object p1, p0, Lt9c;->b:Ljava/lang/Object;

    iput-object p2, p0, Lt9c;->c:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/leanplum/callbacks/PostponableAction;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lt9c;->a:B

    const-string v1, "com.opera.android.action.OPEN_URL"

    sget-object v2, Llqm;->K:Llqm;

    iget-object v3, p0, Lt9c;->c:Ljava/lang/Object;

    iget-object p0, p0, Lt9c;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5e

    check-cast p0, Lv9c;

    iget-object p0, p0, Lv9c;->b:Landroid/content/Context;

    new-instance v0, Lwgf;

    check-cast v3, Landroid/net/Uri;

    invoke-direct {v0, v3, v2}, Lwgf;-><init>(Landroid/net/Uri;Llqm;)V

    invoke-virtual {v0, p0, v1}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_20
    check-cast v3, Lv9c;

    iget-object v0, v3, Lv9c;->b:Landroid/content/Context;

    new-instance v4, Lwgf;

    check-cast p0, Landroid/net/Uri;

    invoke-direct {v4, p0, v2}, Lwgf;-><init>(Landroid/net/Uri;Llqm;)V

    iget-object p0, v3, Lv9c;->b:Landroid/content/Context;

    invoke-virtual {v4, p0, v1}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_35
    check-cast v3, Lv9c;

    iget-object v0, v3, Lv9c;->b:Landroid/content/Context;

    new-instance v4, Lwgf;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-direct {v4, p0, v2}, Lwgf;-><init>(Landroid/net/Uri;Llqm;)V

    iget-object p0, v3, Lv9c;->b:Landroid/content/Context;

    invoke-virtual {v4, p0, v1}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_4e
    check-cast p0, Lz0c;

    check-cast v3, Lu9c;

    new-instance v0, Ly0a;

    const/16 v1, 0x9

    invoke-direct {v0, v3, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lz0c;->h(Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_35
        :pswitch_20
    .end packed-switch
.end method
