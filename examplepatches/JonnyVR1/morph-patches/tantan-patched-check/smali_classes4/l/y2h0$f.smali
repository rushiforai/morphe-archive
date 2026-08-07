.class public Ll/y2h0$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

.field public final synthetic c:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$f;->c:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$f;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 4
    .line 5
    iput-object p3, p0, Ll/y2h0$f;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/y2h0$f;->c:Ll/y2h0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iget-object v1, p0, Ll/y2h0$f;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 5
    .line 6
    const-string v2, "close"

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {p1, v2, v3, v0, v1}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 10
    .line 11
    .line 12
    const-string p1, "e_friends_online_popup_close"

    .line 13
    .line 14
    const-string v0, "p_suggest_users_home_view"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/y2h0$f;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SEE_TOAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 35
    .line 36
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
