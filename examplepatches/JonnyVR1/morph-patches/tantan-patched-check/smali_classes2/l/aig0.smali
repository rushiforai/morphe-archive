.class public final Ll/aig0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Bitmap;

.field public final c:Lokio/Source;

.field public final d:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Lokio/Source;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    move v0, v1

    .line 14
    :cond_1
    const/4 v1, 0x0

    .line 15
    if-eq v2, v0, :cond_3

    .line 16
    .line 17
    iput-object p1, p0, Ll/aig0;->b:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    iput-object p2, p0, Ll/aig0;->c:Lokio/Source;

    .line 20
    .line 21
    sget-object p1, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    iput p3, p0, Ll/aig0;->a:I

    .line 26
    .line 27
    iput p4, p0, Ll/aig0;->d:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const-string p0, "loadedFrom == null"

    .line 31
    .line 32
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v1

    .line 36
    :cond_3
    invoke-static {}, Ll/aqg0;->a()V

    .line 37
    .line 38
    .line 39
    throw v1
.end method

.method public constructor <init>(Lokio/Source;I)V
    .locals 2

    .line 40
    sget-object v0, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Ll/aig0;-><init>(Landroid/graphics/Bitmap;Lokio/Source;II)V

    return-void

    .line 41
    :cond_0
    const-string p0, "source == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    throw v0
.end method
