.class public final synthetic Ll/ek00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/nk00;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ek00;->a:Ll/nk00;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ek00;->a:Ll/nk00;

    invoke-static {p0, p1, p2}, Ll/nk00;->p(Ll/nk00;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
