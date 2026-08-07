.class public final Ll/oyv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/ads/internal/overlay/b;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/overlay/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oyv0;->a:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oyv0;->a:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    iput p1, p0, Lcom/google/android/gms/ads/internal/overlay/b;->v:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/overlay/b;->a:Landroid/app/Activity;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
