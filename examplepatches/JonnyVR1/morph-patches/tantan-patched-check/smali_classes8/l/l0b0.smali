.class public final synthetic Ll/l0b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/l0b0;->a:I

    iput-object p2, p0, Ll/l0b0;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iput-object p3, p0, Ll/l0b0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Ll/l0b0;->a:I

    iget-object v1, p0, Ll/l0b0;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iget-object p0, p0, Ll/l0b0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0}, Ll/o0b0;->d(ILcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
