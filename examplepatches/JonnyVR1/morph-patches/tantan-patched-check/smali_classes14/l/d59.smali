.class public final synthetic Ll/d59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/e59;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreData;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/e59;Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d59;->a:Ll/e59;

    iput-object p2, p0, Ll/d59;->b:Lcom/p1/mobile/putong/core/data/CoreData;

    iput-object p3, p0, Ll/d59;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d59;->a:Ll/e59;

    iget-object v1, p0, Ll/d59;->b:Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p0, p0, Ll/d59;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/e59;->e3(Ll/e59;Lcom/p1/mobile/putong/core/data/CoreData;Ljava/lang/String;)V

    return-void
.end method
