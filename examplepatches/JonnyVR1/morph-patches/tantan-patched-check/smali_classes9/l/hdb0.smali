.class public final synthetic Ll/hdb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdb0;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hdb0;->a:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
