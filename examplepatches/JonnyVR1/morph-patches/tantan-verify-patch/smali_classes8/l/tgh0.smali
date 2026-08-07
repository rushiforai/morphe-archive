.class public final synthetic Ll/tgh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tgh0;->a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgh0;->a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
