.class public final Lzpe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldue;
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lfue;

.field public final c:Lx5f;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lfue;Lx5f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzpe;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lzpe;->b:Lfue;

    iput-object p3, p0, Lzpe;->c:Lx5f;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p2, p0}, Lfue;->b(Ldue;)V

    invoke-virtual {p2}, Lfue;->d()V

    iget-object p1, p2, Lfue;->a:Lcue;

    invoke-virtual {p0, p1}, Lzpe;->a(Lcue;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_newsfeed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    iget-object p1, p0, Lzpe;->b:Lfue;

    invoke-virtual {p1}, Lfue;->d()V

    iget-object p1, p1, Lfue;->a:Lcue;

    invoke-virtual {p0, p1}, Lzpe;->a(Lcue;)V

    :cond_12
    return-void
.end method

.method public final a(Lcue;)V
    .registers 4

    iget-object v0, p0, Lzpe;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lzpe;->c:Lx5f;

    if-nez v0, :cond_12

    sget-object p1, Lej0;->b:Lej0;

    invoke-virtual {p0, p1}, Lx5f;->g0(Lej0;)V

    return-void

    :cond_12
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1a

    return-void

    :cond_1a
    sget-object p1, Lej0;->d:Lej0;

    invoke-virtual {p0, p1}, Lx5f;->g0(Lej0;)V

    return-void
.end method

.method public final b(Lcue;)V
    .registers 2

    invoke-virtual {p0, p1}, Lzpe;->a(Lcue;)V

    return-void
.end method
