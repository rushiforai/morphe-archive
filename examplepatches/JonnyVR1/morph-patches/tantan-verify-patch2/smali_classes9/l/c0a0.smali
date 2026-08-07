.class public final synthetic Ll/c0a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p0a0;

.field public final synthetic b:[Z

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/data/CharacterEvaluate;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/p0a0;[ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0a0;->a:Ll/p0a0;

    iput-object p2, p0, Ll/c0a0;->b:[Z

    iput-object p3, p0, Ll/c0a0;->c:Ll/x20;

    iput-object p4, p0, Ll/c0a0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/c0a0;->e:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    iput-object p6, p0, Ll/c0a0;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/c0a0;->a:Ll/p0a0;

    iget-object v1, p0, Ll/c0a0;->b:[Z

    iget-object v2, p0, Ll/c0a0;->c:Ll/x20;

    iget-object v3, p0, Ll/c0a0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/c0a0;->e:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    iget-object v5, p0, Ll/c0a0;->f:Ljava/lang/String;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/p0a0;->f0(Ll/p0a0;[ZLl/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/CharacterEvaluate;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
