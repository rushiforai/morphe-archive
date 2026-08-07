.class public final synthetic Ll/pz00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pz00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    iput-object p2, p0, Ll/pz00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pz00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    iget-object p0, p0, Ll/pz00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->s(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
