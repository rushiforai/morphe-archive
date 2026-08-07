.class public Ll/wrd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6d0;


# instance fields
.field private a:I

.field private b:I

.field private final c:I

.field private final d:F


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v2, 0x9c4

    .line 11
    invoke-direct {p0, v2, v0, v1}, Ll/wrd;-><init>(IIF)V

    return-void
.end method

.method public constructor <init>(IIF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/wrd;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/wrd;->c:I

    .line 7
    .line 8
    iput p3, p0, Ll/wrd;->d:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wrd;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public b(Lcom/android/volley/VolleyError;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/wrd;->b:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/wrd;->b:I

    .line 6
    .line 7
    iget v0, p0, Ll/wrd;->a:I

    .line 8
    .line 9
    int-to-float v1, v0

    .line 10
    iget v2, p0, Ll/wrd;->d:F

    .line 11
    .line 12
    mul-float/2addr v1, v2

    .line 13
    float-to-int v1, v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    iput v0, p0, Ll/wrd;->a:I

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wrd;->d()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    throw p1
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wrd;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/wrd;->b:I

    .line 2
    .line 3
    iget p0, p0, Ll/wrd;->c:I

    .line 4
    .line 5
    if-gt v0, p0, :cond_0

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
