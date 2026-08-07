.class public Ll/hlj$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/IResourceDownloader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hlj;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


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
.method public downloadResourceWithURL(Ljava/lang/String;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V
    .locals 2

    .line 1
    new-instance v0, Ll/f9e$a;

    .line 2
    .line 3
    invoke-static {p1}, Ll/hlj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p1, v1}, Ll/f9e$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "IMMEDIATE"

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ll/f9e$a;->i(Lcom/p1/mobile/putong/live/base/data/Priority;)Ll/f9e$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/f9e$a;->a()Ll/f9e;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {}, Ll/n9s;->B()Ll/n9s;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/hlj$a$a;

    .line 29
    .line 30
    invoke-direct {v1, p0, p2}, Ll/hlj$a$a;-><init>(Ll/hlj$a;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1, v1}, Ll/n9s;->z(Ll/f9e;Ll/w8e;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
