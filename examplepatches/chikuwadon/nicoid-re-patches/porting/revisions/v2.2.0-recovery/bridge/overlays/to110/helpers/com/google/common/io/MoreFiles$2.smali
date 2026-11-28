.class Lcom/google/common/io/MoreFiles$2;
.super Ljava/lang/Object;
.source "MoreFiles.java"

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/MoreFiles;->isRegularFile([Ljava/nio/file/LinkOption;)Lcom/google/common/base/Predicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate<",
        "Ljava/nio/file/Path;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$optionsCopy:[Ljava/nio/file/LinkOption;


# direct methods
.method constructor <init>([Ljava/nio/file/LinkOption;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "val$optionsCopy"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 348
    iput-object p1, p0, Lcom/google/common/io/MoreFiles$2;->val$optionsCopy:[Ljava/nio/file/LinkOption;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "input"
        }
    .end annotation

    .line 348
    check-cast p1, Ljava/nio/file/Path;

    invoke-virtual {p0, p1}, Lcom/google/common/io/MoreFiles$2;->apply(Ljava/nio/file/Path;)Z

    move-result p0

    return p0
.end method

.method public apply(Ljava/nio/file/Path;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 351
    iget-object p0, p0, Lcom/google/common/io/MoreFiles$2;->val$optionsCopy:[Ljava/nio/file/LinkOption;

    invoke-static {p1, p0}, Ljava/nio/file/Files;->isRegularFile(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MoreFiles.isRegularFile("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/io/MoreFiles$2;->val$optionsCopy:[Ljava/nio/file/LinkOption;

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
