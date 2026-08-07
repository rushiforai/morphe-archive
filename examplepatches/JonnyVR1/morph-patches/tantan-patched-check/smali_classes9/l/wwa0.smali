.class public final synthetic Ll/wwa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xwa0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/UserTagsData;


# direct methods
.method public synthetic constructor <init>(Ll/xwa0;Lcom/p1/mobile/putong/core/data/UserTagsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wwa0;->a:Ll/xwa0;

    iput-object p2, p0, Ll/wwa0;->b:Lcom/p1/mobile/putong/core/data/UserTagsData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwa0;->a:Ll/xwa0;

    iget-object p0, p0, Ll/wwa0;->b:Lcom/p1/mobile/putong/core/data/UserTagsData;

    invoke-static {v0, p0}, Ll/xwa0;->X(Ll/xwa0;Lcom/p1/mobile/putong/core/data/UserTagsData;)V

    return-void
.end method
