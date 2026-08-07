.class public final synthetic Ll/lgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lgx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iput-object p2, p0, Ll/lgx;->b:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lgx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iget-object p0, p0, Ll/lgx;->b:Ll/pcj;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ll/pcj;Landroid/view/View;)V

    return-void
.end method
