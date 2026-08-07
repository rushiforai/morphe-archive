.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->d:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$a;->a:Ll/x20;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
