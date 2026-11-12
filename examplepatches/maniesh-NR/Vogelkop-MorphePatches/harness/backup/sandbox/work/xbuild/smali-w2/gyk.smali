.class public final Lgyk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lhk6;


# instance fields
.field public final a:Lxd5;

.field public final b:Lnr8;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Ldb;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lhk6;->g:Lhk6;

    sput-object v0, Lgyk;->e:Lhk6;

    return-void
.end method

.method public constructor <init>(Lxd5;Lnr8;Lcom/opera/android/settings/SettingsManager;Ldb;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgyk;->a:Lxd5;

    iput-object p2, p0, Lgyk;->b:Lnr8;

    iput-object p3, p0, Lgyk;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lgyk;->d:Ldb;

    new-instance p2, Lnj2;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Lnj2;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Lj25;

    invoke-direct {p4, p0, p3}, Lj25;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance p3, Leyk;

    invoke-direct {p3, p0, p2, p4}, Leyk;-><init>(Lgyk;Lnj2;Lj25;)V

    invoke-virtual {p1, p3}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lgyk;->d:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lgyk;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_sync"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_13

    :cond_12
    return-void

    :cond_13
    new-instance v0, Lqlk;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lgyk;->b:Lnr8;

    invoke-virtual {p0, v0}, Lnr8;->f(Ljava/lang/Runnable;)V

    return-void
.end method
