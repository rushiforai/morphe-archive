.class public final Lt9;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lbxk;

.field public final e:Lode;

.field public final f:Ls9;


# direct methods
.method public constructor <init>(Ld8j;Lcom/opera/android/settings/SettingsManager;Lbxk;)V
    .registers 4

    invoke-direct {p0, p2, p1}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p3, p0, Lt9;->d:Lbxk;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lt9;->e:Lode;

    new-instance p1, Ls9;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lt9;->f:Ls9;

    invoke-virtual {p0}, Lt9;->h()V

    invoke-virtual {p2, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lt9;->f:Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final g(I)Lndo;
    .registers 10

    new-instance v0, Lndo;

    iget-object v1, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "text_wrap"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    int-to-float v2, p1

    iget-object p0, p0, Lt9;->d:Lbxk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 p0, 0x42c80000    # 100.0f

    div-float p0, v2, p0

    const/high16 v3, 0x41400000    # 12.0f

    mul-float v4, p0, v3

    const/high16 v3, 0x41800000    # 16.0f

    mul-float v5, p0, v3

    const/high16 v3, 0x41b00000    # 22.0f

    mul-float v6, p0, v3

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float v7, p0, v3

    move v3, p1

    invoke-direct/range {v0 .. v7}, Lndo;-><init>(ZFIFFFF)V

    return-object v0
.end method

.method public final h()V
    .registers 7

    new-instance v0, Lr9;

    iget-object v1, p0, Lt9;->d:Lbxk;

    invoke-virtual {v1}, Lbxk;->g()I

    move-result v1

    invoke-virtual {p0, v1}, Lt9;->g(I)Lndo;

    move-result-object v1

    const-string v2, "force_enable_zoom"

    iget-object v3, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    invoke-static {}, Ls7j;->values()[Ls7j;

    move-result-object v4

    const-string v5, "user_agent"

    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v3

    aget-object v3, v4, v3

    iget v3, v3, Ls7j;->a:I

    invoke-direct {v0, v1, v2, v3}, Lr9;-><init>(Lndo;ZI)V

    iget-object p0, p0, Lt9;->e:Lode;

    invoke-virtual {p0, v0}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method
