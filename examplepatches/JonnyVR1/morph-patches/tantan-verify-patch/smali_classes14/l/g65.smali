.class public final synthetic Ll/g65;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m65;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Greeting;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;


# direct methods
.method public synthetic constructor <init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g65;->a:Ll/m65;

    iput-object p2, p0, Ll/g65;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    iput-object p3, p0, Ll/g65;->c:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g65;->a:Ll/m65;

    iget-object v1, p0, Ll/g65;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    iget-object p0, p0, Ll/g65;->c:Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/m65;->F(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/pf60;)V

    return-void
.end method
