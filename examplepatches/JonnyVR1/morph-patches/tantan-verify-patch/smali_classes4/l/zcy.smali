.class public final synthetic Ll/zcy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/idy;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/idy;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zcy;->a:Ll/idy;

    iput-boolean p2, p0, Ll/zcy;->b:Z

    iput-object p3, p0, Ll/zcy;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zcy;->a:Ll/idy;

    iget-boolean v1, p0, Ll/zcy;->b:Z

    iget-object p0, p0, Ll/zcy;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0}, Ll/idy;->m0(Ll/idy;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
