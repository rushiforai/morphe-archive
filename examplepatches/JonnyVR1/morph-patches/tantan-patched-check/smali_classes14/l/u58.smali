.class public final synthetic Ll/u58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u58;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-boolean p2, p0, Ll/u58;->b:Z

    iput-object p3, p0, Ll/u58;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u58;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-boolean v1, p0, Ll/u58;->b:Z

    iget-object p0, p0, Ll/u58;->c:Ljava/lang/String;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ca(Lcom/p1/mobile/putong/core/api/g;ZLjava/lang/String;Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
