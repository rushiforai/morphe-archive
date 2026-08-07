.class public Lcom/jiechic/library/android/snappy/SnappyError;
.super Ljava/lang/Error;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final errorCode:Lcom/jiechic/library/android/snappy/SnappyErrorCode;


# direct methods
.method public constructor <init>(Lcom/jiechic/library/android/snappy/SnappyErrorCode;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Error;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/jiechic/library/android/snappy/SnappyError;->errorCode:Lcom/jiechic/library/android/snappy/SnappyErrorCode;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/jiechic/library/android/snappy/SnappyErrorCode;Ljava/lang/Error;)V
    .locals 0

    .line 7
    invoke-direct {p0, p2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    .line 8
    iput-object p1, p0, Lcom/jiechic/library/android/snappy/SnappyError;->errorCode:Lcom/jiechic/library/android/snappy/SnappyErrorCode;

    return-void
.end method

.method public constructor <init>(Lcom/jiechic/library/android/snappy/SnappyErrorCode;Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0, p2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 10
    iput-object p1, p0, Lcom/jiechic/library/android/snappy/SnappyError;->errorCode:Lcom/jiechic/library/android/snappy/SnappyErrorCode;

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/jiechic/library/android/snappy/SnappyError;->errorCode:Lcom/jiechic/library/android/snappy/SnappyErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "[%s] %s"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
