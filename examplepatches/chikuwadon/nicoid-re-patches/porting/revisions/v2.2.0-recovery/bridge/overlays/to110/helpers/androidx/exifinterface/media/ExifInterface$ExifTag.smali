.class Landroidx/exifinterface/media/ExifInterface$ExifTag;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/exifinterface/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExifTag"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final number:I

.field public final primaryFormat:I

.field public final secondaryFormat:I


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .registers 4

    .line 3614
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3615
    iput-object p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    .line 3616
    iput p2, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->number:I

    .line 3617
    iput p3, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->primaryFormat:I

    const/4 p1, -0x1

    .line 3618
    iput p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->secondaryFormat:I

    return-void
.end method

.method constructor <init>(Ljava/lang/String;III)V
    .registers 5

    .line 3621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3622
    iput-object p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    .line 3623
    iput p2, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->number:I

    .line 3624
    iput p3, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->primaryFormat:I

    .line 3625
    iput p4, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->secondaryFormat:I

    return-void
.end method


# virtual methods
.method isFormatCompatible(I)Z
    .registers 5

    .line 3629
    iget v0, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->primaryFormat:I

    const/4 v1, 0x1

    const/4 v2, 0x7

    if-eq v0, v2, :cond_6

    if-eq p1, v2, :cond_6

    if-eq v0, p1, :cond_6

    .line 3631
    iget p0, p0, Landroidx/exifinterface/media/ExifInterface$ExifTag;->secondaryFormat:I

    if-eq p0, p1, :cond_6

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    if-ne p0, v2, :cond_1

    :cond_0
    const/4 v2, 0x3

    if-ne p1, v2, :cond_1

    return v1

    :cond_1
    const/16 v2, 0x9

    if-eq v0, v2, :cond_2

    if-ne p0, v2, :cond_3

    :cond_2
    const/16 v2, 0x8

    if-ne p1, v2, :cond_3

    return v1

    :cond_3
    const/16 v2, 0xc

    if-eq v0, v2, :cond_4

    if-ne p0, v2, :cond_5

    :cond_4
    const/16 p0, 0xb

    if-ne p1, p0, :cond_5

    return v1

    :cond_5
    const/4 p0, 0x0

    return p0

    :cond_6
    return v1
.end method
