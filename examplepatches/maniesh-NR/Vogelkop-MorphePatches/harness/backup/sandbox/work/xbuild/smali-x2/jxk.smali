.class public final synthetic Ljxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luif;
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkxk;


# direct methods
.method public synthetic constructor <init>(Lkxk;B)V
    .registers 3

    iput-byte p2, p0, Ljxk;->a:B

    iput-object p1, p0, Ljxk;->b:Lkxk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-byte v0, p0, Ljxk;->a:B

    iget-object p0, p0, Ljxk;->b:Lkxk;

    packed-switch v0, :pswitch_data_3a

    iget-object v0, p0, Lkxk;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbf9;

    new-instance v1, Lzzh;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lbf9;->s()Lmyk;

    move-result-object p0

    if-nez p0, :cond_22

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_27

    :cond_22
    new-instance v0, Ljyk;

    invoke-direct {v0, p0, v1}, Ljyk;-><init>(Lmyk;Lzzh;)V

    :goto_27
    return-void

    :pswitch_28
    iget-object v0, p0, Lkxk;->c:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbf9;

    new-instance v1, Lixk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lixk;-><init>(Lkxk;Lbf9;B)V

    invoke-virtual {v0, v1}, Lbf9;->f(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_28
    .end packed-switch
.end method

.method public final i(Lzhj;)V
    .registers 2

    iget-object p0, p0, Ljxk;->b:Lkxk;

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
