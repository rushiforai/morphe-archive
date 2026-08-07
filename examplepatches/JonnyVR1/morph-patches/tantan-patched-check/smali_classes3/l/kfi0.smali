.class public final synthetic Ll/kfi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kfi0;->a:Ll/bqq;

    iput-object p2, p0, Ll/kfi0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kfi0;->a:Ll/bqq;

    iget-object p0, p0, Ll/kfi0;->b:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1, p2}, Ll/bgi0;->Y(Ll/bqq;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
