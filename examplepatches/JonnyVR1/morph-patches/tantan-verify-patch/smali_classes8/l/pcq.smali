.class public final synthetic Ll/pcq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iput-object p2, p0, Ll/pcq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iput-boolean p3, p0, Ll/pcq;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iget-object v1, p0, Ll/pcq;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iget-boolean p0, p0, Ll/pcq;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->j(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLl/uxj0;)V

    return-void
.end method
