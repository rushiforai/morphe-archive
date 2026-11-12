.class public final Lcom/opera/android/suggestion/ChatSuggestionView;
.super Lyq1;
.source "SourceFile"

# interfaces
.implements Lpvb;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/suggestion/ChatSuggestionView;",
        "Lyq1;",
        "Lpvb;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public h:Llb4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lyq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-static {p0}, Lna2;->r(Landroid/widget/TextView;)V

    return-void

    :cond_e
    new-instance p1, Ltu4;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p0, p2}, Ltu4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/suggestion/ChatSuggestionView;->h:Llb4;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Llb4;->run()V

    :cond_7
    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final j()Z
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final m()Li1;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method
