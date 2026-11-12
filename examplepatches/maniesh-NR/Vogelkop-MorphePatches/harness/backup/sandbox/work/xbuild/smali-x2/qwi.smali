.class public final Lqwi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnwi;

.field public final b:Lhwi;


# direct methods
.method public constructor <init>(Lnwi;Lhwi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqwi;->a:Lnwi;

    iput-object p2, p0, Lqwi;->b:Lhwi;

    return-void
.end method

.method public static a()Lqwi;
    .registers 4

    new-instance v0, Lqwi;

    new-instance v1, Lhwi;

    new-instance v2, Lmwi;

    invoke-direct {v2}, Lmwi;-><init>()V

    sget-object v3, Lnwi;->a:Lnwi;

    invoke-direct {v1, v2, v3}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v3, v1}, Lqwi;-><init>(Lnwi;Lhwi;)V

    return-object v0
.end method
