.class public final synthetic Le0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv48;


# direct methods
.method public synthetic constructor <init>(Lv48;B)V
    .registers 3

    iput-byte p2, p0, Le0i;->a:B

    iput-object p1, p0, Le0i;->b:Lv48;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Le0i;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    sget-object v2, Llqm;->d:Llqm;

    iget-object p0, p0, Le0i;->b:Lv48;

    packed-switch p1, :pswitch_data_76

    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lf0i;

    invoke-virtual {p0}, Luim;->h0()V

    return-void

    :pswitch_13
    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lf0i;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "https://help.opera.com/mobile/android/#incorrectPassword"

    invoke-static {p0, v2, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-virtual {p0, v0}, Lvx3;->c(Z)V

    new-instance p1, Lay3;

    invoke-direct {p1, p0}, Lay3;-><init>(Lvx3;)V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_2c
    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lf0i;

    iget-object p1, p0, Lf0i;->f:Ldb;

    invoke-virtual {p1}, Ldb;->c()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    const/4 v4, 0x6

    invoke-static {v4}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_56

    const-string v4, "username"

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_56
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, v0}, Lvx3;->c(Z)V

    new-instance v0, Lay3;

    invoke-direct {v0, p1}, Lay3;-><init>(Lvx3;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lf0i;->k:Ll31;

    if-eqz p0, :cond_74

    invoke-virtual {p0}, Ll31;->run()V

    :cond_74
    return-void

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_13
    .end packed-switch
.end method
