.class public final synthetic Ll/gke;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/data/SignUpData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/gke;->a:Z

    iput-object p2, p0, Ll/gke;->b:Lcom/p1/mobile/putong/data/SignUpData;

    iput-boolean p3, p0, Ll/gke;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/gke;->a:Z

    iget-object v1, p0, Ll/gke;->b:Lcom/p1/mobile/putong/data/SignUpData;

    iget-boolean p0, p0, Ll/gke;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/ike;->c(ZLcom/p1/mobile/putong/data/SignUpData;ZLl/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
