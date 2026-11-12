.class public final Lqsi;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lg8j;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lpsi;

.field public final e:Lrlh;


# direct methods
.method public constructor <init>(Lg8j;Lcom/opera/android/settings/SettingsManager;Lpsi;)V
    .registers 7

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lqsi;->b:Lg8j;

    iput-object p2, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lqsi;->d:Lpsi;

    iget-object p1, p3, Lpsi;->t:Lf99;

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object p2

    new-instance v0, Lf9k;

    const-wide/16 v1, 0x1388

    invoke-direct {v0, v1, v2}, Lf9k;-><init>(J)V

    invoke-virtual {p3}, Lpsi;->a()Lmsi;

    move-result-object p3

    invoke-static {p1, p2, v0, p3}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lqsi;->e:Lrlh;

    return-void
.end method
