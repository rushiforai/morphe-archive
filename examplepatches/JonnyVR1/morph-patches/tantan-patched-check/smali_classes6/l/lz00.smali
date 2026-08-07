.class public final synthetic Ll/lz00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lz00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    iput-object p2, p0, Ll/lz00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lz00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    iget-object p0, p0, Ll/lz00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->r(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Z

    move-result p0

    return p0
.end method
