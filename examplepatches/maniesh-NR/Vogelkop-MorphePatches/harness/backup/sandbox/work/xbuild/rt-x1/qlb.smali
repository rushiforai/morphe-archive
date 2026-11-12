.class public final synthetic Lqlb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;B)V
    .registers 5

    iput-byte p4, p0, Lqlb;->a:B

    iput-object p1, p0, Lqlb;->b:Ljava/lang/String;

    iput-object p2, p0, Lqlb;->c:Ljava/lang/String;

    iput-object p3, p0, Lqlb;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lqlb;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lqlb;->d:Ljava/lang/String;

    iget-object v5, p0, Lqlb;->c:Ljava/lang/String;

    iget-object p0, p0, Lqlb;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_56

    check-cast p1, Lwa1;

    invoke-interface {p1, v3, p0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v2, v5}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v1, v4}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    check-cast p1, Landroid/content/Intent;

    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "android.intent.extra.HTML_TEXT"

    invoke-virtual {p1, p0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, p0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "android.intent.extra.TITLE"

    invoke-virtual {p1, p0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "text/plain"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a
    check-cast p1, Lwa1;

    invoke-interface {p1, v3, p0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v2, v5}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v1, v4}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_48
    check-cast p1, Lwa1;

    invoke-interface {p1, v3, p0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v2, v5}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v1, v4}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_48
        :pswitch_3a
        :pswitch_1c
    .end packed-switch
.end method
