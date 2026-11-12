.class Lcom/leanplum/internal/FileManager$HashResults;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/FileManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HashResults"
.end annotation


# instance fields
.field final hash:Ljava/lang/String;

.field final size:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/internal/FileManager$HashResults;->hash:Ljava/lang/String;

    iput p2, p0, Lcom/leanplum/internal/FileManager$HashResults;->size:I

    return-void
.end method
