.class public final Lxx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzx3;


# instance fields
.field public final a:Llsc;


# direct methods
.method public constructor <init>(Llsc;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxx3;->a:Llsc;

    return-void
.end method


# virtual methods
.method public final a(Lay3;Leri;Lzpa;Lsk6;Lp6l;)Llsc;
    .registers 6

    iget-object p2, p1, Lay3;->l:Lsqh;

    iget-object p3, p1, Lay3;->a:Llqm;

    iget-object p0, p0, Lxx3;->a:Llsc;

    invoke-static {p0, p2, p3}, Lwqm;->g(Llsc;Lsqh;Llqm;)V

    iget-object p2, p0, Lksc;->a:Ljava/lang/String;

    invoke-virtual {p4, p2}, Lsk6;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_13

    iput-object p2, p0, Lksc;->a:Ljava/lang/String;

    :cond_13
    iget-byte p1, p1, Lay3;->o:B

    const/4 p2, 0x1

    if-eq p1, p2, :cond_19

    return-object p0

    :cond_19
    iput-boolean p2, p0, Lksc;->l:Z

    return-object p0
.end method
