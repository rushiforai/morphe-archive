.class public final Ll/cjg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudLogger;


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Ll/cjg0;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final log(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    iget v1, p0, Ll/cjg0;->a:I

    .line 8
    .line 9
    if-gt v1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x3

    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    iget v1, p0, Ll/cjg0;->a:I

    .line 16
    .line 17
    if-gt v1, v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x4

    .line 21
    if-ne v0, p1, :cond_2

    .line 22
    .line 23
    iget v1, p0, Ll/cjg0;->a:I

    .line 24
    .line 25
    if-gt v1, v0, :cond_2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    const/4 v0, 0x5

    .line 29
    if-ne v0, p1, :cond_3

    .line 30
    .line 31
    iget v1, p0, Ll/cjg0;->a:I

    .line 32
    .line 33
    if-gt v1, v0, :cond_3

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    const/4 v0, 0x6

    .line 37
    if-ne v0, p1, :cond_4

    .line 38
    .line 39
    iget v1, p0, Ll/cjg0;->a:I

    .line 40
    .line 41
    if-gt v1, v0, :cond_4

    .line 42
    .line 43
    invoke-static {p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_4
    const/4 v0, 0x7

    .line 48
    if-ne v0, p1, :cond_5

    .line 49
    .line 50
    iget p0, p0, Ll/cjg0;->a:I

    .line 51
    .line 52
    if-gt p0, v0, :cond_5

    .line 53
    .line 54
    invoke-static {p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_5
    :goto_0
    return-void
.end method

.method public final log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x2

    if-ne v0, p1, :cond_0

    .line 58
    iget v1, p0, Ll/cjg0;->a:I

    if-gt v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    if-ne v0, p1, :cond_1

    .line 59
    iget v1, p0, Ll/cjg0;->a:I

    if-gt v1, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    if-ne v0, p1, :cond_2

    .line 60
    iget v1, p0, Ll/cjg0;->a:I

    if-gt v1, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x5

    if-ne v0, p1, :cond_3

    .line 61
    iget v1, p0, Ll/cjg0;->a:I

    if-gt v1, v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x6

    if-ne v0, p1, :cond_4

    .line 62
    iget v1, p0, Ll/cjg0;->a:I

    if-gt v1, v0, :cond_4

    .line 63
    invoke-static {p2, p3, p4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    :cond_4
    const/4 v0, 0x7

    if-ne v0, p1, :cond_5

    .line 64
    iget p0, p0, Ll/cjg0;->a:I

    if-gt p0, v0, :cond_5

    .line 65
    invoke-static {p2, p3, p4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_0
    return-void
.end method

.method public final setLogLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cjg0;->a:I

    .line 2
    .line 3
    return-void
.end method
