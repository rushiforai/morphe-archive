.class public final synthetic Ll/s9e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/download/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/download/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s9e;->a:Lcom/p1/mobile/putong/ui/download/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s9e;->a:Lcom/p1/mobile/putong/ui/download/a;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/String;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/ui/download/a;->f(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)V

    return-void
.end method
