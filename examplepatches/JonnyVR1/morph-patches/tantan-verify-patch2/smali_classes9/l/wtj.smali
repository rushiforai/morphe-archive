.class public final synthetic Ll/wtj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/guj;


# direct methods
.method public synthetic constructor <init>(Ll/guj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wtj;->a:Ll/guj;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wtj;->a:Ll/guj;

    invoke-static {p0, p1, p2}, Ll/guj;->e(Ll/guj;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
