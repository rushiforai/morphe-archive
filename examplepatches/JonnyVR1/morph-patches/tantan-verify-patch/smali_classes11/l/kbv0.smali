.class public final synthetic Ll/kbv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qbv0;

.field public final synthetic b:Lcom/google/android/gms/ads/internal/overlay/b;


# direct methods
.method public synthetic constructor <init>(Ll/qbv0;Lcom/google/android/gms/ads/internal/overlay/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kbv0;->a:Ll/qbv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kbv0;->b:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kbv0;->a:Ll/qbv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/kbv0;->b:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/qbv0;->r8(Lcom/google/android/gms/ads/internal/overlay/b;Landroid/content/DialogInterface;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
