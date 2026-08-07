.class public final synthetic Ll/eto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eto;->a:Ll/vto;

    iput-object p2, p0, Ll/eto;->b:Ll/x20;

    iput-object p3, p0, Ll/eto;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eto;->a:Ll/vto;

    iget-object v1, p0, Ll/eto;->b:Ll/x20;

    iget-object p0, p0, Ll/eto;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Order;

    invoke-static {v0, v1, p0, p1}, Ll/vto;->N(Ll/vto;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Order;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
