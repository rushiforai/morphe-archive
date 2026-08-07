.class public Ll/efu;
.super Ll/a4s;
.source "SourceFile"


# instance fields
.field private bigTv:Ll/byu;

.field private ext1:Ll/byu;

.field private ext2:Ll/byu;

.field private final extList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation
.end field

.field private mainSuggestLive:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/efu;->extList:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/byu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efu;->bigTv:Ll/byu;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/byu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efu;->ext1:Ll/byu;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/byu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efu;->ext2:Ll/byu;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/byu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/efu;->bigTv:Ll/byu;

    .line 2
    .line 3
    return-void
.end method

.method public e(Ll/byu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/efu;->ext1:Ll/byu;

    .line 2
    .line 3
    return-void
.end method

.method public f(Ll/byu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/efu;->ext2:Ll/byu;

    .line 2
    .line 3
    return-void
.end method
