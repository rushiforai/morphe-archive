.class public Ll/z9o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vao0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public c:Ll/vao0;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/oln0;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Ll/z9o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z9o0;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/z9o0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z9o0;->f(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z9o0;->c:Ll/vao0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/vao0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z9o0;->c:Ll/vao0;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;

    .line 2
    .line 3
    iput-object p1, p0, Ll/z9o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/z9o0;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/z9o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/oln0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z9o0;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vao0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z9o0;->c(Ll/vao0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    iget-object v1, p0, Ll/z9o0;->c:Ll/vao0;

    .line 8
    .line 9
    sget v2, Ll/yec0;->O9:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 15
    .line 16
    new-instance v1, Ll/x9o0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/x9o0;-><init>(Ll/z9o0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 25
    .line 26
    new-instance v1, Ll/y9o0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/y9o0;-><init>(Ll/z9o0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Ll/z9o0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
