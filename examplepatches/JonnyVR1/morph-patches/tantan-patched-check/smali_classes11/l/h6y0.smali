.class public final Ll/h6y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/os/Bundle;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/h6y0;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    iput-object p1, p0, Ll/h6y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h6y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h6y0;->a:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/google/android/gms/measurement/internal/g;->N(Lcom/google/android/gms/measurement/internal/g;Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
