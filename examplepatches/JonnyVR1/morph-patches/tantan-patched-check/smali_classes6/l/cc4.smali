.class public final synthetic Ll/cc4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cc4;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cc4;->a:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    invoke-static {p0, p1}, Ll/oc4;->g(Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method
