.class public Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 v1, 0x1

    .line 33
    if-ne p2, v1, :cond_1

    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->n:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 44
    .line 45
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->c(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->c(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public getCount()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->m:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->m:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->c(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->n:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->c(Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->n:Ljava/lang/String;

    .line 45
    .line 46
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
