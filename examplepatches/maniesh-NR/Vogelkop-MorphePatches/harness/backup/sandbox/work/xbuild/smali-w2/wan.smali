.class public final Lwan;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:I

.field public final d:Z


# direct methods
.method public constructor <init>(JJI)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lwan;->a:J

    iput-wide p3, p0, Lwan;->b:J

    iput p5, p0, Lwan;->c:I

    and-int/lit16 p5, p5, 0xff

    const/4 p1, 0x1

    if-eq p5, p1, :cond_f

    const/4 p1, 0x0

    :cond_f
    iput-boolean p1, p0, Lwan;->d:Z

    return-void
.end method
