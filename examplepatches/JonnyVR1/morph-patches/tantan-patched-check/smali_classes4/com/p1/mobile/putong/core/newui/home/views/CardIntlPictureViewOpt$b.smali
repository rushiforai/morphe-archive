.class public Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/aoh0;ILl/jm50;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jm50;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/jm50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;->a:Ll/jm50;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;->a:Ll/jm50;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/jm50;->l()Ll/qmj0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;->a:Ll/jm50;

    .line 12
    .line 13
    invoke-interface {p1}, Ll/jm50;->l()Ll/qmj0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/qmj0;->p(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
