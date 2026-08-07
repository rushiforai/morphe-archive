.class public final synthetic Ll/vdy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/ads/internal/util/b;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/ads/internal/util/b;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vdy0;->a:Lcom/google/android/gms/ads/internal/util/b;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vdy0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/vdy0;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vdy0;->a:Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vdy0;->b:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vdy0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0, p1, p2}, Lcom/google/android/gms/ads/internal/util/b;->I(Landroid/content/Context;Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
