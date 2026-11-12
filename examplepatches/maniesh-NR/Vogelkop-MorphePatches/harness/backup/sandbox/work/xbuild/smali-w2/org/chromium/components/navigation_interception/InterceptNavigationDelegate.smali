.class public abstract Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a:Ljava/util/HashMap;

    return-void
.end method

.method public static destroyFromNative(J)V
    .registers 3

    sget-object v0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static get(J)Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
    .registers 3

    sget-object v0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;

    return-object p0

    :cond_15
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public abstract a(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V
.end method

.method public final associateNative(J)V
    .registers 3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sget-object p0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final callShouldIgnoreNavigation(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZ)V
    .registers 14

    new-instance v7, Ld23;

    new-instance v0, Lwa;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Lwa;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x2

    invoke-direct {v7, v0, v1}, Ld23;-><init>(Ljava/lang/Object;B)V

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V

    return-void
.end method

.method public handleSubframeExternalProtocol(Lorg/chromium/url/GURL;IZLorg/chromium/url/Origin;)Lorg/chromium/url/GURL;
    .registers 5

    const/4 p0, 0x0

    return-object p0
.end method

.method public onResourceRequestWithGesture()V
    .registers 1

    return-void
.end method

.method public requestFinishPendingShouldIgnoreCheck()V
    .registers 1

    return-void
.end method
