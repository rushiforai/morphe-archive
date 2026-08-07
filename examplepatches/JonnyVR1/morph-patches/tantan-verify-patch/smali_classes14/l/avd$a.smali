.class public Ll/avd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/avd;->x0()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/core/data/BlockedUserStatus;",
        "Lrx/c<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/avd;


# direct methods
.method public constructor <init>(Ll/avd;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/avd$a;->a:Ll/avd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/BlockedUserStatus;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/BlockedUserStatus;",
            ")",
            "Lrx/c<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BlockedUserStatus;->data:Lcom/p1/mobile/putong/core/data/BlockedUserStatusData;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/BlockedUserStatusData;->status:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/avd$a;->a:Ll/avd;

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/avd;->o0(Ll/avd;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/avd$a;->a:Ll/avd;

    .line 15
    .line 16
    invoke-static {p1}, Ll/avd;->l0(Ll/avd;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Ll/avd$a;->a:Ll/avd;

    .line 21
    .line 22
    invoke-static {v0}, Ll/avd;->n0(Ll/avd;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/avd$a;->a:Ll/avd;

    .line 27
    .line 28
    invoke-static {p0}, Ll/avd;->m0(Ll/avd;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, v0, p0}, Ll/sw6;->t3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/BlockedUserStatus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/avd$a;->a(Lcom/p1/mobile/putong/core/data/BlockedUserStatus;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
