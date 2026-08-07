.class Lcom/clevertap/android/sdk/gif/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:I

.field b:I

.field c:Lcom/clevertap/android/sdk/gif/b;

.field d:I

.field e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/gif/b;",
            ">;"
        }
    .end annotation
.end field

.field f:[I

.field g:Z

.field h:I

.field i:I

.field j:I

.field k:I

.field l:I

.field m:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 6
    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/clevertap/android/sdk/gif/c;->e:Ljava/util/List;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Lcom/clevertap/android/sdk/gif/c;->f:[I

    .line 16
    .line 17
    iput v0, p0, Lcom/clevertap/android/sdk/gif/c;->j:I

    .line 18
    .line 19
    iput v0, p0, Lcom/clevertap/android/sdk/gif/c;->l:I

    .line 20
    .line 21
    return-void
.end method
