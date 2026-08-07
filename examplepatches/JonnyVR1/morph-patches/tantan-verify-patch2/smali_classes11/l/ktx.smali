.class public final Ll/ktx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:I

.field public final e:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:J

.field public final g:J


# direct methods
.method public constructor <init>(I)V
    .locals 10

    .line 1
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    move-object v0, p0

    .line 16
    move v1, p1

    .line 17
    invoke-direct/range {v0 .. v9}, Ll/ktx;-><init>(IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(IILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V
    .locals 0
    .param p3    # Lcom/google/android/exoplayer2/k;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput p1, p0, Ll/ktx;->a:I

    .line 23
    iput p2, p0, Ll/ktx;->b:I

    .line 24
    iput-object p3, p0, Ll/ktx;->c:Lcom/google/android/exoplayer2/k;

    .line 25
    iput p4, p0, Ll/ktx;->d:I

    .line 26
    iput-object p5, p0, Ll/ktx;->e:Ljava/lang/Object;

    .line 27
    iput-wide p6, p0, Ll/ktx;->f:J

    .line 28
    iput-wide p8, p0, Ll/ktx;->g:J

    return-void
.end method
