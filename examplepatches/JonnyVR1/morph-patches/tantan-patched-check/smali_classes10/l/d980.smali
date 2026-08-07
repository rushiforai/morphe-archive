.class public final synthetic Ll/d980;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/g980;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/g980;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d980;->a:Ll/g980;

    iput-object p2, p0, Ll/d980;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/d980;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/d980;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d980;->a:Ll/g980;

    iget-object v1, p0, Ll/d980;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/d980;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/d980;->d:Ll/y20;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v5, p2

    check-cast v5, Ljava/io/File;

    invoke-static/range {v0 .. v5}, Ll/g980;->b(Ll/g980;Ljava/lang/String;Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
