.class public final synthetic Ll/ydf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cef;

.field public final synthetic b:Lcom/p1/mobile/putong/data/CharacterEvaluate;


# direct methods
.method public synthetic constructor <init>(Ll/cef;Lcom/p1/mobile/putong/data/CharacterEvaluate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ydf;->a:Ll/cef;

    iput-object p2, p0, Ll/ydf;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ydf;->a:Ll/cef;

    iget-object p0, p0, Ll/ydf;->b:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    invoke-static {v0, p0, p1}, Ll/cef;->V(Ll/cef;Lcom/p1/mobile/putong/data/CharacterEvaluate;Landroid/view/View;)V

    return-void
.end method
