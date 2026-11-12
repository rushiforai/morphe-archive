.class public Lcom/opera/android/suggestion/CompactSuggestionChip;
.super Lcom/opera/android/ui/catalog/widget/OperaChip;
.source "SourceFile"

# interfaces
.implements Lpvb;


# instance fields
.field public A:Llb4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaChip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/suggestion/CompactSuggestionChip;->A:Llb4;

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
