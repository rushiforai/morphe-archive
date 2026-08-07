.class public final synthetic Ll/r0t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/v0t;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PushMessageCustom;


# direct methods
.method public synthetic constructor <init>(Ll/v0t;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r0t;->a:Ll/v0t;

    iput-object p2, p0, Ll/r0t;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r0t;->a:Ll/v0t;

    iget-object p0, p0, Ll/r0t;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    invoke-static {v0, p0}, Ll/v0t;->d(Ll/v0t;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    return-void
.end method
