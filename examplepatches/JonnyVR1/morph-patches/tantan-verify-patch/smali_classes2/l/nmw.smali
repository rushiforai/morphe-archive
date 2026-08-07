.class public Ll/nmw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Lcom/momocv/imgloader/ImageLoaderInfo;

.field b:Lcom/momocv/imgloader/ImageLoaderParams;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/imgloader/ImageLoaderInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/imgloader/ImageLoaderInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nmw;->a:Lcom/momocv/imgloader/ImageLoaderInfo;

    .line 10
    .line 11
    new-instance v0, Lcom/momocv/imgloader/ImageLoaderParams;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momocv/imgloader/ImageLoaderParams;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nmw;->b:Lcom/momocv/imgloader/ImageLoaderParams;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Lcom/momocv/imgloader/ImageLoaderInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmw;->a:Lcom/momocv/imgloader/ImageLoaderInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/momocv/imgloader/ImageLoaderParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmw;->b:Lcom/momocv/imgloader/ImageLoaderParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/momocv/MMFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmw;->a:Lcom/momocv/imgloader/ImageLoaderInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/imgloader/ImageLoaderInfo;->mmframe_:Lcom/momocv/MMFrame;

    .line 4
    .line 5
    return-object p0
.end method

.method public d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmw;->b:Lcom/momocv/imgloader/ImageLoaderParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/imgloader/ImageLoaderParams;->dst_format_:I

    .line 4
    .line 5
    return-void
.end method
