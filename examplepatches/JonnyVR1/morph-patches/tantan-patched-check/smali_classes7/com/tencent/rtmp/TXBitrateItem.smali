.class public Lcom/tencent/rtmp/TXBitrateItem;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/tencent/rtmp/TXBitrateItem;",
        ">;"
    }
.end annotation


# instance fields
.field public bitrate:I

.field public height:I

.field public index:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/tencent/rtmp/TXBitrateItem;)I
    .locals 0

    .line 8
    iget p0, p0, Lcom/tencent/rtmp/TXBitrateItem;->bitrate:I

    iget p1, p1, Lcom/tencent/rtmp/TXBitrateItem;->bitrate:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/tencent/rtmp/TXBitrateItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/TXBitrateItem;->compareTo(Lcom/tencent/rtmp/TXBitrateItem;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
