.class public final synthetic Ll/x0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/JsonAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x0i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->g0(Lcom/tantanapp/common/data/JsonAdapter;Ll/pf60;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
