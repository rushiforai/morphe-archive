.class public final synthetic Ll/pfs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/setting/b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/page/setting/b;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfs;->a:Lcom/p1/mobile/putong/live/external/page/setting/b;

    iput-object p2, p0, Ll/pfs;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/pfs;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pfs;->a:Lcom/p1/mobile/putong/live/external/page/setting/b;

    iget-object v1, p0, Ll/pfs;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/pfs;->c:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/b;->v2(Lcom/p1/mobile/putong/live/external/page/setting/b;Ljava/lang/String;ZLjava/lang/Throwable;)V

    return-void
.end method
