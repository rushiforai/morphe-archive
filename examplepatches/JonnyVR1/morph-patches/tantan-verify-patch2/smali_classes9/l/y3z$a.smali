.class public Ll/y3z$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y3z;->k0(Ljava/lang/String;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/y3z;


# direct methods
.method public constructor <init>(Ll/y3z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y3z$a;->a:Ll/y3z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y3z$a;->a:Ll/y3z;

    .line 2
    .line 3
    invoke-static {p1}, Ll/y3z;->h0(Ll/y3z;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/z3z;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object p0, p0, Ll/y3z$a;->a:Ll/y3z;

    .line 14
    .line 15
    iget-object p0, p0, Ll/y3z;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/z3z;->k(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y3z$a;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
