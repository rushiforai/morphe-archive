.class public final synthetic Ll/h6k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/MembershipType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/MembershipType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h6k0;->a:Lcom/p1/mobile/putong/data/MembershipType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h6k0;->a:Lcom/p1/mobile/putong/data/MembershipType;

    check-cast p1, Lcom/p1/mobile/putong/data/Membership;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/User;->l(Lcom/p1/mobile/putong/data/MembershipType;Lcom/p1/mobile/putong/data/Membership;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
