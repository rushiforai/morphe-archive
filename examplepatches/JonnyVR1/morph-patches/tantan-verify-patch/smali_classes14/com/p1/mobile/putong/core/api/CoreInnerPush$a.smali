.class public Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreInnerPush;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

.field public k:J

.field public l:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    const/4 v1, 0x0

    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;->DEFAULT:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->h:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 43
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->i:Ljava/util/List;

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;->DEFAULT_MESSAGE:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->j:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    const-wide/16 v1, 0xbb8

    .line 45
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->k:J

    .line 46
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->l:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;->DEFAULT:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->h:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 18
    .line 19
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->i:Ljava/util/List;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;->DEFAULT_MESSAGE:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->j:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 28
    .line 29
    const-wide/16 v1, 0xbb8

    .line 30
    .line 31
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->k:J

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->l:Z

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->j:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->l:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->h:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/util/List;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;)",
            "Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
