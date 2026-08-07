.class public Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/bb50<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->h(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->h(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)Ll/y20;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onCompleted()V
    .locals 0

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
