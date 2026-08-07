.class public final synthetic Ll/b0a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p0a0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/CharacterEvaluate;


# direct methods
.method public synthetic constructor <init>(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0a0;->a:Ll/p0a0;

    iput-object p2, p0, Ll/b0a0;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b0a0;->a:Ll/p0a0;

    iget-object p0, p0, Ll/b0a0;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    invoke-static {v0, p0}, Ll/p0a0;->V(Ll/p0a0;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V

    return-void
.end method
