.class public final Lmen;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lm2n;

.field public final b:Lben;

.field public final c:Lmw0;

.field public final d:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lkze;Lben;Lru9;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    new-instance v0, Lm2n;

    const/4 v1, 0x3

    invoke-direct {v0, p1, v1}, Lm2n;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lmw0;

    invoke-direct {p1, p3}, Lmw0;-><init>(Lru9;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmen;->a:Lm2n;

    iput-object p2, p0, Lmen;->b:Lben;

    iput-object p1, p0, Lmen;->c:Lmw0;

    iput-object p4, p0, Lmen;->d:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method
