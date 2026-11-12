.class public final Lfio;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:B

.field public final f:Z


# direct methods
.method public constructor <init>(IIIIIZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p1, v1, :cond_c

    if-eq p1, v0, :cond_b

    move v0, v1

    goto :goto_c

    :cond_b
    const/4 v0, 0x4

    :cond_c
    :goto_c
    iput-byte v0, p0, Lfio;->a:B

    iput p2, p0, Lfio;->b:I

    iput p3, p0, Lfio;->c:I

    iput p4, p0, Lfio;->d:I

    iput-byte p5, p0, Lfio;->e:B

    iput-boolean p6, p0, Lfio;->f:Z

    return-void
.end method
