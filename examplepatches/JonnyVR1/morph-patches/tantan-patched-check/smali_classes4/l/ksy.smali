.class public final synthetic Ll/ksy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Merchandise;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ksy;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    iput-boolean p2, p0, Ll/ksy;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ksy;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    iget-boolean p0, p0, Ll/ksy;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, p0, p1}, Ll/zry$e;->c(Lcom/p1/mobile/putong/core/data/Merchandise;ZLcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
