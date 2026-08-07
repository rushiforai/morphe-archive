.class public final synthetic Ll/tfx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;F)V

    return-void
.end method
