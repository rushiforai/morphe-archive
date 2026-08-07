.class public final Ll/k3s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Ll/s4s0;


# direct methods
.method public constructor <init>(Ll/s4s0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k3s0;->a:Ll/s4s0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/k3s0;->a:Ll/s4s0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/s4s0;->a:Landroid/content/Context;

    .line 7
    .line 8
    const-string p1, "https://support.google.com/dfp_premium/answer/7160685#push"

    .line 9
    .line 10
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Lcom/google/android/gms/ads/internal/util/b;->t(Landroid/content/Context;Landroid/net/Uri;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
