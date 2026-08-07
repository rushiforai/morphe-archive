.class public Ll/wgx$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->N(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wgx$h;->b:Ll/wgx;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wgx$h;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wgx$h;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, Ll/wgx$h;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->k6()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ll/wgx$h;->b:Ll/wgx;

    .line 34
    .line 35
    iget-object p0, p0, Ll/wgx$h;->a:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, p0, p1, v1}, Ll/wgx;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wgx$h;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
