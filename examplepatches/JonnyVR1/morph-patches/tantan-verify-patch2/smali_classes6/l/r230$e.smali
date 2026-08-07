.class public final Ll/r230$e;
.super Ll/r230$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r230;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field public d:Lcom/facebook/imagepipeline/common/Priority;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r230$f;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 5
    .line 6
    iput-object p1, p0, Ll/r230$e;->d:Lcom/facebook/imagepipeline/common/Priority;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic c(Ll/r230$e;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$e;->f:I

    return p0
.end method

.method public static bridge synthetic d(Ll/r230$e;)Lcom/facebook/imagepipeline/common/Priority;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230$e;->d:Lcom/facebook/imagepipeline/common/Priority;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/r230$e;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$e;->e:I

    return p0
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/String;)Ll/r230$f;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/r230$f;->b(Ljava/lang/String;)Ll/r230$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Ll/r230;
    .locals 1

    .line 1
    new-instance v0, Ll/r230;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r230;-><init>(Ll/r230$e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public g(Lcom/facebook/imagepipeline/common/Priority;)Ll/r230$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$e;->d:Lcom/facebook/imagepipeline/common/Priority;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(II)Ll/r230$e;
    .locals 0

    .line 1
    iput p1, p0, Ll/r230$e;->e:I

    .line 2
    .line 3
    iput p2, p0, Ll/r230$e;->f:I

    .line 4
    .line 5
    return-object p0
.end method
