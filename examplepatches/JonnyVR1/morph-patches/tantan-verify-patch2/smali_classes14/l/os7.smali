.class public final synthetic Ll/os7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/os7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/os7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/os7;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/os7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/os7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/os7;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->cc(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
