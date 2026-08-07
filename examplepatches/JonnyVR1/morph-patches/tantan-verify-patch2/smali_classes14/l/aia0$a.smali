.class public Ll/aia0$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aia0;->x(Lcom/p1/mobile/android/app/Act;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Z

.field public final synthetic c:Ll/aia0;


# direct methods
.method public constructor <init>(Ll/aia0;Ll/gcg0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aia0$a;->c:Ll/aia0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/aia0$a;->a:Ll/gcg0;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/aia0$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d70;->onAdClicked()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/aia0$a;->b:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    new-array p0, p0, [Ll/sfj0$a;

    .line 10
    .line 11
    const-string v0, "e_clone_profile_photo_ads"

    .line 12
    .line 13
    const-string v1, "p_suggest_users_home_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public x(Ll/jtv;)V
    .locals 3
    .param p1    # Ll/jtv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/d70;->x(Ll/jtv;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/aia0;->k()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "admob onAdFailedToLoad = ca-app-pub-6567608331519569/1891609663errorCode:"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/aia0$a;->a:Ll/gcg0;

    .line 26
    .line 27
    new-instance p1, Landroid/util/Pair;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    const-string v1, "ca-app-pub-6567608331519569/1891609663"

    .line 31
    .line 32
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
