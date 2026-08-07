.class public final synthetic Ll/z5a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/v;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/v;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z5a;->a:Lcom/p1/mobile/putong/core/api/v;

    iput-boolean p2, p0, Ll/z5a;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z5a;->a:Lcom/p1/mobile/putong/core/api/v;

    iget-boolean p0, p0, Ll/z5a;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/v;->f3(Lcom/p1/mobile/putong/core/api/v;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
