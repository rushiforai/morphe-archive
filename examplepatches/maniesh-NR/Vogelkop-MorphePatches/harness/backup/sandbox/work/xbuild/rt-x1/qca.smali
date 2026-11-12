.class public final Lqca;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly5i;

.field public final b:Lnb2;


# direct methods
.method public constructor <init>(Ly5i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqca;->a:Ly5i;

    new-instance p1, Lnb2;

    const/4 v0, 0x6

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lqca;->b:Lnb2;

    return-void
.end method


# virtual methods
.method public final a(Lyca;Lkuk;)Ljava/lang/Object;
    .registers 5

    new-instance v0, Lry7;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p1, v1}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lqca;->a:Ly5i;

    const/4 p1, 0x0

    const/4 v1, 0x1

    invoke-static {p2, p0, p1, v1, v0}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_14

    return-object p0

    :cond_14
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
