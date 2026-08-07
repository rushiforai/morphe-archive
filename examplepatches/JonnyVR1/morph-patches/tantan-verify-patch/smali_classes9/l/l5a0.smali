.class public final synthetic Ll/l5a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/g6a0;


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l5a0;->a:Ll/g6a0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5a0;->a:Ll/g6a0;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {p0, p1, p2}, Ll/g6a0;->g0(Ll/g6a0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
