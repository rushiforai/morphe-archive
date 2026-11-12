.class public final Lptj;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:F

.field public u:F

.field public v:Lxe1;

.field public w:Lmqh;

.field public synthetic x:Ljava/lang/Object;

.field public y:I


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iput-object p1, p0, Lptj;->x:Ljava/lang/Object;

    iget p1, p0, Lptj;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lptj;->y:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lxvg;->j(Lopi;FFLxe1;La2k;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
