.class public final synthetic Ll/nrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/prp0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/prp0;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nrp0;->a:Ll/prp0;

    iput-object p2, p0, Ll/nrp0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/nrp0;->c:Landroid/content/Context;

    iput-object p4, p0, Ll/nrp0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nrp0;->a:Ll/prp0;

    iget-object v1, p0, Ll/nrp0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/nrp0;->c:Landroid/content/Context;

    iget-object v3, p0, Ll/nrp0;->d:Ljava/lang/String;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v5, p2

    check-cast v5, Ljava/io/File;

    invoke-static/range {v0 .. v5}, Ll/prp0;->b(Ll/prp0;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
