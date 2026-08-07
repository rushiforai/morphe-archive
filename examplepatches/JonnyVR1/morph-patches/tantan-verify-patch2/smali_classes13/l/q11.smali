.class public Ll/q11;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll/q11;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/q11;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-direct {v0, v1, v1}, Ll/q11;-><init>(II)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/q11;->c:Ll/q11;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/q11;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/q11;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/q11;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 1

    .line 1
    iget v0, p0, Ll/q11;->a:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget p0, p0, Ll/q11;->b:I

    .line 5
    .line 6
    int-to-float p0, p0

    .line 7
    div-float/2addr v0, p0

    .line 8
    return v0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/q11;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/q11;->a:I

    .line 2
    .line 3
    iget p0, p0, Ll/q11;->b:I

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
