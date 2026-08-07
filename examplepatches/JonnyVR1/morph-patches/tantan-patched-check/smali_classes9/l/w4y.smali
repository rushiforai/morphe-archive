.class public final synthetic Ll/w4y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->a0(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;

    move-result-object p0

    return-object p0
.end method
