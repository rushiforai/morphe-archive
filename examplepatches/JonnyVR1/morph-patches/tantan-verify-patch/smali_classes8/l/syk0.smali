.class public final synthetic Ll/syk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lv/VList_ViewBuffer$a;


# direct methods
.method public synthetic constructor <init>(Lv/VList_ViewBuffer$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syk0;->a:Lv/VList_ViewBuffer$a;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syk0;->a:Lv/VList_ViewBuffer$a;

    invoke-static {p0, p1}, Lv/VList_ViewBuffer$a;->a(Lv/VList_ViewBuffer$a;Landroid/animation/ValueAnimator;)V

    return-void
.end method
