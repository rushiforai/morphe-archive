.class public final synthetic Ll/ry80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/UserPrivilege;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ry80;->a:Lcom/p1/mobile/putong/core/data/UserPrivilege;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ry80;->a:Lcom/p1/mobile/putong/core/data/UserPrivilege;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/sy80;->f(Lcom/p1/mobile/putong/core/data/UserPrivilege;Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
