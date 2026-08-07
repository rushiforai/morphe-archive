.class public Ll/kn5$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kn5;->i(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

.field public final synthetic b:Ll/kn5;


# direct methods
.method public constructor <init>(Ll/kn5;Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kn5$a;->b:Ll/kn5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kn5$a;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/kn5$a;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->d2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
