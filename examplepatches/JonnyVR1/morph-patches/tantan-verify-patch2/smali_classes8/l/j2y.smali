.class public final synthetic Ll/j2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j2y;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j2y;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->e2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
