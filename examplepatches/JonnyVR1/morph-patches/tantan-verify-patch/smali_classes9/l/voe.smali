.class public final synthetic Ll/voe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zoe;

.field public final synthetic b:Lcom/p1/mobile/putong/data/CharacterEvaluate;


# direct methods
.method public synthetic constructor <init>(Ll/zoe;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/voe;->a:Ll/zoe;

    iput-object p2, p0, Ll/voe;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voe;->a:Ll/zoe;

    iget-object p0, p0, Ll/voe;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    invoke-static {v0, p0, p1}, Ll/zoe;->R(Ll/zoe;Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V

    return-void
.end method
