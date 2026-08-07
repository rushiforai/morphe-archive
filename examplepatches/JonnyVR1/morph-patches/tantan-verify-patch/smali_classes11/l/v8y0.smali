.class public final synthetic Ll/v8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nbt0;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v8y0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v8y0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/v8y0;->a:Landroid/content/Context;

    .line 7
    .line 8
    iget-object p0, p0, Ll/v8y0;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, p0, p1}, Lcom/google/android/gms/ads/internal/util/b;->k(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0
.end method
