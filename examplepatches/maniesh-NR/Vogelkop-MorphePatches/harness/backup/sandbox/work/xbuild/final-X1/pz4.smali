.class public final Lpz4;
.super Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lrz4;


# direct methods
.method public constructor <init>(Lrz4;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpz4;->b:Lrz4;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZZZLd23;)V
    .registers 8

    iget-object p0, p0, Lpz4;->b:Lrz4;

    invoke-virtual {p0, p1, p2, p3, p4}, Lrz4;->E0(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p7, p0}, Ld23;->onResult(Ljava/lang/Object;)V

    return-void
.end method
