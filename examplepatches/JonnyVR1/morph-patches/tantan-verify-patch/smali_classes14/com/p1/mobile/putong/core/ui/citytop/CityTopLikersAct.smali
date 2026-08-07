.class public Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Lcom/p1/mobile/putong/core/ui/citytop/a;",
        "Ll/e85;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ll/m65;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Z1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->b2()Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->c2()Ll/e85;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public a2()Ll/m65;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->e:Ll/m65;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/m65;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/m65;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->e:Ll/m65;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->e:Ll/m65;

    .line 17
    .line 18
    return-object p0
.end method

.method public b2()Lcom/p1/mobile/putong/core/ui/citytop/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/citytop/a;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c2()Ll/e85;
    .locals 1

    .line 1
    new-instance v0, Ll/e85;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/e85;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_city_cover_received_greet"

    .line 2
    .line 3
    return-object p0
.end method
