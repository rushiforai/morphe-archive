.class public Lcom/google/common/collect/Maps$l$a;
.super Lcom/google/common/collect/Maps$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Maps$l;->entrySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$j<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/common/collect/Maps$l;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/Maps$l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/Maps$l$a;->a:Lcom/google/common/collect/Maps$l;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/common/collect/Maps$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Maps$l$a;->a:Lcom/google/common/collect/Maps$l;

    .line 2
    .line 3
    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Maps$l$a;->a:Lcom/google/common/collect/Maps$l;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$l;->a()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
