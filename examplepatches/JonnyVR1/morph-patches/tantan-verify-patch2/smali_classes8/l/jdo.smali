.class public final synthetic Ll/jdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/rdo;


# direct methods
.method public synthetic constructor <init>(Ll/rdo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdo;->a:Ll/rdo;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdo;->a:Ll/rdo;

    invoke-static {p0, p1, p2}, Ll/rdo;->f(Ll/rdo;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
