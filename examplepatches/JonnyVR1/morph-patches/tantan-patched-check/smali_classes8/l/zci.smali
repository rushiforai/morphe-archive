.class public final synthetic Ll/zci;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pdi;

.field public final synthetic b:I

.field public final synthetic c:Landroid/view/animation/Interpolator;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/pdi;ILandroid/view/animation/Interpolator;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zci;->a:Ll/pdi;

    iput p2, p0, Ll/zci;->b:I

    iput-object p3, p0, Ll/zci;->c:Landroid/view/animation/Interpolator;

    iput p4, p0, Ll/zci;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zci;->a:Ll/pdi;

    iget v1, p0, Ll/zci;->b:I

    iget-object v2, p0, Ll/zci;->c:Landroid/view/animation/Interpolator;

    iget p0, p0, Ll/zci;->d:I

    check-cast p1, Ljava/lang/Float;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pdi;->q(Ll/pdi;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V

    return-void
.end method
