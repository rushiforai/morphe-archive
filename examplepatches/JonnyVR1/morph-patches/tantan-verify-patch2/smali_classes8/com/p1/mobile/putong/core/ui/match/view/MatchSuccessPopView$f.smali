.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$f;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_matched_later"

    .line 5
    .line 6
    const-string v1, "p_successful_match_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$f;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-interface {p0, p1}, Ll/ryl;->c(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
