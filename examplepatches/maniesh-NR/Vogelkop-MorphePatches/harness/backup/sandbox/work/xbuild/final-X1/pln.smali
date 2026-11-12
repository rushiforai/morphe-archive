.class public final synthetic Lpln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqln;


# direct methods
.method public synthetic constructor <init>(Lqln;B)V
    .registers 3

    iput-byte p2, p0, Lpln;->a:B

    iput-object p1, p0, Lpln;->b:Lqln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lpln;->a:B

    iget-object p0, p0, Lpln;->b:Lqln;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_46

    iget-object p1, p0, Lqln;->f:Lami;

    iget-object p1, p1, Lami;->e:Ljava/lang/Object;

    check-cast p1, Lvq8;

    invoke-virtual {p1}, Lvq8;->i()Z

    move-result p1

    if-eqz p1, :cond_20

    sget-object p1, Lava;->a:Lcva;

    new-instance v0, Lnln;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lnln;-><init>(Lqln;B)V

    invoke-virtual {p1, v0}, Lcva;->a(Ljava/lang/Runnable;)V

    :cond_20
    return-void

    :pswitch_21
    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p1

    const-string v0, "local_dir"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    invoke-virtual {p0}, Lqln;->r()V

    :cond_30
    return-void

    :pswitch_31
    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p1

    const-string v0, "favorites"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_40

    invoke-virtual {p0}, Lqln;->r()V

    :cond_40
    return-void

    :pswitch_41
    invoke-virtual {p0}, Lqln;->r()V

    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_41
        :pswitch_31
        :pswitch_21
    .end packed-switch
.end method
