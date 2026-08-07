.class public Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;
    }
.end annotation


# static fields
.field public static a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static b:I

.field public static c:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0xb4

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x1e0

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/16 v2, 0x2d0

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/16 v3, 0x3c0

    .line 20
    .line 21
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->a:Ljava/util/ArrayList;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    sput v0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->b:I

    .line 37
    .line 38
    sput v0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->c:I

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(I)I
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-lt v3, p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sub-int/2addr v0, p0

    .line 31
    sub-int/2addr p0, v1

    .line 32
    if-gt v0, p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return v1
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;Landroid/view/View;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->c(Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "?format=max_%dxX"

    .line 16
    .line 17
    invoke-static {v0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;Landroid/view/View;)I
    .locals 1

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;->drawer:Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;

    .line 11
    .line 12
    if-ne p0, v0, :cond_2

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->b:I

    .line 15
    .line 16
    if-gtz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sput p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->b:I

    .line 27
    .line 28
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->b:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->c:I

    .line 32
    .line 33
    if-gtz p0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->a(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    sput p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->c:I

    .line 44
    .line 45
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->c:I

    .line 46
    .line 47
    return p0

    .line 48
    :cond_4
    :goto_0
    const/16 p0, 0x2d0

    .line 49
    .line 50
    return p0
.end method
