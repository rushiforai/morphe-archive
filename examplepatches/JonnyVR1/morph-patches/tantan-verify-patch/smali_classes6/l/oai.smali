.class public Ll/oai;
.super Ll/yel0;
.source "SourceFile"


# static fields
.field public static e:I = 0xc


# instance fields
.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yel0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oai;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oai;->d:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Ll/oai;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oai;->g(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public d()Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Ll/oai;->b:Ljava/lang/String;

    .line 4
    .line 5
    sget v2, Ll/oai;->e:I

    .line 6
    .line 7
    iget-object v3, p0, Ll/oai;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/oai;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/jka;->bd(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/nai;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/nai;-><init>(Ll/oai;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/yel0;->c(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/oai;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Ll/yel0;->e(Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/yel0;->e(Z)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {p1}, Ll/yel0;->a(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
