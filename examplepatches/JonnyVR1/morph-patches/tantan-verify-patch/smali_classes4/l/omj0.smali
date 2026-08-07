.class public final synthetic Ll/omj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/qmj0;


# direct methods
.method public synthetic constructor <init>(Ll/qmj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/omj0;->a:Ll/qmj0;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omj0;->a:Ll/qmj0;

    invoke-static {p0, p1, p2}, Ll/qmj0;->b(Ll/qmj0;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
