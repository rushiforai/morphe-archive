.class public final synthetic Ll/v76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w76;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LabelParams;


# direct methods
.method public synthetic constructor <init>(Ll/w76;Lcom/p1/mobile/putong/core/data/LabelParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v76;->a:Ll/w76;

    iput-object p2, p0, Ll/v76;->b:Lcom/p1/mobile/putong/core/data/LabelParams;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v76;->a:Ll/w76;

    iget-object p0, p0, Ll/v76;->b:Lcom/p1/mobile/putong/core/data/LabelParams;

    invoke-static {v0, p0, p1}, Ll/w76;->E(Ll/w76;Lcom/p1/mobile/putong/core/data/LabelParams;Landroid/view/View;)V

    return-void
.end method
