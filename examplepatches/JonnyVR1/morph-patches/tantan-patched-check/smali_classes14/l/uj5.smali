.class public final synthetic Ll/uj5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/vj5;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Ll/vj5;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uj5;->a:Ll/vj5;

    iput-object p2, p0, Ll/uj5;->b:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uj5;->a:Ll/vj5;

    iget-object p0, p0, Ll/uj5;->b:Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {v0, p0}, Ll/vj5;->k(Ll/vj5;Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method
