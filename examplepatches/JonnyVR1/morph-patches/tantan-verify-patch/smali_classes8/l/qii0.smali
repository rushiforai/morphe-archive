.class public final synthetic Ll/qii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Literatures;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

.field public final synthetic c:Ll/xc00;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qii0;->a:Lcom/p1/mobile/putong/core/data/Literatures;

    iput-object p2, p0, Ll/qii0;->b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    iput-object p3, p0, Ll/qii0;->c:Ll/xc00;

    iput-object p4, p0, Ll/qii0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qii0;->a:Lcom/p1/mobile/putong/core/data/Literatures;

    iget-object v1, p0, Ll/qii0;->b:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    iget-object v2, p0, Ll/qii0;->c:Ll/xc00;

    iget-object p0, p0, Ll/qii0;->d:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p0, p1}, Ll/gji0;->R(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ll/xc00;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
