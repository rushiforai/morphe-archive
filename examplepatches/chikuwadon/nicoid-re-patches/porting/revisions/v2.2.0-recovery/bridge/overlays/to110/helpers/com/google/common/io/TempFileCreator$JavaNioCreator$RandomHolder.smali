.class final Lcom/google/common/io/TempFileCreator$JavaNioCreator$RandomHolder;
.super Ljava/lang/Object;
.source "TempFileCreator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/TempFileCreator$JavaNioCreator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RandomHolder"
.end annotation


# static fields
.field static final random:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 160
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$RandomHolder;->random:Ljava/security/SecureRandom;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
