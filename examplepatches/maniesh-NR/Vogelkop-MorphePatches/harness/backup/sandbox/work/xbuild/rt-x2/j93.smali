.class public abstract Lj93;
.super Ll7n;
.source "SourceFile"

# interfaces
.implements Lh93;


# instance fields
.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ld8j;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V
    .registers 3

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lj93;->c:Ld8j;

    return-void
.end method


# virtual methods
.method public f()Ld8j;
    .registers 1

    iget-object p0, p0, Lj93;->c:Ld8j;

    return-object p0
.end method

.method public s()V
    .registers 1

    invoke-virtual {p0}, Lj93;->f()Ld8j;

    move-result-object p0

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    return-void
.end method
