.class public Lcom/opera/android/browser/chromium/PermissionDialogDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;->a:J

    return-void
.end method


# virtual methods
.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/PermissionDialogDelegate;->a:J

    invoke-static {v0, v1}, LJ/N;->Mnm65ERZ(J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
