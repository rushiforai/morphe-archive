.class public final synthetic Ll/h2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j2s;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ll/j2s;


# direct methods
.method public synthetic constructor <init>(Ll/j2s;Ljava/util/List;Ll/j2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h2s;->a:Ll/j2s;

    iput-object p2, p0, Ll/h2s;->b:Ljava/util/List;

    iput-object p3, p0, Ll/h2s;->c:Ll/j2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h2s;->a:Ll/j2s;

    iget-object v1, p0, Ll/h2s;->b:Ljava/util/List;

    iget-object p0, p0, Ll/h2s;->c:Ll/j2s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, v1, p0, p1}, Ll/j2s;->b(Ll/j2s;Ljava/util/List;Ll/j2s;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
