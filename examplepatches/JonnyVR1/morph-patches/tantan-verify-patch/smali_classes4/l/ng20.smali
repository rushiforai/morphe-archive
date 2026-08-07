.class public final synthetic Ll/ng20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/pg20;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ll/pg20;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ng20;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/ng20;->b:Ll/pg20;

    iput p3, p0, Ll/ng20;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ng20;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/ng20;->b:Ll/pg20;

    iget p0, p0, Ll/ng20;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/pg20;->F(Lcom/p1/mobile/putong/data/User;Ll/pg20;ILandroid/view/View;)V

    return-void
.end method
