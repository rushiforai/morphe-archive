.class public final Lj6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final a:Ldb;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lzwk;

.field public final d:Le6g;

.field public e:Li6g;


# direct methods
.method public constructor <init>(Ldb;Lcom/opera/android/settings/SettingsManager;Lzwk;Le6g;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj6g;->a:Ldb;

    iput-object p2, p0, Lj6g;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lj6g;->c:Lzwk;

    iput-object p4, p0, Lj6g;->d:Le6g;

    new-instance p1, Li6g;

    invoke-virtual {p0}, Lj6g;->a()Z

    move-result p2

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p3, 0x3

    invoke-static {p3}, Lzwk;->c(I)Z

    move-result p3

    invoke-direct {p1, p2, p3}, Li6g;-><init>(ZZ)V

    iput-object p1, p0, Lj6g;->e:Li6g;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 2

    return-void
.end method

.method public final a()Z
    .registers 4

    iget-object v0, p0, Lj6g;->a:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lj6g;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "enable_sync"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object p0, p0, Lj6g;->c:Lzwk;

    invoke-static {v0, p0}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result p0

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Z)V
    .registers 4

    new-instance p1, Li6g;

    invoke-virtual {p0}, Lj6g;->a()Z

    move-result v0

    iget-object v1, p0, Lj6g;->c:Lzwk;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x3

    invoke-static {v1}, Lzwk;->c(I)Z

    move-result v1

    invoke-direct {p1, v0, v1}, Li6g;-><init>(ZZ)V

    iget-object v0, p0, Lj6g;->e:Li6g;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    iput-object p1, p0, Lj6g;->e:Li6g;

    iget-object p0, p0, Lj6g;->d:Le6g;

    invoke-virtual {p0}, Le6g;->invoke()Ljava/lang/Object;

    :cond_22
    return-void
.end method
