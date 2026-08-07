.class public Ll/qo00;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public b:Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:I

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/qo00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Ll/qo00;->d:Z

    .line 37
    iput v0, p0, Ll/qo00;->e:I

    .line 38
    iput v0, p0, Ll/qo00;->f:I

    .line 39
    iput v0, p0, Ll/qo00;->g:I

    .line 40
    iput-boolean v0, p0, Ll/qo00;->h:Z

    .line 41
    iput-boolean v0, p0, Ll/qo00;->i:Z

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/qo00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/qo00;->d:Z

    .line 9
    .line 10
    iput v0, p0, Ll/qo00;->e:I

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/qo00;->h:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/qo00;->i:Z

    .line 15
    .line 16
    iput-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iput p2, p0, Ll/qo00;->f:I

    .line 19
    .line 20
    iput p3, p0, Ll/qo00;->g:I

    .line 21
    .line 22
    iput p4, p0, Ll/qo00;->c:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;ZII)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput v0, p0, Ll/qo00;->g:I

    .line 27
    iput-boolean v0, p0, Ll/qo00;->h:Z

    .line 28
    iput-boolean v0, p0, Ll/qo00;->i:Z

    .line 29
    iput-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    iput-object p2, p0, Ll/qo00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 31
    iput-boolean p3, p0, Ll/qo00;->d:Z

    .line 32
    iput p4, p0, Ll/qo00;->e:I

    .line 33
    iput p5, p0, Ll/qo00;->f:I

    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/IntlOperationArticles;)Ll/qo00;
    .locals 2

    .line 1
    new-instance v0, Ll/qo00;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qo00;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Ll/qo00;->i:Z

    .line 8
    .line 9
    iput-object p0, v0, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 10
    .line 11
    return-object v0
.end method

.method public static b(Ljava/util/List;)Ll/qo00;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;)",
            "Ll/qo00;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qo00;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qo00;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Ll/qo00;->h:Z

    .line 8
    .line 9
    iput-object p0, v0, Ll/qo00;->k:Ljava/util/List;

    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
