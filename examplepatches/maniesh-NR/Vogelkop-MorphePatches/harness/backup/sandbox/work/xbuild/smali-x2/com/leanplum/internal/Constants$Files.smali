.class Lcom/leanplum/internal/Constants$Files;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Files"
.end annotation


# static fields
.field public static final MAX_UPLOAD_BATCH_FILES:I = 0x10

.field public static final MAX_UPLOAD_BATCH_SIZES:I = 0x1900000


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
