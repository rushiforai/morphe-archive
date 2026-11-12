.class public final synthetic Lbt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lct;


# direct methods
.method public synthetic constructor <init>(Lct;B)V
    .registers 3

    iput-byte p2, p0, Lbt;->a:B

    iput-object p1, p0, Lbt;->b:Lct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lbt;->a:B

    iget-object p0, p0, Lbt;->b:Lct;

    packed-switch v0, :pswitch_data_3e

    check-cast p1, Lgt;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object p0, p0, Lju;->e:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lorm;

    invoke-static {p1}, Ltw2;->t(Lgt;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, v0}, Lx5f;->j(ILjava/lang/String;Z)V

    :cond_21
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24
    check-cast p1, [Lst;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object v0, p0, Lju;->c:Lqb7;

    invoke-virtual {v0, p1}, Lqb7;->v([Lst;)Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, p0, Lju;->k:[Lst;

    invoke-virtual {v0, p1}, Lqb7;->E([Lst;)[Lst;

    invoke-virtual {p0}, Lju;->f()V

    :cond_3a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
