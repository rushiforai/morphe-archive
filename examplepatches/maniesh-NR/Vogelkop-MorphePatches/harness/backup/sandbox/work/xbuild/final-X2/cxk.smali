.class public final Lcxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Li3j;


# direct methods
.method public constructor <init>(Li3j;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcxk;->a:Li3j;

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, Lcxk;->a:Li3j;

    iget-object p0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_13

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-static {p1}, LJ/N;->MmlwU2A7(I)V

    :cond_13
    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget-object p0, p0, Lcxk;->a:Li3j;

    invoke-virtual {p0, p1}, Li3j;->L(Lb2l;)Z

    move-result p2

    if-eqz p2, :cond_b

    invoke-virtual {p0, p1}, Li3j;->h(Lb2l;)V

    :cond_b
    return-void
.end method
