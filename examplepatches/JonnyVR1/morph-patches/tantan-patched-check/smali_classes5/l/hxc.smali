.class public final synthetic Ll/hxc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;ZLcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxc;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/hxc;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/hxc;->c:Z

    iput-object p4, p0, Ll/hxc;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hxc;->a:Ljava/util/ArrayList;

    iget-object v1, p0, Ll/hxc;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/hxc;->c:Z

    iget-object p0, p0, Ll/hxc;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->fd(Ljava/util/ArrayList;Ljava/lang/String;ZLcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
