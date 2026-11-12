.class public final Lo0h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(JZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lo0h;->a:J

    iput-boolean p3, p0, Lo0h;->b:Z

    iput-boolean p4, p0, Lo0h;->c:Z

    return-void
.end method
