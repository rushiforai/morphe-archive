.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
