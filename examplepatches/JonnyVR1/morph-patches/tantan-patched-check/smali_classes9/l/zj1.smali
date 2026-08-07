.class public final synthetic Ll/zj1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/ak1;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/ak1;Lkotlin/jvm/internal/Ref$BooleanRef;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zj1;->a:Ll/ak1;

    iput-object p2, p0, Ll/zj1;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput p3, p0, Ll/zj1;->c:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zj1;->a:Ll/ak1;

    iget-object v1, p0, Ll/zj1;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget p0, p0, Ll/zj1;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/ak1;->a(Ll/ak1;Lkotlin/jvm/internal/Ref$BooleanRef;ILandroid/animation/ValueAnimator;)V

    return-void
.end method
