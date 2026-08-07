.class public final synthetic Ll/ibe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/School;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;Lcom/p1/mobile/putong/core/data/School;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibe0;->a:Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;

    iput-object p2, p0, Ll/ibe0;->b:Lcom/p1/mobile/putong/core/data/School;

    iput-boolean p3, p0, Ll/ibe0;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ibe0;->a:Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;

    iget-object v1, p0, Ll/ibe0;->b:Lcom/p1/mobile/putong/core/data/School;

    iget-boolean p0, p0, Ll/ibe0;->c:Z

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;->a(Lcom/p1/mobile/putong/core/ui/campus/SchoolItemView;Lcom/p1/mobile/putong/core/data/School;ZLandroid/view/View;)V

    return-void
.end method
