.class public final Ljk5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpv1;

.field public final b:Lode;

.field public final c:Lru9;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpv1;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljk5;->a:Lpv1;

    new-instance p2, Lode;

    invoke-direct {p2}, Lekc;-><init>()V

    iput-object p2, p0, Ljk5;->b:Lode;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Ljk5;->c:Lru9;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljk5;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Ljk5;->c:Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "config_bundle.active"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
