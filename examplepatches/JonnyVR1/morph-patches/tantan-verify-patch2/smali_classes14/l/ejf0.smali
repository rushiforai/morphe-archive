.class public final synthetic Ll/ejf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejf0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    iput-object p2, p0, Ll/ejf0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ejf0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    iget-object p0, p0, Ll/ejf0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->Z1(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
