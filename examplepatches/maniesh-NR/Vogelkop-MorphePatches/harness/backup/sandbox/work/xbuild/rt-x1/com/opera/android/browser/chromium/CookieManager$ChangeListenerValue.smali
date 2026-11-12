.class public final Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/browser/chromium/CookieManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChangeListenerValue"
.end annotation


# instance fields
.field public final a:Lh7f;

.field public b:J


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->a:Lh7f;

    return-void
.end method
