.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

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
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ll/ryl;->f()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p1, "e_matched_text_box"

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    new-array v1, v0, [Ll/sfj0$a;

    .line 18
    .line 19
    const-string v2, "p_successful_match_view"

    .line 20
    .line 21
    invoke-static {p1, v2, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "e_matched_send_message"

    .line 25
    .line 26
    new-array v0, v0, [Ll/sfj0$a;

    .line 27
    .line 28
    invoke-static {p1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-interface {p1, v0}, Ll/ryl;->b(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ll/ryl;->f()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->m2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0x70

    .line 72
    .line 73
    invoke-virtual {v0, p1, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$e;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget p1, Ll/x7c0;->p:I

    .line 83
    .line 84
    sget v0, Ll/x7c0;->q:I

    .line 85
    .line 86
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
