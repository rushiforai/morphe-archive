.class public final Lf3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lj1c;


# direct methods
.method public constructor <init>(Lj1c;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf3l;->a:Lj1c;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p0, p0, Lf3l;->a:Lj1c;

    iget-object p1, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p2, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast p2, Lk6l;

    iget-object p2, p2, Lk6l;->o:Lb2l;

    if-eqz p2, :cond_13

    invoke-interface {p2}, Lb9l;->T()Lp6l;

    move-result-object p2

    goto :goto_15

    :cond_13
    sget-object p2, Lp6l;->a:Lp6l;

    :goto_15
    invoke-static {p1, p2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Lj1c;->a()V

    :cond_1e
    return-void
.end method
