.class public final synthetic Ll/ez00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ez00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ez00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Y1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
