.class public final synthetic Ll/pf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pf;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/pf;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf;->a:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/pf;->b:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/api/a;->p0(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/SignUpData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
