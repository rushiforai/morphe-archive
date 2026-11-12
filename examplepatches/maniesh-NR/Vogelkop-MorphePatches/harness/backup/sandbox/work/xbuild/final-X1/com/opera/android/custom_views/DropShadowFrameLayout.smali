.class public Lcom/opera/android/custom_views/DropShadowFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0016\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/DropShadowFrameLayout;",
        "Landroid/widget/FrameLayout;",
        "graphics"
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
.field public static final synthetic b:I


# instance fields
.field public final a:Lzi4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lnm7;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lnm7;-><init>(Lcom/opera/android/custom_views/DropShadowFrameLayout;B)V

    new-instance p2, Lnm7;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lnm7;-><init>(Lcom/opera/android/custom_views/DropShadowFrameLayout;B)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1c

    new-instance v0, Lpm7;

    invoke-direct {v0, p1, p2}, Lpm7;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    goto :goto_21

    :cond_1c
    new-instance v0, Lqm7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    :goto_21
    iput-object v0, p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    return-void
.end method

.method public static final a(Lcom/opera/android/custom_views/DropShadowFrameLayout;Landroid/graphics/Canvas;)Lkotlin/Unit;
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final b(Llaj;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    invoke-virtual {v0, p1}, Lzi4;->Y(Llaj;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_b
    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 4

    new-instance v0, Lwg5;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, v1}, Lwg5;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    invoke-virtual {p0}, Lzi4;->F()Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_15
    invoke-virtual {p0, p1, v0}, Lzi4;->k(Landroid/graphics/Canvas;Lkotlin/jvm/functions/Function1;)V

    :cond_18
    invoke-virtual {v0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
