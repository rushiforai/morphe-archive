.class public Ll/y2h0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic b:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$c;->b:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$c;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/y2h0$c;->b:Ll/y2h0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Ll/y2h0$c;->a:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 5
    .line 6
    const-string v2, "dismiss"

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3, v1, p0}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/gra;->x()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/hlh0;->k(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
