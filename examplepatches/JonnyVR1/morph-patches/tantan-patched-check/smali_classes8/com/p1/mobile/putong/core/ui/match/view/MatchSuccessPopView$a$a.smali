.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-interface {v0, p0, v1}, Ll/ryl;->a(Lcom/p1/mobile/android/app/Act;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
