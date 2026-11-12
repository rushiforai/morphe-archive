.class public final Lf6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:La2l;


# direct methods
.method public constructor <init>(La2l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf6l;->a:La2l;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p0, p0, Lf6l;->a:La2l;

    if-eqz p1, :cond_9

    check-cast p1, Ld7l;

    invoke-virtual {p1, p0}, Ld7l;->s0(La2l;)V

    :cond_9
    check-cast p2, Ld7l;

    invoke-virtual {p2, p0}, Ld7l;->e0(La2l;)V

    invoke-interface {p0, p2}, La2l;->G(Lb2l;)V

    return-void
.end method
