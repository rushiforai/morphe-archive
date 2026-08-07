.class public final synthetic Ll/t75;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Greeting;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t75;->a:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    iput-object p2, p0, Ll/t75;->b:Ll/y20;

    iput-object p3, p0, Ll/t75;->c:Lcom/p1/mobile/putong/core/data/Greeting;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t75;->a:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    iget-object v1, p0, Ll/t75;->b:Ll/y20;

    iget-object p0, p0, Ll/t75;->c:Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->b(Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/y20;Lcom/p1/mobile/putong/core/data/Greeting;Landroid/view/View;)V

    return-void
.end method
