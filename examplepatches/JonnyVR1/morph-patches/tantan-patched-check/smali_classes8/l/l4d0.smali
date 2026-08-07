.class public final synthetic Ll/l4d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/s4d0;

.field public final synthetic b:Ll/k9e;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/StringBuffer;


# direct methods
.method public synthetic constructor <init>(Ll/s4d0;Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l4d0;->a:Ll/s4d0;

    iput-object p2, p0, Ll/l4d0;->b:Ll/k9e;

    iput-object p3, p0, Ll/l4d0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/l4d0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/l4d0;->e:Ljava/lang/StringBuffer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/l4d0;->a:Ll/s4d0;

    iget-object v1, p0, Ll/l4d0;->b:Ll/k9e;

    iget-object v2, p0, Ll/l4d0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/l4d0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/l4d0;->e:Ljava/lang/StringBuffer;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v6, p2

    check-cast v6, Ljava/io/File;

    invoke-static/range {v0 .. v6}, Ll/s4d0;->g(Ll/s4d0;Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
