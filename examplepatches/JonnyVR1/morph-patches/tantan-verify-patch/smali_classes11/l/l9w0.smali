.class public final synthetic Ll/l9w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/o1;

.field public final synthetic b:Ll/d6z0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/ads/o1;Ll/d6z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l9w0;->a:Lcom/google/android/gms/internal/ads/o1;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l9w0;->b:Ll/d6z0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l9w0;->a:Lcom/google/android/gms/internal/ads/o1;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l9w0;->b:Ll/d6z0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d6z0;->a:Ll/r6z0;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/o1;->a()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p0, v0}, Ll/r6z0;->d(Ll/r6z0;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
