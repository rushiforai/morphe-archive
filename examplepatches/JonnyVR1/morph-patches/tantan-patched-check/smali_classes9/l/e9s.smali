.class public final synthetic Ll/e9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n9s;


# direct methods
.method public synthetic constructor <init>(Ll/n9s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9s;->a:Ll/n9s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e9s;->a:Ll/n9s;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    invoke-static {p0, p1}, Ll/n9s;->f(Ll/n9s;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method
