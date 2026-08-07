.class public final synthetic Ll/lhl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;


# instance fields
.field public final synthetic a:Landroid/view/GestureDetector;


# direct methods
.method public synthetic constructor <init>(Landroid/view/GestureDetector;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lhl0;->a:Landroid/view/GestureDetector;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhl0;->a:Landroid/view/GestureDetector;

    invoke-static {p0, p1}, Ll/yil0;->l0(Landroid/view/GestureDetector;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
