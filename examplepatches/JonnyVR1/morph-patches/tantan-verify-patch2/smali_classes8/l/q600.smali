.class public final synthetic Ll/q600;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/r600;


# direct methods
.method public synthetic constructor <init>(Ll/r600;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q600;->a:Ll/r600;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q600;->a:Ll/r600;

    invoke-static {p0, p1, p2}, Ll/r600;->m(Ll/r600;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
