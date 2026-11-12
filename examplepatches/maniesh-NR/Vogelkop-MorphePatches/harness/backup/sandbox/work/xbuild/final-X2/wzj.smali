.class public final Lwzj;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lg8j;

.field public final e:Lw6j;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lg8j;Lw6j;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p2, p0, Lwzj;->d:Lg8j;

    iput-object p3, p0, Lwzj;->e:Lw6j;

    return-void
.end method


# virtual methods
.method public final f()Ld8j;
    .registers 1

    iget-object p0, p0, Lwzj;->d:Lg8j;

    return-object p0
.end method
