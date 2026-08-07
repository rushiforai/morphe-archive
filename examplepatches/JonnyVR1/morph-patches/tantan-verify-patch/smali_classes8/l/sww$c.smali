.class public Ll/sww$c;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sww;->b0(ZLl/bf3;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sww$c;->a:Ll/sww;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sww$c;->a:Ll/sww;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sww;->m:Lv/VLinear;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    int-to-float p1, p1

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
