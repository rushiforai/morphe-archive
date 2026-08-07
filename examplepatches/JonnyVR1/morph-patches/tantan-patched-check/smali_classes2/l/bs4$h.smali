.class public Ll/bs4$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bs4;->createAnimator(Landroid/view/ViewGroup;Ll/kij0;Ll/kij0;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bs4$k;

.field public final synthetic b:Ll/bs4;

.field private mViewBounds:Ll/bs4$k;


# direct methods
.method public constructor <init>(Ll/bs4;Ll/bs4$k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bs4$h;->b:Ll/bs4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bs4$h;->a:Ll/bs4$k;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Ll/bs4$h;->mViewBounds:Ll/bs4$k;

    .line 9
    .line 10
    return-void
.end method
