.class public final Ll/ggy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xfy0;


# direct methods
.method public constructor <init>(Ll/xfy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ggy0;->a:Ll/xfy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ggy0;->a:Ll/xfy0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/xfy0;->c:Ll/hcy0;

    .line 4
    .line 5
    new-instance v1, Landroid/content/ComponentName;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ggy0;->a:Ll/xfy0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/xfy0;->c:Ll/hcy0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v2, "com.google.android.gms.measurement.AppMeasurementService"

    .line 16
    .line 17
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/hcy0;->M(Ll/hcy0;Landroid/content/ComponentName;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
