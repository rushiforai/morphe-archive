.class public final Lkq9;
.super Lqtn;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lcom/opera/android/FullscreenWebActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/FullscreenWebActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkq9;->b:Lcom/opera/android/FullscreenWebActivity;

    return-void
.end method


# virtual methods
.method public final shouldCreateWebContents(Lorg/chromium/url/GURL;)Z
    .registers 2

    iget-object p0, p0, Lkq9;->b:Lcom/opera/android/FullscreenWebActivity;

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->q0(Lorg/chromium/url/GURL;)V

    const/4 p0, 0x0

    return p0
.end method
