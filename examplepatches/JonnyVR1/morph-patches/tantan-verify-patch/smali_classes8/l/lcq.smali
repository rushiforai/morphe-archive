.class public final synthetic Ll/lcq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->m(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method
