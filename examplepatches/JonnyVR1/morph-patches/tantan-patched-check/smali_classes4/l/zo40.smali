.class public final synthetic Ll/zo40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    check-cast p3, Ljava/lang/Integer;

    check-cast p4, Ljava/lang/Integer;

    check-cast p5, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p1, p2, p3, p4, p5}, Ll/ip40;->A0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ll/ovb0;

    move-result-object p0

    return-object p0
.end method
