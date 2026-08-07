.class public final synthetic Ll/jz5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jz5;->a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    iput-object p2, p0, Ll/jz5;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jz5;->a:Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    iget-object p0, p0, Ll/jz5;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->Q(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
