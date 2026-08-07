.class public final synthetic Ll/lqp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/nqp0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/nqp0;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lqp0;->a:Ll/nqp0;

    iput-object p2, p0, Ll/lqp0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/lqp0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lqp0;->a:Ll/nqp0;

    iget-object v1, p0, Ll/lqp0;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/lqp0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, v1, p0, p1, p2}, Ll/nqp0;->b(Ll/nqp0;Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
