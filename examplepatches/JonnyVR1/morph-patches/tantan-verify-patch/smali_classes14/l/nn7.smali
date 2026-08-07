.class public final synthetic Ll/nn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/no7;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/no7;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nn7;->a:Ll/no7;

    iput-object p2, p0, Ll/nn7;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nn7;->a:Ll/no7;

    iget-object p0, p0, Ll/nn7;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {v0, p0, p1}, Ll/no7;->a3(Ll/no7;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method
