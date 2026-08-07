.class public final synthetic Ll/mbv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qbv0;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Lcom/google/android/gms/ads/internal/overlay/b;


# direct methods
.method public synthetic constructor <init>(Ll/qbv0;Landroid/app/Activity;Lcom/google/android/gms/ads/internal/overlay/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mbv0;->a:Ll/qbv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mbv0;->b:Landroid/app/Activity;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mbv0;->c:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mbv0;->a:Ll/qbv0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mbv0;->b:Landroid/app/Activity;

    .line 4
    .line 5
    iget-object p0, p0, Ll/mbv0;->c:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0, p1, p2}, Ll/qbv0;->t8(Landroid/app/Activity;Lcom/google/android/gms/ads/internal/overlay/b;Landroid/content/DialogInterface;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
