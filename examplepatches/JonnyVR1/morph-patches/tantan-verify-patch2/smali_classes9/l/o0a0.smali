.class public final synthetic Ll/o0a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/p0a0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o0a0;->a:Ll/p0a0;

    iput-object p2, p0, Ll/o0a0;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    iput-object p3, p0, Ll/o0a0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o0a0;->a:Ll/p0a0;

    iget-object v1, p0, Ll/o0a0;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    iget-object p0, p0, Ll/o0a0;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/p0a0;->c0(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ll/x20;)V

    return-void
.end method
