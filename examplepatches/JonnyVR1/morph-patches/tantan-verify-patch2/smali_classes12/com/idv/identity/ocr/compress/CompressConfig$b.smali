.class public Lcom/idv/identity/ocr/compress/CompressConfig$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/ocr/compress/CompressConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Lcom/idv/identity/ocr/compress/CompressConfig;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/idv/identity/ocr/compress/CompressConfig;-><init>(Lcom/idv/identity/ocr/compress/CompressConfig$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig$b;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Lcom/idv/identity/ocr/compress/CompressConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/compress/CompressConfig$b;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)Lcom/idv/identity/ocr/compress/CompressConfig$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/compress/CompressConfig$b;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/idv/identity/ocr/compress/CompressConfig;->setMaxSize(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
