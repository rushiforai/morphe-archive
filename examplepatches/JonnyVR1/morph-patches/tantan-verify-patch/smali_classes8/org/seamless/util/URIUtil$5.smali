.class final Lorg/seamless/util/URIUtil$5;
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
    const/16 v0, 0x2f

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->set(I)V

    .line 12
    .line 13
    .line 14
    const/16 v0, 0x3f

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->set(I)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0x3d

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->clear(I)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x26

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->clear(I)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2b

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->clear(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
