.class public final synthetic Ll/j1n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/j1n;->a:I

    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .locals 0

    .line 1
    iget p0, p0, Ll/j1n;->a:I

    invoke-static {p0, p1}, Lcom/sunshine/engine/base/InterpolatorType;->w(IF)F

    move-result p0

    return p0
.end method
