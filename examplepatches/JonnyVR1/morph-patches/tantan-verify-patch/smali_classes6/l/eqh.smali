.class public final synthetic Ll/eqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fqh;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Emotion;


# direct methods
.method public synthetic constructor <init>(Ll/fqh;Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eqh;->a:Ll/fqh;

    iput-object p2, p0, Ll/eqh;->b:Lcom/p1/mobile/putong/data/Emotion;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eqh;->a:Ll/fqh;

    iget-object p0, p0, Ll/eqh;->b:Lcom/p1/mobile/putong/data/Emotion;

    invoke-static {v0, p0, p1}, Ll/fqh;->E(Ll/fqh;Lcom/p1/mobile/putong/data/Emotion;Landroid/view/View;)V

    return-void
.end method
