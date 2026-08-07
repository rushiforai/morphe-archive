.class public final synthetic Ll/sih;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/viewpager/widget/ViewPager;

.field public final synthetic b:I

.field public final synthetic c:Landroid/animation/AnimatorListenerAdapter;


# direct methods
.method public synthetic constructor <init>(Landroidx/viewpager/widget/ViewPager;ILandroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sih;->a:Landroidx/viewpager/widget/ViewPager;

    iput p2, p0, Ll/sih;->b:I

    iput-object p3, p0, Ll/sih;->c:Landroid/animation/AnimatorListenerAdapter;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sih;->a:Landroidx/viewpager/widget/ViewPager;

    iget v1, p0, Ll/sih;->b:I

    iget-object p0, p0, Ll/sih;->c:Landroid/animation/AnimatorListenerAdapter;

    invoke-static {v0, v1, p0}, Ll/tih;->c(Landroidx/viewpager/widget/ViewPager;ILandroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method
