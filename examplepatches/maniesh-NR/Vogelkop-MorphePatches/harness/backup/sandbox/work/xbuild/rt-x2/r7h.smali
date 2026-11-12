.class public final Lr7h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:D


# direct methods
.method public constructor <init>(ID)V
    .registers 4

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lr7h;->a:I

    .line 14
    iput-wide p2, p0, Lr7h;->b:D

    return-void
.end method

.method public constructor <init>(Lr7h;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lr7h;->a:I

    iput v0, p0, Lr7h;->a:I

    iget-wide v0, p1, Lr7h;->b:D

    iput-wide v0, p0, Lr7h;->b:D

    return-void
.end method
