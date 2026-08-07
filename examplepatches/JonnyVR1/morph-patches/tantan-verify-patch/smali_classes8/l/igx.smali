.class public final synthetic Ll/igx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

.field public final synthetic b:Landroid/view/animation/Interpolator;

.field public final synthetic c:[Landroid/view/View;

.field public final synthetic d:I

.field public final synthetic e:Landroid/view/animation/Interpolator;

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/igx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iput-object p2, p0, Ll/igx;->b:Landroid/view/animation/Interpolator;

    iput-object p3, p0, Ll/igx;->c:[Landroid/view/View;

    iput p4, p0, Ll/igx;->d:I

    iput-object p5, p0, Ll/igx;->e:Landroid/view/animation/Interpolator;

    iput p6, p0, Ll/igx;->f:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/igx;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    iget-object v1, p0, Ll/igx;->b:Landroid/view/animation/Interpolator;

    iget-object v2, p0, Ll/igx;->c:[Landroid/view/View;

    iget v3, p0, Ll/igx;->d:I

    iget-object v4, p0, Ll/igx;->e:Landroid/view/animation/Interpolator;

    iget v5, p0, Ll/igx;->f:I

    move-object v6, p1

    check-cast v6, Ljava/lang/Float;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V

    return-void
.end method
