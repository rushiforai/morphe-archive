.class public Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/i3h0;",
        "Ll/j3h0;",
        ">;"
    }
.end annotation


# static fields
.field public static e:Ljava/lang/String; = "pageFormat"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/ActionPageFormat;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->Z1()Ll/i3h0;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->a2()Ll/j3h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z1()Ll/i3h0;
    .locals 1

    .line 1
    new-instance v0, Ll/i3h0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i3h0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/j3h0;
    .locals 1

    .line 1
    new-instance v0, Ll/j3h0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j3h0;-><init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/i3h0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/i3h0;->n0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
