.class public final Ll/tuf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tuf$b;
    }
.end annotation


# instance fields
.field private a:Z

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/momocv/beauty/BeautyProcessor;

.field private d:Ljava/lang/String;

.field private volatile e:Z


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/tuf;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/tuf;->e:Z

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/tuf;->b:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Ll/tuf$a;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ll/tuf;-><init>()V

    return-void
.end method

.method public static a()Ll/tuf;
    .locals 1

    .line 1
    invoke-static {}, Ll/tuf$b;->a()Ll/tuf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momocv/beauty/BeautyProcessor;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momocv/beauty/BeautyProcessor;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/tuf;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/tuf;->e:Z

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 25
    .line 26
    iget-object v1, p0, Ll/tuf;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/momocv/beauty/BeautyProcessor;->LoadWarpConfig(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    iput-boolean v0, p0, Ll/tuf;->e:Z

    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/momocv/beauty/BeautyProcessor;->GetWarpKeyPoints(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tuf;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Ll/tuf;->e:Z

    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/beauty/BeautyProcessor;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/tuf;->c:Lcom/momocv/beauty/BeautyProcessor;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
