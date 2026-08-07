.class public Ll/l030$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l030;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l030;


# direct methods
.method public constructor <init>(Ll/l030;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l030$c;->a:Ll/l030;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l030$c;->a:Ll/l030;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l030;->j(Ll/l030;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/l030$c;->a:Ll/l030;

    .line 7
    .line 8
    iget-object v0, v0, Ll/l030;->a:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
