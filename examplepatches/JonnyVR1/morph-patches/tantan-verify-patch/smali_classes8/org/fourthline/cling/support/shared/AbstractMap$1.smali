.class Lorg/fourthline/cling/support/shared/AbstractMap$1;
.super Ljava/util/AbstractSet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/support/shared/AbstractMap;->keySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/support/shared/AbstractMap;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/support/shared/AbstractMap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/AbstractMap$1;->this$0:Lorg/fourthline/cling/support/shared/AbstractMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/AbstractMap$1;->this$0:Lorg/fourthline/cling/support/shared/AbstractMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/shared/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TK;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/shared/AbstractMap$1$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/shared/AbstractMap$1$1;-><init>(Lorg/fourthline/cling/support/shared/AbstractMap$1;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/AbstractMap$1;->this$0:Lorg/fourthline/cling/support/shared/AbstractMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/AbstractMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
