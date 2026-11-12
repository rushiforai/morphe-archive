.class public final Lsk6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/Set;


# instance fields
.field public final a:Lcq5;

.field public final b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "ww9.affinity.net"

    const-string v1, "ww10.affinity.net"

    const-string v2, "ww55.affinity.net"

    const-string v3, "ww8.affinity.net"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lsk6;->c:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcq5;Lcom/opera/android/settings/SettingsManager;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsk6;->a:Lcq5;

    iput-object p2, p0, Lsk6;->b:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lsk6;->a:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->b()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lsk6;->c:Ljava/util/Set;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, v0}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4b

    const-string v0, "ad_blocking"

    iget-object p0, p0, Lsk6;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "tracker_blocker"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    or-int/lit8 v0, v0, 0x2

    :cond_32
    const-string v1, "compression"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3c

    or-int/lit8 v0, v0, 0x4

    :cond_3c
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "subid"

    invoke-static {p1, v0, p0}, Lwqm;->E(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4b
    const/4 p0, 0x0

    return-object p0
.end method
