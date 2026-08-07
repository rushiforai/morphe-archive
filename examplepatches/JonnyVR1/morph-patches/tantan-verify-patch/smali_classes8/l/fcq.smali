.class public final synthetic Ll/fcq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iput-object p2, p0, Ll/fcq;->b:Ljava/lang/String;

    iput p3, p0, Ll/fcq;->c:I

    iput-object p4, p0, Ll/fcq;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/fcq;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/fcq;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fcq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;

    iget-object v1, p0, Ll/fcq;->b:Ljava/lang/String;

    iget v2, p0, Ll/fcq;->c:I

    iget-object v3, p0, Ll/fcq;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/fcq;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/fcq;->f:Ljava/lang/String;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;->r(Lcom/p1/mobile/putong/core/ui/messages/ItemMomentGuidePhaseTwo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
