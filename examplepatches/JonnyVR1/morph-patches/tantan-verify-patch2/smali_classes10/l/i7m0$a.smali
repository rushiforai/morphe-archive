.class public Ll/i7m0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i7m0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/i7m0;


# direct methods
.method public constructor <init>(Ll/i7m0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i7m0$a;->a:Ll/i7m0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i7m0$a;->a:Ll/i7m0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/i7m0;->H(Ll/i7m0;)Ll/y8s;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/g7m0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Ll/w7p0;->d(Ll/oo2;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/i7m0$a;->a:Ll/i7m0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/i7m0;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/i7m0$a;->a:Ll/i7m0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/i7m0;->p:Ll/g7m0;

    .line 25
    .line 26
    invoke-static {v0, p1, p0}, Ll/z6m0;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y8s;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i7m0$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
