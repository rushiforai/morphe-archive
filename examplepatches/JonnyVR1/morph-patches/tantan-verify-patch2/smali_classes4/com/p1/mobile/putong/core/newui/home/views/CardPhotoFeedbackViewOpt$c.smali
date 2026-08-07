.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->w(Lcom/p1/mobile/putong/data/User;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 1

    .line 1
    const-string p1, "\u53cd\u9988\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    iget-object p1, p1, Ll/dkb;->U6:Ljava/util/Set;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;->a:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k2:Lrx/subjects/b;

    .line 32
    .line 33
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
