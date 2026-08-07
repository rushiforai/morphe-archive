.class public final synthetic Ll/hg40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ig40;

.field public final synthetic b:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Ll/ig40;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hg40;->a:Ll/ig40;

    iput-object p2, p0, Ll/hg40;->b:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hg40;->a:Ll/ig40;

    iget-object p0, p0, Ll/hg40;->b:Ljava/lang/Boolean;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, p0, p1}, Ll/ig40;->s(Ll/ig40;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
