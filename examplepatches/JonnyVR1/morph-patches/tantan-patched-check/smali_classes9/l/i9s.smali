.class public final synthetic Ll/i9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/n9s;

.field public final synthetic b:Ll/f9e;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/n9s;Ll/f9e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9s;->a:Ll/n9s;

    iput-object p2, p0, Ll/i9s;->b:Ll/f9e;

    iput-object p3, p0, Ll/i9s;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i9s;->a:Ll/n9s;

    iget-object v1, p0, Ll/i9s;->b:Ll/f9e;

    iget-object p0, p0, Ll/i9s;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1, p2}, Ll/n9s;->l(Ll/n9s;Ll/f9e;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
