.class public final synthetic Ll/yye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/bze;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bze;Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yye;->a:Ll/bze;

    iput-object p2, p0, Ll/yye;->b:Ljava/io/File;

    iput-object p3, p0, Ll/yye;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yye;->a:Ll/bze;

    iget-object v1, p0, Ll/yye;->b:Ljava/io/File;

    iget-object p0, p0, Ll/yye;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/io/File;

    invoke-static {v0, v1, p0, p1, p2}, Ll/bze;->b(Ll/bze;Ljava/io/File;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
