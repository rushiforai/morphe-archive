.class public final synthetic Ll/yak;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bm50;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yak;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    return-void
.end method


# virtual methods
.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yak;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->a1(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
