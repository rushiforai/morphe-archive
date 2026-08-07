.class public final synthetic Ll/k1o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1o;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    iput-object p2, p0, Ll/k1o;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/k1o;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k1o;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    iget-object v1, p0, Ll/k1o;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/k1o;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;->a(Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
