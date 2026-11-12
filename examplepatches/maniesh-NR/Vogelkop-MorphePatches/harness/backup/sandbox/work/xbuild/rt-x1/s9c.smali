.class public final Ls9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lagg;
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lm9c;


# direct methods
.method public constructor <init>(Lm9c;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls9c;->a:Lm9c;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const-string v0, "Cookies"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    const-string p1, "Client"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    invoke-virtual {p0}, Ls9c;->run()V

    :cond_13
    return-void
.end method

.method public final run()V
    .registers 3

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Ls9c;->a:Lm9c;

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "huid"

    invoke-static {p0, v1, v0}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
