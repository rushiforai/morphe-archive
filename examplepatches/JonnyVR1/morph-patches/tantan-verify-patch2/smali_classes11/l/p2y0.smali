.class public final synthetic Ll/p2y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Lcom/google/android/gms/measurement/internal/g;

.field public synthetic b:Landroid/os/Bundle;

.field public synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/g;Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p2y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p2y0;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/p2y0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p2y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p2y0;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-wide v2, p0, Ll/p2y0;->c:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/g;->I(Landroid/os/Bundle;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
