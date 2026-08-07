.class public final synthetic Ll/bn00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/jn00;


# direct methods
.method public synthetic constructor <init>(Ll/jn00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bn00;->a:Ll/jn00;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bn00;->a:Ll/jn00;

    invoke-static {p0, p1, p2}, Ll/jn00;->e(Ll/jn00;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
