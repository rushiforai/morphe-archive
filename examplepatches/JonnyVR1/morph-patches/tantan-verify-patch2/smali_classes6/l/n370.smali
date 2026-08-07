.class public final synthetic Ll/n370;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/v370;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Ll/v370;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n370;->a:Ll/v370;

    iput-object p2, p0, Ll/n370;->b:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n370;->a:Ll/v370;

    iget-object p0, p0, Ll/n370;->b:Lcom/p1/mobile/putong/data/Links;

    invoke-static {v0, p0}, Ll/v370;->m(Ll/v370;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
