.class public final synthetic Ll/a1i;
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

    iput-object p1, p0, Ll/a1i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    check-cast p1, Ll/vg60;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->d0(Lcom/tantanapp/common/data/JsonAdapter;Ll/vg60;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method
