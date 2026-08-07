.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

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
    const-string p1, "select_emoji"

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-static {p1, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "e_match_emoji"

    .line 13
    .line 14
    const-string v1, "p_successful_match_view"

    .line 15
    .line 16
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "EMOJI_63"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/tye;->l(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->h0(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;)Ll/ryl;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ll/ryl;->f()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->n:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c$a;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c$a;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$c;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    invoke-static {p1, v0, v1, p0, v2}, Ll/d810;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
