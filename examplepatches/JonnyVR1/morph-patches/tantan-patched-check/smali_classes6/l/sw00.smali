.class public final synthetic Ll/sw00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;


# instance fields
.field public final synthetic a:Ll/vw00;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/vw00;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sw00;->a:Ll/vw00;

    iput-object p2, p0, Ll/sw00;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sw00;->a:Ll/vw00;

    iget-object p0, p0, Ll/sw00;->b:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0}, Ll/vw00;->q(Ll/vw00;Lcom/p1/mobile/putong/data/Media;)Z

    move-result p0

    return p0
.end method
