.class public final synthetic Ll/qy9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qy9;->a:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qy9;->a:Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/b;->x2(Lcom/p1/mobile/putong/data/DbLinks;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
