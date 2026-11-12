.class public final Ld6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lqfb;

.field public final c:Lx5f;

.field public final d:Lx5f;

.field public final e:Lhd;

.field public final f:Losf;

.field public final g:Lwsf;

.field public final h:Lhd;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lqfb;Lx5f;Lx5f;Lhd;Losf;Lwsf;Lhd;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld6j;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ld6j;->b:Lqfb;

    iput-object p3, p0, Ld6j;->c:Lx5f;

    iput-object p4, p0, Ld6j;->d:Lx5f;

    iput-object p5, p0, Ld6j;->e:Lhd;

    iput-object p6, p0, Ld6j;->f:Losf;

    iput-object p7, p0, Ld6j;->g:Lwsf;

    iput-object p8, p0, Ld6j;->h:Lhd;

    new-instance p3, Lj25;

    const/4 p4, 0x5

    invoke-direct {p3, p0, p4}, Lj25;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    const-string p0, "ga_usage_statistics"

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2b

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {p2, p0}, Lqfb;->setEnabled(Z)V

    :cond_2b
    return-void
.end method
