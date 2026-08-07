.class public final Ll/g8s0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:I


# direct methods
.method public constructor <init>(FFFFI)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/g8s0;->a:F

    .line 5
    .line 6
    iput p2, p0, Ll/g8s0;->b:F

    .line 7
    .line 8
    add-float/2addr p1, p3

    .line 9
    iput p1, p0, Ll/g8s0;->c:F

    .line 10
    .line 11
    add-float/2addr p2, p4

    .line 12
    iput p2, p0, Ll/g8s0;->d:F

    .line 13
    .line 14
    iput p5, p0, Ll/g8s0;->e:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/g8s0;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, Ll/g8s0;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/g8s0;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()F
    .locals 0

    .line 1
    iget p0, p0, Ll/g8s0;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g8s0;->e:I

    .line 2
    .line 3
    return p0
.end method
