.class public final Ll/ohy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/xuy0;


# direct methods
.method public constructor <init>(Ll/xuy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ohy0;->a:Ll/xuy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ohy0;->a:Ll/xuy0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xuy0;->s8(Ll/xuy0;)Ll/v2s0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/xuy0;->s8(Ll/xuy0;)Ll/v2s0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p2}, Ll/v2s0;->d(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
