.class public final Lmmg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Z


# direct methods
.method public constructor <init>(JJZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lmmg;->a:J

    iput-wide p3, p0, Lmmg;->b:J

    iput-boolean p5, p0, Lmmg;->c:Z

    return-void
.end method
