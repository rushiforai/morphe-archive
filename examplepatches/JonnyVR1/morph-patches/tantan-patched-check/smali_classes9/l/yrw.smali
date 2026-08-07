.class public final synthetic Ll/yrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yrw;->a:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrw;->a:Ll/gcg0;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    invoke-static {p0, p1}, Ll/zrw;->b(Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method
