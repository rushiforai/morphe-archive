.class final Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $forKey:Ljava/lang/String;

.field final synthetic $handler:Landroid/os/Handler;

.field final synthetic $url:Ljava/lang/String;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGADynamicEntity;Ljava/lang/String;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$handler:Landroid/os/Handler;

    iput-object p4, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$forKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Ljava/net/HttpURLConnection;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    :cond_0
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/16 v1, 0x4e20

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 24
    .line 25
    .line 26
    const-string v1, "GET"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object v2, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$handler:Landroid/os/Handler;

    .line 45
    .line 46
    new-instance v3, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;

    .line 47
    .line 48
    invoke-direct {v3, v1, p0}, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;-><init>(Landroid/graphics/Bitmap;Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void

    .line 62
    :catch_0
    move-exception p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    return-void
.end method
