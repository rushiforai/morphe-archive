.class public final Loke;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public e:J

.field public f:J

.field public g:Lorg/chromium/content_public/browser/NavigationHandle;


# direct methods
.method public constructor <init>(ZZLorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Loke;->a:J

    iput-boolean p1, p0, Loke;->b:Z

    iget-boolean p1, p3, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    iput-boolean p1, p0, Loke;->c:Z

    iput-boolean p2, p0, Loke;->d:Z

    iput-object p3, p0, Loke;->g:Lorg/chromium/content_public/browser/NavigationHandle;

    return-void
.end method
