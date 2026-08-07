.class public final synthetic Ll/az5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/az5;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/az5;->b:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/az5;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/az5;->b:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->a0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
