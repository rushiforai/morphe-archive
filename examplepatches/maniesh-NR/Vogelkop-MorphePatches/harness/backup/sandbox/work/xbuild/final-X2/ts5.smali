.class public final synthetic Lts5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat5;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lat5;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Lts5;->a:B

    iput-object p1, p0, Lts5;->b:Lat5;

    iput-object p2, p0, Lts5;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lts5;->a:B

    const-string v0, "android.intent.action.INSERT"

    iget-object v1, p0, Lts5;->c:Ljava/lang/String;

    iget-object p0, p0, Lts5;->b:Lat5;

    packed-switch p1, :pswitch_data_86

    iget-object p1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lat5;->d:Lqs5;

    iget-object v0, v0, Lqs5;->k:Lsqh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Llqm;->d:Llqm;

    invoke-static {v1, v0, v2}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {p1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    :cond_1f
    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_23
    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1}, Lphj;->t0(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :pswitch_2d
    new-instance p1, Landroid/content/Intent;

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p1, v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz v1, :cond_3b

    const-string v0, "phone"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_3b
    invoke-virtual {p0, p1}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    :pswitch_3f
    const-string p1, "tel:"

    invoke-static {p1, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DIAL"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    :pswitch_54
    const-string p1, "sms:"

    invoke-static {p1, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SENDTO"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    :pswitch_69
    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1}, Lphj;->t0(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :pswitch_73
    new-instance p1, Landroid/content/Intent;

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p1, v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz v1, :cond_81

    const-string v0, "email"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_81
    invoke-virtual {p0, p1}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_73
        :pswitch_69
        :pswitch_54
        :pswitch_3f
        :pswitch_2d
        :pswitch_23
    .end packed-switch
.end method
