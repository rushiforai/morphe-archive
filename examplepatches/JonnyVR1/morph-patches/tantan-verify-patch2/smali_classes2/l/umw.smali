.class public Ll/umw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Lcom/momocv/MMFrame;

.field b:Lcom/core/glcore/util/ImageFrame;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/umw;->b:Lcom/core/glcore/util/ImageFrame;

    .line 6
    .line 7
    new-instance v0, Lcom/momocv/MMFrame;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momocv/MMFrame;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()[B
    .locals 1

    .line 1
    iget-object v0, p0, Ll/umw;->b:Lcom/core/glcore/util/ImageFrame;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/core/glcore/util/ImageFrame;->getImageByteData()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 13
    .line 14
    return-object p0
.end method

.method public b()Lcom/momocv/MMFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/MMFrame;->height_:I

    .line 4
    .line 5
    return p0
.end method

.method public d()Lcom/core/glcore/util/ImageFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->b:Lcom/core/glcore/util/ImageFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/MMFrame;->width_:I

    .line 4
    .line 5
    return p0
.end method

.method public f(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/MMFrame;->data_len_:I

    .line 4
    .line 5
    return-void
.end method

.method public g([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 4
    .line 5
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/MMFrame;->format_:I

    .line 4
    .line 5
    return-void
.end method

.method public i(Lcom/momocv/MMFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/MMFrame;->height_:I

    .line 4
    .line 5
    return-void
.end method

.method public k(Lcom/core/glcore/util/ImageFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/umw;->b:Lcom/core/glcore/util/ImageFrame;

    .line 2
    .line 3
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/MMFrame;->step_:I

    .line 4
    .line 5
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umw;->a:Lcom/momocv/MMFrame;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/MMFrame;->width_:I

    .line 4
    .line 5
    return-void
.end method
