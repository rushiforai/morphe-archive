.class public final Lc3g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:[B


# direct methods
.method public constructor <init>(J[BJ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lc3g;->a:J

    iput-wide p4, p0, Lc3g;->b:J

    iput-object p3, p0, Lc3g;->c:[B

    return-void
.end method
