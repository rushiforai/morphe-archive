.class public final synthetic Ll/qxn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ayn0;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ll/ayn0;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qxn0;->a:Ll/ayn0;

    iput-object p2, p0, Ll/qxn0;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qxn0;->a:Ll/ayn0;

    iget-object p0, p0, Ll/qxn0;->b:Ljava/util/HashMap;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/ayn0;->q0(Ll/ayn0;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;

    move-result-object p0

    return-object p0
.end method
