.class public final synthetic Ll/dmm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/fmm;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmm;->a:Ll/fmm;

    iput-object p2, p0, Ll/dmm;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/dmm;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p4, p0, Ll/dmm;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dmm;->a:Ll/fmm;

    iget-object v1, p0, Ll/dmm;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/dmm;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/dmm;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Ll/fmm;->n0(Ll/fmm;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method
