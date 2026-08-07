.class public final synthetic Ll/dfx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dfx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
