.class public Ll/qan0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qam;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

.field public b:Ll/ybn0;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/qan0;->c:Lrx/subjects/a;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qan0;->b:Ll/ybn0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ybn0;->x0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qan0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .param p3    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public f()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p3    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/qan0;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/xec0;->S1:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 28
    .line 29
    iput-object v0, p0, Ll/qan0;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p0, Ll/qan0;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 35
    .line 36
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/ybn0;

    .line 40
    .line 41
    invoke-direct {p2, p1}, Ll/ybn0;-><init>(Ll/ner;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Ll/qan0;->b:Ll/ybn0;

    .line 45
    .line 46
    iget-object p1, p0, Ll/qan0;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/qan0;->b:Ll/ybn0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ybn0;->a0()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method
