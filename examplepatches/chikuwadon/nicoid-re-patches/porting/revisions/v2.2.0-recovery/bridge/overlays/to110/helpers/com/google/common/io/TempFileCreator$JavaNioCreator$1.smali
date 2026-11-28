.class Lcom/google/common/io/TempFileCreator$JavaNioCreator$1;
.super Ljava/lang/Object;
.source "TempFileCreator.java"

# interfaces
.implements Ljava/nio/file/attribute/FileAttribute;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/TempFileCreator$JavaNioCreator;->userPermissions()Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/nio/file/attribute/FileAttribute<",
        "Lcom/google/common/collect/ImmutableList<",
        "Ljava/nio/file/attribute/AclEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$acl:Lcom/google/common/collect/ImmutableList;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableList;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "val$acl"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 223
    iput-object p1, p0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$1;->val$acl:Lcom/google/common/collect/ImmutableList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public name()Ljava/lang/String;
    .registers 1

    .line 226
    const-string p0, "acl:acl"

    return-object p0
.end method

.method public value()Lcom/google/common/collect/ImmutableList;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/nio/file/attribute/AclEntry;",
            ">;"
        }
    .end annotation

    .line 231
    iget-object p0, p0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$1;->val$acl:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public bridge synthetic value()Ljava/lang/Object;
    .registers 1

    .line 223
    invoke-virtual {p0}, Lcom/google/common/io/TempFileCreator$JavaNioCreator$1;->value()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method
