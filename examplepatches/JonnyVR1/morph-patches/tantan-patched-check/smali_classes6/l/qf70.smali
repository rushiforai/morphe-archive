.class public final synthetic Ll/qf70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$b;


# instance fields
.field public final synthetic a:Ll/wf70;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/wf70;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qf70;->a:Ll/wf70;

    iput-object p2, p0, Ll/qf70;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qf70;->a:Ll/wf70;

    iget-object p0, p0, Ll/qf70;->b:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0}, Ll/wf70;->y(Ll/wf70;Lcom/p1/mobile/putong/data/Media;)Z

    move-result p0

    return p0
.end method
