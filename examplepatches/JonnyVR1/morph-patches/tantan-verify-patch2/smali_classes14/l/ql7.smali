.class public final synthetic Ll/ql7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ql7;->a:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ql7;->a:Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->f6(Lcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method
