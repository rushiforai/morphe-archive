.class public final synthetic Ll/rrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Ll/f2e0;

.field public final synthetic b:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Ll/f2e0;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rrd0;->a:Ll/f2e0;

    iput-object p2, p0, Ll/rrd0;->b:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rrd0;->a:Ll/f2e0;

    iget-object p0, p0, Ll/rrd0;->b:Ljava/lang/Exception;

    check-cast p1, Lrx/c;

    invoke-static {v0, p0, p1}, Ll/trd0;->c(Ll/f2e0;Ljava/lang/Exception;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
