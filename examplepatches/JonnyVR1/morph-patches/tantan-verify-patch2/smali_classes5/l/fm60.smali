.class public final synthetic Ll/fm60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/im60;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Merchandise;


# direct methods
.method public synthetic constructor <init>(Ll/im60;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fm60;->a:Ll/im60;

    iput-object p2, p0, Ll/fm60;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fm60;->a:Ll/im60;

    iget-object p0, p0, Ll/fm60;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, p0}, Ll/im60;->l(Ll/im60;Lcom/p1/mobile/putong/core/data/Merchandise;)V

    return-void
.end method
