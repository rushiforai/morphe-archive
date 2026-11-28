.class public final synthetic Lcom/google/common/io/TempFileCreator$JavaNioCreator$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;


# instance fields
.field public final synthetic f$0:Ljava/io/IOException;


# direct methods
.method public synthetic constructor <init>(Ljava/io/IOException;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$5;->f$0:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public final get()Ljava/nio/file/attribute/FileAttribute;
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$5;->f$0:Ljava/io/IOException;

    invoke-static {p0}, Lcom/google/common/io/TempFileCreator$JavaNioCreator;->lambda$userPermissions$1(Ljava/io/IOException;)Ljava/nio/file/attribute/FileAttribute;

    move-result-object p0

    return-object p0
.end method
