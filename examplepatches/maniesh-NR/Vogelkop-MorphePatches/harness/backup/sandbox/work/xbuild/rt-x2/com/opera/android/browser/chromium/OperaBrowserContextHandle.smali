.class public Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/content_public/browser/BrowserContextHandle;


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;->a:J

    return-void
.end method


# virtual methods
.method public final a()J
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;->a:J

    return-wide v0
.end method
