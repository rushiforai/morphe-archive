.class public Ll/der$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/der;->B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/der;


# direct methods
.method public constructor <init>(Ll/der;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/der$a;->a:Ll/der;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/der$a;->a:Ll/der;

    .line 2
    .line 3
    iget-object p1, p1, Ll/f6l;->e:Ll/jm50;

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
    iget-object p1, p0, Ll/der$a;->a:Ll/der;

    .line 12
    .line 13
    iget-object p1, p1, Ll/f6l;->e:Ll/jm50;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/jm50;->l()Ll/qmj0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Ll/der$a;->a:Ll/der;

    .line 20
    .line 21
    iget-object p0, p0, Ll/der;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/qmj0;->p(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method
