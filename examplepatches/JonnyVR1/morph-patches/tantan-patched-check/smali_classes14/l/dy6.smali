.class public Ll/dy6;
.super Lcom/p1/mobile/putong/core/api/a;
.source "SourceFile"


# instance fields
.field public Q:Lcom/p1/mobile/putong/core/api/c;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/a;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public Z2(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ")",
            "Ll/vg60<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/vg60;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
