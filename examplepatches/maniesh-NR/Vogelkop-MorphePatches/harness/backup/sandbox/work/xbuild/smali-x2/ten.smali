.class public final synthetic Lten;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;
.implements Lfkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lw7j;

.field public final synthetic c:Lsdn;


# direct methods
.method public synthetic constructor <init>(Lw7j;Lsdn;B)V
    .registers 4

    iput-byte p3, p0, Lten;->a:B

    iput-object p1, p0, Lten;->b:Lw7j;

    iput-object p2, p0, Lten;->c:Lsdn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-byte v0, p0, Lten;->a:B

    iget-object v1, p0, Lten;->c:Lsdn;

    iget-object p0, p0, Lten;->b:Lw7j;

    packed-switch v0, :pswitch_data_30

    iget-object v0, p0, Lw7j;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v2, p0, Lw7j;->b:Ljava/lang/Object;

    check-cast v2, Lsz4;

    iget-object v3, p0, Lw7j;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/BrowserActivity;

    new-instance v4, Liyk;

    const/16 v5, 0x9

    invoke-direct {v4, p0, v1, v5}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v2, v3, v4}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lw7j;->b:Ljava/lang/Object;

    check-cast p0, Lsz4;

    invoke-static {p0}, Lyi4;->y(Lsz4;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lsdn;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method

.method public final e(Lgkj;Lhjm;)V
    .registers 3

    sget-object p1, Lhjm;->b:Lhjm;

    if-ne p2, p1, :cond_17

    iget-object p1, p0, Lten;->b:Lw7j;

    iget-object p1, p1, Lw7j;->b:Ljava/lang/Object;

    check-cast p1, Lsz4;

    invoke-static {p1}, Lyi4;->y(Lsz4;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Lten;->c:Lsdn;

    invoke-virtual {p0, p1}, Lsdn;->run(Ljava/lang/Object;)V

    :cond_17
    return-void
.end method
