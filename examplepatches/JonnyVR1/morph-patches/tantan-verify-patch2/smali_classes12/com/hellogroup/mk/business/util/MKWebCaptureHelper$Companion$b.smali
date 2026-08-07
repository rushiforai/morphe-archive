.class final Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Ljava/io/File;",
        "kotlin.jvm.PlatformType",
        "accept"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lkotlin/jvm/internal/Ref$LongRef;

.field final synthetic b:Lkotlin/jvm/internal/Ref$IntRef;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$LongRef;Lkotlin/jvm/internal/Ref$IntRef;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;->a:Lkotlin/jvm/internal/Ref$LongRef;

    iput-object p2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;->b:Lkotlin/jvm/internal/Ref$IntRef;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, ".nomedia"

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    move v0, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v0, v1

    .line 27
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-static {p1}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 34
    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v3, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;->a:Lkotlin/jvm/internal/Ref$LongRef;

    .line 40
    .line 41
    iget-wide v4, v3, Lkotlin/jvm/internal/Ref$LongRef;->element:J

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 44
    .line 45
    .line 46
    move-result-wide v6

    .line 47
    add-long/2addr v4, v6

    .line 48
    iput-wide v4, v3, Lkotlin/jvm/internal/Ref$LongRef;->element:J

    .line 49
    .line 50
    iget-object v3, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;->b:Lkotlin/jvm/internal/Ref$IntRef;

    .line 51
    .line 52
    iget v4, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 53
    .line 54
    add-int/2addr v4, v2

    .line 55
    iput v4, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 56
    .line 57
    sget-object v2, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 58
    .line 59
    invoke-static {v2, p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->a(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;Ljava/io/File;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion$b;->b:Lkotlin/jvm/internal/Ref$IntRef;

    .line 75
    .line 76
    iget p1, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 77
    .line 78
    add-int/lit8 p1, p1, -0x1

    .line 79
    .line 80
    iput p1, p0, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 81
    .line 82
    return v1

    .line 83
    :cond_2
    return v0
.end method
