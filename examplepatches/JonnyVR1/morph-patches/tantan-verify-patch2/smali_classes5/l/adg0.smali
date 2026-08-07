.class public final synthetic Ll/adg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/edg0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Contract;


# direct methods
.method public synthetic constructor <init>(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/adg0;->a:Ll/edg0;

    iput-object p2, p0, Ll/adg0;->b:Lcom/p1/mobile/putong/data/Contract;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/adg0;->a:Ll/edg0;

    iget-object p0, p0, Ll/adg0;->b:Lcom/p1/mobile/putong/data/Contract;

    invoke-static {v0, p0}, Ll/edg0;->h0(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method
