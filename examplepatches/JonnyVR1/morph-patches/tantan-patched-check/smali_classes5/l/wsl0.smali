.class public final synthetic Ll/wsl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsl0;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wsl0;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewCardPager;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
