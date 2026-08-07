.class public final synthetic Ll/aab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/b0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iput-object p2, p0, Ll/aab;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iget-object p0, p0, Ll/aab;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/b0;->p3(Lcom/p1/mobile/putong/core/api/b0;Ljava/lang/String;)V

    return-void
.end method
