.class public final Ll/oav0;
.super Ll/rbv0;
.source "SourceFile"


# instance fields
.field public a:Landroid/app/Activity;

.field public b:Lcom/google/android/gms/ads/internal/overlay/b;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rbv0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Activity;)Ll/rbv0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/oav0;->a:Landroid/app/Activity;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null activity"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/ads/internal/overlay/b;)Ll/rbv0;
    .locals 0
    .param p1    # Lcom/google/android/gms/ads/internal/overlay/b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/oav0;->b:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ll/rbv0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/oav0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ljava/lang/String;)Ll/rbv0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/oav0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/sbv0;
    .locals 6

    .line 1
    iget-object v1, p0, Ll/oav0;->a:Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qav0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/oav0;->b:Lcom/google/android/gms/ads/internal/overlay/b;

    .line 8
    .line 9
    iget-object v3, p0, Ll/oav0;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v4, p0, Ll/oav0;->d:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-direct/range {v0 .. v5}, Ll/qav0;-><init>(Landroid/app/Activity;Lcom/google/android/gms/ads/internal/overlay/b;Ljava/lang/String;Ljava/lang/String;Ll/pav0;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    const-string p0, "Missing required properties: activity"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method
