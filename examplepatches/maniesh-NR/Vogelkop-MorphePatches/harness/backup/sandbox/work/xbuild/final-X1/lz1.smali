.class public final Llz1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldul;


# instance fields
.field public final synthetic a:Ltz1;


# direct methods
.method public constructor <init>(Ltz1;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz1;->a:Ltz1;

    return-void
.end method


# virtual methods
.method public final a(Ljul;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Llz1;->a:Ltz1;

    invoke-virtual {p0, p1}, Ltz1;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_b

    return-object p0

    :cond_b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b()Lkotlin/Unit;
    .registers 1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(Landroid/net/Uri;Lcek;)Ljava/lang/Object;
    .registers 4

    const-string v0, "s"

    invoke-static {p1, v0}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_13

    iget-object p0, p0, Llz1;->a:Ltz1;

    invoke-virtual {p0, p1, p2}, Ltz1;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_13

    return-object p0

    :cond_13
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
