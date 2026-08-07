.class public final synthetic Ll/gfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pfk;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture;


# direct methods
.method public synthetic constructor <init>(Ll/pfk;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfk;->a:Ll/pfk;

    iput-object p2, p0, Ll/gfk;->b:Lcom/p1/mobile/putong/data/Picture;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gfk;->a:Ll/pfk;

    iget-object p0, p0, Ll/gfk;->b:Lcom/p1/mobile/putong/data/Picture;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/pfk;->e(Ll/pfk;Lcom/p1/mobile/putong/data/Picture;[I)V

    return-void
.end method
