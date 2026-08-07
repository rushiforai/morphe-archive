.class public final synthetic Ll/w78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w78;->a:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p2, p0, Ll/w78;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w78;->a:Lcom/p1/mobile/putong/data/Envelope;

    iget-object p0, p0, Ll/w78;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->l4(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/List;)V

    return-void
.end method
