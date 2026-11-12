.class public final Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lpvb;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;",
        "Landroid/widget/FrameLayout;",
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


# static fields
.field public static final b:[I


# instance fields
.field public a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x101009c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;->b:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final f()V
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final h(Z)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method

.method public final j()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;->a:Z

    return p0
.end method

.method public final m()Li1;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_13

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;->b:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_13
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method
