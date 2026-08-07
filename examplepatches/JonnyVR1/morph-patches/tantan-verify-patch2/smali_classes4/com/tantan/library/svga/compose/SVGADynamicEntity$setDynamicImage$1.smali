.class public final Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "com/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1",
        "Ll/w84;",
        "Ll/ry3;",
        "p0",
        "Ljava/io/IOException;",
        "p1",
        "",
        "onFailure",
        "(Ll/ry3;Ljava/io/IOException;)V",
        "Ll/i5d0;",
        "response",
        "onResponse",
        "(Ll/ry3;Ll/i5d0;)V",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $forKey:Ljava/lang/String;

.field final synthetic $url:Ljava/lang/String;

.field final synthetic this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->$url:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->$forKey:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 2
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/IOException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p1, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->$url:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Lcom/tantan/library/svga/exception/SVGAException;

    .line 18
    .line 19
    const-string v1, "DynamicImage download Failure!"

    .line 20
    .line 21
    invoke-direct {v0, v1, p2}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p0, v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 2
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/i5d0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->this$0:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->$forKey:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    :try_start_1
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2, v1, v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p2

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    const/4 p2, 0x0

    .line 38
    :try_start_2
    invoke-static {p1, p2}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p1

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    :try_start_3
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 45
    :catchall_1
    move-exception v0

    .line 46
    :try_start_4
    invoke-static {p1, p2}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 50
    :goto_2
    sget-object p2, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    if-eqz p2, :cond_1

    .line 57
    .line 58
    iget-object p0, p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity$setDynamicImage$1;->$url:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v0, Lcom/tantan/library/svga/exception/SVGAException;

    .line 61
    .line 62
    const-string v1, "DynamicImage decode Failure!"

    .line 63
    .line 64
    invoke-direct {v0, v1, p1}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, p0, v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method
