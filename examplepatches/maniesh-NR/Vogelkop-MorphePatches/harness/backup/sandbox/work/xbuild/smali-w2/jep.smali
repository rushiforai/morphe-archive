.class public final synthetic Ljep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:Lagm;

.field public final synthetic b:Ln1p;

.field public final synthetic c:Lylp;

.field public final synthetic d:Lyjo;

.field public final synthetic e:Lt0i;


# direct methods
.method public synthetic constructor <init>(Lagm;Ln1p;Lylp;Lyjo;Lt0i;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljep;->a:Lagm;

    iput-object p2, p0, Ljep;->b:Ln1p;

    iput-object p3, p0, Ljep;->c:Lylp;

    iput-object p4, p0, Ljep;->d:Lyjo;

    iput-object p5, p0, Ljep;->e:Lt0i;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 7

    iget-object v0, p0, Ljep;->a:Lagm;

    iget-object v0, v0, Lagm;->d:Ljava/lang/Object;

    check-cast v0, Lp7p;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, p1, Lq0i;

    iget-object v2, p0, Ljep;->b:Ln1p;

    iget-object v3, p0, Ljep;->c:Lylp;

    if-nez v1, :cond_26

    move-object v1, p1

    check-cast v1, Lkzo;

    if-eqz v0, :cond_1e

    iget-object v1, v1, Lkzo;->b:Ljava/lang/String;

    const/16 v4, 0x2335

    invoke-virtual {v0, v4, v1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_1e
    new-instance v1, Lt0i;

    invoke-direct {v1, v3}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v1}, Ln1p;->invoke(Ljava/lang/Object;)V

    :cond_26
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_4b

    if-eqz v0, :cond_37

    iget-object p1, p0, Ljep;->d:Lyjo;

    iget-object p1, p1, Lyjo;->b:Ljava/lang/String;

    const/16 v1, 0x232a

    invoke-virtual {v0, v1, p1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_37
    iget-object p0, p0, Ljep;->e:Lt0i;

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_42

    check-cast p0, Lkzo;

    goto :goto_43

    :cond_42
    move-object v3, p0

    :goto_43
    new-instance p0, Lt0i;

    invoke-direct {p0, v3}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, p0}, Ln1p;->invoke(Ljava/lang/Object;)V

    :cond_4b
    return-void
.end method
