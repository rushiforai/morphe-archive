.class public final synthetic Ll/bu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/DbLinks;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;ZLcom/p1/mobile/putong/data/DbLinks;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-boolean p2, p0, Ll/bu7;->b:Z

    iput-object p3, p0, Ll/bu7;->c:Lcom/p1/mobile/putong/data/DbLinks;

    iput-object p4, p0, Ll/bu7;->d:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-boolean v1, p0, Ll/bu7;->b:Z

    iget-object v2, p0, Ll/bu7;->c:Lcom/p1/mobile/putong/data/DbLinks;

    iget-object p0, p0, Ll/bu7;->d:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->W3(Lcom/p1/mobile/putong/core/api/g;ZLcom/p1/mobile/putong/data/DbLinks;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
