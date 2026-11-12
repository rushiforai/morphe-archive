.class public final Lcom/opera/android/settings/SystemSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/ContentResolver;

.field public final b:Ltd2;

.field public c:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/settings/SystemSettings;->a:Landroid/content/ContentResolver;

    new-instance p1, Ltd2;

    invoke-direct {p1, p2}, Ltd2;-><init>(Lumi;)V

    iput-object p1, p0, Lcom/opera/android/settings/SystemSettings;->b:Ltd2;

    new-instance p2, Lmcj;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p2, p0, v1, v0}, Lmcj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {p1, v1, p2}, Ltd2;->a(Landroid/app/NotificationManager;Lfd2;)V

    return-void
.end method


# virtual methods
.method public final getPasswordEchoEnabled()Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/settings/SystemSettings;->c:Ljava/util/HashMap;

    const-string v1, "show_password"

    if-eqz v0, :cond_11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_11
    iget-object p0, p0, Lcom/opera/android/settings/SystemSettings;->a:Landroid/content/ContentResolver;

    const/4 v0, 0x1

    invoke-static {p0, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-ne p0, v0, :cond_1b

    return v0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method
