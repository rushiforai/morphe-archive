.class public Ll/pkp$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pkp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pkp;


# direct methods
.method public constructor <init>(Ll/pkp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pkp$b;->a:Ll/pkp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pkp$b;->a:Ll/pkp;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pkp;->c:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->o()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pkp$b;->a:Ll/pkp;

    .line 9
    .line 10
    invoke-static {v0}, Ll/pkp;->N(Ll/pkp;)Landroid/animation/Animator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/pkp$b;->a:Ll/pkp;

    .line 21
    .line 22
    invoke-static {p0}, Ll/pkp;->N(Ll/pkp;)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
