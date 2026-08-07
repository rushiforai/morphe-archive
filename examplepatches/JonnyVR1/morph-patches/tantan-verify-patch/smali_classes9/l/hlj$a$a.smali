.class public Ll/hlj$a$a;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hlj$a;->downloadResourceWithURL(Ljava/lang/String;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

.field public final synthetic b:Ll/hlj$a;


# direct methods
.method public constructor <init>(Ll/hlj$a;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hlj$a$a;->b:Ll/hlj$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hlj$a$a;->a:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/x8e;->a(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hlj$a$a;->a:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Lcom/momo/xeengine/gift/IResourceDownloader$Callback;->onComplete(ZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/x8e;->onFailed(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hlj$a$a;->a:Lcom/momo/xeengine/gift/IResourceDownloader$Callback;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-interface {p0, p1, v0}, Lcom/momo/xeengine/gift/IResourceDownloader$Callback;->onComplete(ZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
