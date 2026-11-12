.class public final Lcho;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:J

.field public final synthetic j:J


# direct methods
.method public constructor <init>(JJ)V
    .registers 5

    iput-wide p1, p0, Lcho;->i:J

    iput-wide p3, p0, Lcho;->j:J

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Ltxo;

    iget-wide v0, p1, Ltxo;->b:J

    iget-wide v2, p0, Lcho;->i:J

    cmp-long p1, v0, v2

    if-lez p1, :cond_12

    iget-wide p0, p0, Lcho;->j:J

    cmp-long p0, v0, p0

    if-gtz p0, :cond_12

    const/4 p0, 0x0

    goto :goto_13

    :cond_12
    const/4 p0, 0x1

    :goto_13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
