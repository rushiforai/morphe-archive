.class public final synthetic Lnrd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lop5;
.implements Ln5o;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 6

    iput-object p1, p0, Lnrd;->b:Ljava/lang/Object;

    iput-object p2, p0, Lnrd;->c:Ljava/lang/Object;

    iput-object p3, p0, Lnrd;->d:Ljava/lang/Object;

    iput-object p4, p0, Lnrd;->e:Ljava/lang/Object;

    iput-boolean p5, p0, Lnrd;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 11

    iget-object v0, p0, Lnrd;->b:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object v1, p0, Lnrd;->c:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lbsc;

    iget-object v1, p0, Lnrd;->d:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ltjd;

    iget-object v1, p0, Lnrd;->e:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Ljava/io/IOException;

    move-object v2, p1

    check-cast v2, Lprd;

    iget v3, v0, Lro9;->b:I

    iget-object p1, v0, Lro9;->c:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljrd;

    iget-boolean v8, p0, Lnrd;->a:Z

    invoke-interface/range {v2 .. v8}, Lprd;->i(ILjrd;Lbsc;Ltjd;Ljava/io/IOException;Z)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lnrd;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Liji;

    iget-object v0, p0, Lnrd;->c:Ljava/lang/Object;

    check-cast v0, Lfji;

    iget-object v1, p0, Lnrd;->d:Ljava/lang/Object;

    check-cast v1, Lfji;

    iget-object v3, p0, Lnrd;->e:Ljava/lang/Object;

    check-cast v3, Landroid/net/Uri;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_33

    if-eqz v0, :cond_27

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_27

    new-instance p1, Lwii;

    const/4 v1, 0x1

    invoke-direct {p1, v2, v1}, Lwii;-><init>(Liji;B)V

    invoke-virtual {v2, v0, p1}, Liji;->k(Lfji;Lvwh;)V

    :cond_27
    new-instance v1, Lgg7;

    const/4 v6, 0x4

    iget-boolean v5, p0, Lnrd;->a:Z

    invoke-direct/range {v1 .. v6}, Lgg7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v2, v1}, Liji;->s(Lgg7;)V

    goto :goto_36

    :cond_33
    invoke-virtual {v2}, Liji;->P()V

    :goto_36
    const/4 p0, 0x0

    return-object p0
.end method
