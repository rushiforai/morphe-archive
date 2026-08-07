.class public Ll/bek;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Ljava/lang/CharSequence;III)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "@"

    .line 6
    .line 7
    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    if-lez p4, :cond_0

    .line 14
    .line 15
    add-int p3, p2, p4

    .line 16
    .line 17
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p3, Ll/bek$a;

    .line 42
    .line 43
    invoke-direct {p3, p0, p2, p4}, Ll/bek$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, p3}, Ll/bek;->b(Landroid/content/Context;Ll/kqk$d;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public static b(Landroid/content/Context;Ll/kqk$d;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kqk;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    sget v1, Ll/cgc0;->a:I

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Ll/kqk;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p1, p0}, Ll/kqk;->C(Ll/kqk$d;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
