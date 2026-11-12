.class public final Lrye;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Lqye;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lyhe;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyhe;-><init>(B)V

    new-instance v2, Lwu5;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lc5o;

    const/16 v4, 0x1a

    invoke-direct {v3, p1, v4}, Lc5o;-><init>(Landroid/content/Context;B)V

    new-instance p1, Lqie;

    const/4 v4, 0x1

    invoke-direct {p1, v4}, Lqie;-><init>(B)V

    const/4 v5, 0x4

    new-array v5, v5, [Lqye;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    aput-object v2, v5, v4

    aput-object v3, v5, v1

    const/4 v0, 0x3

    aput-object p1, v5, v0

    iput-object v5, p0, Lrye;->a:[Lqye;

    return-void
.end method
