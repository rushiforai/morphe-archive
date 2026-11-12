.class public final synthetic Lxnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lynj;


# direct methods
.method public synthetic constructor <init>(Lynj;B)V
    .registers 3

    iput-byte p2, p0, Lxnj;->a:B

    iput-object p1, p0, Lxnj;->b:Lynj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lxnj;->a:B

    sget-object v1, Lznj;->a:Lznj;

    iget-object p0, p0, Lxnj;->b:Lynj;

    packed-switch v0, :pswitch_data_52

    check-cast p1, Landroid/net/Uri;

    if-eqz p1, :cond_24

    new-instance v0, Lnwa;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lnwa;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lynj;->b:Ldeg;

    invoke-virtual {v1, p1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p1

    iget-object v1, p0, Lynj;->c:Lqfl;

    invoke-virtual {v1, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ldwh;->f(Lacl;)V

    iput-object v0, p0, Lynj;->i:Lnwa;

    goto :goto_27

    :cond_24
    invoke-virtual {p0, v1}, Lynj;->a(Lcoj;)V

    :goto_27
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a
    check-cast p1, Lx4l;

    const/4 v0, 0x0

    iput-object v0, p0, Lynj;->g:Lhh4;

    invoke-virtual {p1}, Lx4l;->a()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_4b

    sget-object v0, Lf8a;->e:Lf8a;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lynj;->e:Lhoj;

    new-instance v2, Ltmi;

    const/4 v3, 0x6

    invoke-direct {v2, p0, p1, v0, v3}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v0, v2}, Lhoj;->f(Ljava/lang/String;Ltmi;)V

    goto :goto_4e

    :cond_4b
    invoke-virtual {p0, v1}, Lynj;->a(Lcoj;)V

    :goto_4e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method
