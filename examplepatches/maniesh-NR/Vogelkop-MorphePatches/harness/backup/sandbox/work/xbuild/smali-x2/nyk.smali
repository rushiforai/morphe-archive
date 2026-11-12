.class public final Lnyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:Lzwk;

.field public final synthetic b:Ldb;

.field public final synthetic c:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnyk;->a:Lzwk;

    iput-object p1, p0, Lnyk;->b:Ldb;

    iput-object p3, p0, Lnyk;->c:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 4

    if-eqz p1, :cond_18

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    iget-object v1, p0, Lnyk;->a:Lzwk;

    if-eq p1, v0, :cond_e

    const/4 v0, 0x4

    if-eq p1, v0, :cond_18

    goto :goto_15

    :cond_e
    iget-object p1, p0, Lnyk;->b:Ldb;

    iget-object v0, p0, Lnyk;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-static {p1, v1, v0}, Lxih;->q(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V

    :goto_15
    invoke-virtual {v1, p0}, Lzwk;->j(Lywk;)V

    :cond_18
    return-void
.end method
