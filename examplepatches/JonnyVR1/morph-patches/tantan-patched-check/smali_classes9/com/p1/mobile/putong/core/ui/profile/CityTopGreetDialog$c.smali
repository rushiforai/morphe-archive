.class public Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Ll/l4g0;

.field public d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->d:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->X(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->c:Ll/l4g0;

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->W(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/lang/String;Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method
