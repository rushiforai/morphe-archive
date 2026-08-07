.class public final synthetic Ll/yex;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/yex;->a:I

    iput-object p2, p0, Ll/yex;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget v0, p0, Ll/yex;->a:I

    iget-object p0, p0, Ll/yex;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    invoke-static {v0, p0}, Ll/bfx;->c(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method
