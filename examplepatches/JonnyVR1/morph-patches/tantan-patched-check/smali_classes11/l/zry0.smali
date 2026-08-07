.class public final synthetic Ll/zry0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nqy0;

.field public final synthetic b:Ll/jqy0;


# direct methods
.method public synthetic constructor <init>(Ll/nqy0;Ll/jqy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zry0;->a:Ll/nqy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zry0;->b:Ll/jqy0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zry0;->a:Ll/nqy0;

    .line 2
    .line 3
    check-cast v0, Ll/oty0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/oty0;->a:Ll/pty0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/zry0;->b:Ll/jqy0;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/fqy0;->d(Ll/jqy0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
