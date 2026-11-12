.class public final Lbei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/security/KeyChainAliasCallback;


# instance fields
.field public final a:J

.field public final b:Landroid/content/Context;

.field public c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbei;->b:Landroid/content/Context;

    iput-wide p2, p0, Lbei;->a:J

    return-void
.end method


# virtual methods
.method public final alias(Ljava/lang/String;)V
    .registers 4

    iget-boolean v0, p0, Lbei;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lbei;->c:Z

    new-instance v0, Lq2g;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, p1, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lorg/chromium/base/ThreadUtils;->d(Ljava/lang/Runnable;)V

    return-void
.end method
