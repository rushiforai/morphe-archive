.class public final Lyo3;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lami;

.field public final e:Ljt3;

.field public final f:Lva2;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;Lami;Ljt3;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p3, p0, Lyo3;->d:Lami;

    iput-object p4, p0, Lyo3;->e:Ljt3;

    new-instance p1, Lva2;

    const/16 p2, 0x16

    invoke-direct {p1, p0, p2}, Lva2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lyo3;->f:Lva2;

    return-void
.end method
