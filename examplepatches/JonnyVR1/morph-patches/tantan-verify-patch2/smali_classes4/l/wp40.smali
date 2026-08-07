.class public final synthetic Ll/wp40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iq40;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/iq40;Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wp40;->a:Ll/iq40;

    iput-object p2, p0, Ll/wp40;->b:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    iput-object p3, p0, Ll/wp40;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wp40;->a:Ll/iq40;

    iget-object v1, p0, Ll/wp40;->b:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    iget-object p0, p0, Ll/wp40;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/iq40;->a(Ll/iq40;Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
