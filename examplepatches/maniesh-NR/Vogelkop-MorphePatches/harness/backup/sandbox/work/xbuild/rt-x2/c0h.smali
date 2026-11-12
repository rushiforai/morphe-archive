.class public final synthetic Lc0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lf0h;Lh42;Lh42;Lkze;B)V
    .registers 6

    .line 13
    iput-byte p5, p0, Lc0h;->a:B

    iput-object p2, p0, Lc0h;->b:Ljava/lang/Object;

    iput-object p3, p0, Lc0h;->c:Ljava/lang/Object;

    iput-object p4, p0, Lc0h;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvvf;Lt6g;Lw3g;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lc0h;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc0h;->b:Ljava/lang/Object;

    iput-object p2, p0, Lc0h;->c:Ljava/lang/Object;

    iput-object p3, p0, Lc0h;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lc0h;->a:B

    const/16 v1, 0x8

    const/4 v2, 0x0

    iget-object v3, p0, Lc0h;->d:Ljava/lang/Object;

    iget-object v4, p0, Lc0h;->c:Ljava/lang/Object;

    iget-object p0, p0, Lc0h;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    check-cast p0, Lvvf;

    check-cast v4, Lt6g;

    check-cast v3, Lw3g;

    check-cast p1, Lpkj;

    sget-object v0, Lpkj;->a:Lpkj;

    if-ne p1, v0, :cond_1b

    const/4 v2, 0x1

    :cond_1b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v2, :cond_2b

    iget-object p0, v4, Lt6g;->e:Lzg7;

    iget-object p0, p0, Lzsi;->k:Lati;

    invoke-interface {p0, v3}, Lati;->remove(Ljava/lang/Object;)V

    :cond_2b
    return-void

    :pswitch_2c
    check-cast p0, Lh42;

    check-cast v4, Lh42;

    check-cast v3, Lkze;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo0h;

    iget-boolean p1, p1, Lo0h;->b:Z

    if-eqz p1, :cond_4f

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_4f

    move v1, v2

    :cond_4f
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_57
    check-cast p0, Lh42;

    check-cast v4, Lh42;

    check-cast v3, Lkze;

    check-cast p1, Lo0h;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo0h;

    iget-boolean p1, p1, Lo0h;->b:Z

    if-eqz p1, :cond_7a

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_7a

    move v1, v2

    :cond_7a
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_57
        :pswitch_2c
    .end packed-switch
.end method
