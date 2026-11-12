.class public final Lv2g;
.super Lt2g;
.source "SourceFile"


# instance fields
.field public final b:Lkqd;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lx2g;Lkqd;)V
    .registers 7

    const-string v0, "https://"

    const-string v1, "/v1/tree"

    invoke-static {v0, p1, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p3, p1}, Lt2g;-><init>(Ljava/lang/String;Lx2g;Ljava/lang/String;)V

    iput-object p4, p0, Lv2g;->b:Lkqd;

    iget-object p1, p0, Lt2g;->a:Lcom/opera/android/browser/SimpleUrlLoader;

    new-instance p2, Lu2g;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lu2g;-><init>(Lv2g;B)V

    new-instance p3, Lu2g;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lu2g;-><init>(Lv2g;B)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p2, p3}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method
