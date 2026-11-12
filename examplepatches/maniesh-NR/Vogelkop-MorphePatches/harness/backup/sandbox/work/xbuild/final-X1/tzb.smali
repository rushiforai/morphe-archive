.class public final Ltzb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Locale;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string v0, ""

    iput-object v0, p0, Ltzb;->a:Ljava/lang/String;

    const/4 v1, 0x0

    .line 37
    iput-object v1, p0, Ltzb;->b:Ljava/util/Locale;

    .line 38
    iput-object v0, p0, Ltzb;->c:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Ltzb;->d:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltzb;->a:Ljava/lang/String;

    invoke-static {p2}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Ltzb;->b:Ljava/util/Locale;

    invoke-static {p2}, Lywc;->a(Ljava/lang/String;)Lxwc;

    move-result-object p2

    iget v0, p2, Lxwc;->b:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Laik;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltzb;->c:Ljava/lang/String;

    iget-object p1, p2, Lxwc;->a:Ljava/lang/String;

    iput-object p1, p0, Ltzb;->d:Ljava/lang/String;

    return-void
.end method
