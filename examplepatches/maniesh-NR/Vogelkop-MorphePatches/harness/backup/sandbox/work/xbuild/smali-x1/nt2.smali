.class public final Lnt2;
.super Ltim;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ll6g;Luii;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lnt2;->b:B

    iput-object p1, p0, Lnt2;->c:Ljava/lang/Object;

    invoke-direct {p0, p2}, Ltim;-><init>(Luim;)V

    return-void
.end method

.method public synthetic constructor <init>(Luim;Ljava/lang/Object;B)V
    .registers 4

    .line 9
    iput-byte p3, p0, Lnt2;->b:B

    iput-object p2, p0, Lnt2;->c:Ljava/lang/Object;

    invoke-direct {p0, p1}, Ltim;-><init>(Luim;)V

    return-void
.end method


# virtual methods
.method public final onFinished(Lhjm;)V
    .registers 6

    iget-byte p1, p0, Lnt2;->b:B

    iget-object p0, p0, Lnt2;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_60

    check-cast p0, Lojh;

    iget-object p1, p0, Lojh;->c:Lsa2;

    invoke-virtual {p1}, Lsa2;->e()Z

    move-result p1

    if-eqz p1, :cond_41

    iget-object p0, p0, Lojh;->a:Lyo7;

    iget-object p1, p0, Lyo7;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/api/Callback;

    iget-object v0, p0, Lyo7;->c:Ljava/lang/Object;

    check-cast v0, Lvjh;

    iget-object p0, p0, Lyo7;->d:Ljava/lang/Object;

    check-cast p0, Lqjh;

    new-instance v1, Lpjh;

    iget-object v0, v0, Lvjh;->b:Ljava/lang/Integer;

    const/4 v2, 0x0

    sget-object v3, Leo0;->c:Leo0;

    invoke-direct {v1, v2, v3, v2, v0}, Lpjh;-><init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    invoke-static {v3, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_41

    iget-object p0, p0, Lqjh;->c:Lgw3;

    new-instance p1, Lglj;

    const v0, 0x7f14076b

    const/16 v1, 0x1388

    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lgw3;->f(Lo93;)V

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Lwjh;

    iget-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p1, Lsa2;

    invoke-virtual {p1}, Lsa2;->e()Z

    move-result p1

    if-eqz p1, :cond_59

    iget-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p1, Lai;

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lvjh;

    invoke-virtual {p1, p0}, Lai;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_59
    return-void

    :pswitch_5a
    check-cast p0, Ll6g;

    invoke-virtual {p0}, Ll6g;->run()V

    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_5a
        :pswitch_42
    .end packed-switch
.end method
