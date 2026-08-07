.class public final synthetic Ll/vok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hpk;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GroupTab;


# direct methods
.method public synthetic constructor <init>(Ll/hpk;Lcom/p1/mobile/putong/core/data/GroupTab;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vok;->a:Ll/hpk;

    iput-object p2, p0, Ll/vok;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vok;->a:Ll/hpk;

    iget-object p0, p0, Ll/vok;->b:Lcom/p1/mobile/putong/core/data/GroupTab;

    invoke-static {v0, p0, p1}, Ll/hpk;->g0(Ll/hpk;Lcom/p1/mobile/putong/core/data/GroupTab;Landroid/view/View;)V

    return-void
.end method
