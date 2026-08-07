.class public final synthetic Ll/y8e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a9e0;

.field public final synthetic b:Ll/abe0;


# direct methods
.method public synthetic constructor <init>(Ll/a9e0;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8e0;->a:Ll/a9e0;

    iput-object p2, p0, Ll/y8e0;->b:Ll/abe0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y8e0;->a:Ll/a9e0;

    iget-object p0, p0, Ll/y8e0;->b:Ll/abe0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ShareId;

    invoke-static {v0, p0, p1}, Ll/a9e0;->g(Ll/a9e0;Ll/abe0;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method
