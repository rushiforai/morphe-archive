.class public final synthetic Ll/v4y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->O(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
