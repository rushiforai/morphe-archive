.class public final Lgc7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lu1b;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lay;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    const-string v0, "oem_ofa_lenovo_offline"

    const-string v1, "oem_ofa_lenovo_tablet"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v8

    const-string v2, "amazon"

    const-string v3, "oem_Huawei_appgallery"

    const-string v4, "samsungappstore"

    const-string v5, "oem_ofa_honor_store"

    const-string v6, "oem_ofa_xiaomi_offline"

    const-string v7, "oem_ofa_sliide_offline"

    invoke-static/range {v2 .. v8}, Lu1b;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lu1b;

    move-result-object v0

    sput-object v0, Lgc7;->c:Lu1b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lay;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lgc7;->b:Lay;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lgc7;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgc7;->b:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfc7;

    iget-object p0, p0, Lfc7;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Z
    .registers 2

    invoke-virtual {p0}, Lgc7;->a()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lgc7;->c:Lu1b;

    invoke-virtual {v0, p0}, Lx0b;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
