.class public final synthetic Lcom/p1/mobile/android/ui/bubble/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/d;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/widget/FrameLayout;

.field public final synthetic d:Landroid/graphics/Rect;

.field public final synthetic e:Lcom/p1/mobile/android/ui/bubble/a;

.field public final synthetic f:Landroid/graphics/Rect;

.field public final synthetic g:Lcom/p1/mobile/android/ui/bubble/BubbleView;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/c;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iput-object p2, p0, Lcom/p1/mobile/android/ui/bubble/c;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/p1/mobile/android/ui/bubble/c;->c:Landroid/widget/FrameLayout;

    iput-object p4, p0, Lcom/p1/mobile/android/ui/bubble/c;->d:Landroid/graphics/Rect;

    iput-object p5, p0, Lcom/p1/mobile/android/ui/bubble/c;->e:Lcom/p1/mobile/android/ui/bubble/a;

    iput-object p6, p0, Lcom/p1/mobile/android/ui/bubble/c;->f:Landroid/graphics/Rect;

    iput-object p7, p0, Lcom/p1/mobile/android/ui/bubble/c;->g:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    iput-object p8, p0, Lcom/p1/mobile/android/ui/bubble/c;->h:Landroid/view/View;

    iput-object p9, p0, Lcom/p1/mobile/android/ui/bubble/c;->i:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/c;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/c;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/c;->c:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/p1/mobile/android/ui/bubble/c;->d:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/p1/mobile/android/ui/bubble/c;->e:Lcom/p1/mobile/android/ui/bubble/a;

    iget-object v5, p0, Lcom/p1/mobile/android/ui/bubble/c;->f:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/p1/mobile/android/ui/bubble/c;->g:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    iget-object v7, p0, Lcom/p1/mobile/android/ui/bubble/c;->h:Landroid/view/View;

    iget-object v8, p0, Lcom/p1/mobile/android/ui/bubble/c;->i:Landroid/view/View;

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/android/ui/bubble/d;->g(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
