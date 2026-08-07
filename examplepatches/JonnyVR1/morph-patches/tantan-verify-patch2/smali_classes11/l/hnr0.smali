.class public final Ll/hnr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:Ll/sqr0;

.field public final g:I

.field public final h:[J
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final i:[J
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:I

.field public final k:[Ll/inr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIJJJLl/sqr0;I[Ll/inr0;I[J[J)V
    .locals 0
    .param p11    # [Ll/inr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # [J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p14    # [J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hnr0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/hnr0;->b:I

    .line 7
    .line 8
    iput-wide p3, p0, Ll/hnr0;->c:J

    .line 9
    .line 10
    iput-wide p5, p0, Ll/hnr0;->d:J

    .line 11
    .line 12
    iput-wide p7, p0, Ll/hnr0;->e:J

    .line 13
    .line 14
    iput-object p9, p0, Ll/hnr0;->f:Ll/sqr0;

    .line 15
    .line 16
    iput p10, p0, Ll/hnr0;->g:I

    .line 17
    .line 18
    iput-object p11, p0, Ll/hnr0;->k:[Ll/inr0;

    .line 19
    .line 20
    iput p12, p0, Ll/hnr0;->j:I

    .line 21
    .line 22
    iput-object p13, p0, Ll/hnr0;->h:[J

    .line 23
    .line 24
    iput-object p14, p0, Ll/hnr0;->i:[J

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(I)Ll/inr0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hnr0;->k:[Ll/inr0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method
