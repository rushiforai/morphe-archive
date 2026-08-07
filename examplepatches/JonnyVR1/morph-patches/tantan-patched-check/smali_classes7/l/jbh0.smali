.class public final synthetic Ll/jbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jbh0;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbh0;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {p0, p1}, Ll/ybh0;->L(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
