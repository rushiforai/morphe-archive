.class final Lorg/seamless/util/URIUtil$2;
.super Ljava/util/BitSet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/URIUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/BitSet;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/seamless/util/URIUtil;->ALLOWED:Ljava/util/BitSet;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x3b

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->clear(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
