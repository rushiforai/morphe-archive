.class public final synthetic Ll/hpy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fqy0;

.field public final synthetic b:Ll/vwx0;


# direct methods
.method public synthetic constructor <init>(Ll/fqy0;Ll/vwx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hpy0;->a:Ll/fqy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hpy0;->b:Ll/vwx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hpy0;->a:Ll/fqy0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hpy0;->b:Ll/vwx0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/fqy0;->q(Ll/vwx0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
