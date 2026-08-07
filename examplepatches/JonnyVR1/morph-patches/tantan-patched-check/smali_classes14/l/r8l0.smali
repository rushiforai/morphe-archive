.class public final synthetic Ll/r8l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/w8l0;


# direct methods
.method public synthetic constructor <init>(Ll/w8l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r8l0;->a:Ll/w8l0;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8l0;->a:Ll/w8l0;

    invoke-static {p0, p1, p2}, Ll/w8l0;->x(Ll/w8l0;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
