.class public final synthetic Ll/u010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/c110;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public synthetic constructor <init>(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u010;->a:Ll/c110;

    iput-object p2, p0, Ll/u010;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u010;->a:Ll/c110;

    iget-object p0, p0, Ll/u010;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    invoke-static {v0, p0}, Ll/c110;->a(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method
