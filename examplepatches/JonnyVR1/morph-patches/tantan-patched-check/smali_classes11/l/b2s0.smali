.class public final Ll/b2s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ajw0;


# instance fields
.field public final synthetic a:Ll/vhw0;


# direct methods
.method public constructor <init>(Ll/vhw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2s0;->a:Ll/vhw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(IJLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p2

    .line 6
    iget-object p0, p0, Ll/b2s0;->a:Ll/vhw0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1, p4}, Ll/vhw0;->e(IJLjava/lang/String;)Lcom/google/android/gms/tasks/Task;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b(IJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p2

    .line 6
    iget-object p0, p0, Ll/b2s0;->a:Ll/vhw0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1}, Ll/vhw0;->d(IJ)Lcom/google/android/gms/tasks/Task;

    .line 9
    .line 10
    .line 11
    return-void
.end method
