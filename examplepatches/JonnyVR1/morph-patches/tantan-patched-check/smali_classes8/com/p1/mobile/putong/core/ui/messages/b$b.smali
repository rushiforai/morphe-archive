.class public Lcom/p1/mobile/putong/core/ui/messages/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/b;->s(Landroid/view/View;Lcom/p1/mobile/putong/core/ui/messages/b$c;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/b$c;

.field public final synthetic b:Ll/mmj;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/b$c;Ll/mmj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/b$b;->a:Lcom/p1/mobile/putong/core/ui/messages/b$c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/b$b;->b:Ll/mmj;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/b$b;->a:Lcom/p1/mobile/putong/core/ui/messages/b$c;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/messages/b$c;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/b$b;->b:Ll/mmj;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/mmj;->a(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
