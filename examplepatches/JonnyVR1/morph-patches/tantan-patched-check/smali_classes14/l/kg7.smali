.class public final synthetic Ll/kg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kg7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/kg7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kg7;->c:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kg7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/kg7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/kg7;->c:Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/e;->H3(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method
