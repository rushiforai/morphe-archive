.class public final synthetic Ll/ocq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ocq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iput-object p2, p0, Ll/ocq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iget-object p0, p0, Ll/ocq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->o(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Landroid/view/View;)V

    return-void
.end method
