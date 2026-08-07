.class public final synthetic Ll/nv30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/b240;


# direct methods
.method public synthetic constructor <init>(Ll/b240;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nv30;->a:Ll/b240;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nv30;->a:Ll/b240;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/b240;->e2(Ll/b240;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
