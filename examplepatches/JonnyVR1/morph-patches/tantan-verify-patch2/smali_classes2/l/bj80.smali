.class public Ll/bj80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Landroid/util/SparseIntArray;

.field public final d:I

.field public final e:I

.field public f:Z

.field public final g:I


# direct methods
.method public constructor <init>(IILandroid/util/SparseIntArray;)V
    .locals 7

    const v5, 0x7fffffff

    const/4 v6, -0x1

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    .line 27
    invoke-direct/range {v0 .. v6}, Ll/bj80;-><init>(IILandroid/util/SparseIntArray;III)V

    return-void
.end method

.method public constructor <init>(IILandroid/util/SparseIntArray;III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    if-lt p2, p1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-static {v0}, Ll/wn80;->i(Z)V

    .line 12
    .line 13
    .line 14
    iput p1, p0, Ll/bj80;->b:I

    .line 15
    .line 16
    iput p2, p0, Ll/bj80;->a:I

    .line 17
    .line 18
    iput-object p3, p0, Ll/bj80;->c:Landroid/util/SparseIntArray;

    .line 19
    .line 20
    iput p4, p0, Ll/bj80;->d:I

    .line 21
    .line 22
    iput p5, p0, Ll/bj80;->e:I

    .line 23
    .line 24
    iput p6, p0, Ll/bj80;->g:I

    .line 25
    .line 26
    return-void
.end method
