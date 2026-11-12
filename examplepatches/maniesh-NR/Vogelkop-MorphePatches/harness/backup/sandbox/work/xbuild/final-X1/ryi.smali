.class public final Lryi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Ls9i;


# direct methods
.method public constructor <init>(Ls9i;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lryi;->a:Ls9i;

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, Lryi;->a:Ls9i;

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result p2

    if-eqz p2, :cond_11

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    invoke-virtual {p0, p2}, Ls9i;->J(Ljava/lang/Iterable;)V

    :cond_11
    invoke-virtual {p0, p1}, Ls9i;->Z(Lb2l;)Z

    move-result p1

    if-eqz p1, :cond_1a

    invoke-virtual {p0}, Ls9i;->b0()V

    :cond_1a
    return-void
.end method

.method public final k()V
    .registers 1

    iget-object p0, p0, Lryi;->a:Ls9i;

    invoke-virtual {p0}, Ls9i;->b0()V

    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget-object p0, p0, Lryi;->a:Ls9i;

    invoke-virtual {p0, p1}, Ls9i;->Z(Lb2l;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Ls9i;->b0()V

    :cond_b
    return-void
.end method
