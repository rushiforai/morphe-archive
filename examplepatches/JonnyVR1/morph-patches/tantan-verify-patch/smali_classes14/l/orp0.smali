.class public final synthetic Ll/orp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/prp0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ll/prp0;Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/orp0;->a:Ll/prp0;

    iput-object p2, p0, Ll/orp0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/orp0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/orp0;->d:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/orp0;->a:Ll/prp0;

    iget-object v1, p0, Ll/orp0;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/orp0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/orp0;->d:Landroid/net/Uri;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v5, p2

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/prp0;->f(Ll/prp0;Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
