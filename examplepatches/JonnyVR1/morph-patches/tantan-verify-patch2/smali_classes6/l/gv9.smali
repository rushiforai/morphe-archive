.class public final synthetic Ll/gv9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/gv9;->a:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/gv9;->a:J

    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->J1(J)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
