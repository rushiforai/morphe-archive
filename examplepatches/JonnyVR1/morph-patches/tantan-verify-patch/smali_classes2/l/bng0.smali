.class public final synthetic Ll/bng0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uog0;


# instance fields
.field public final synthetic a:Ll/dng0;

.field public final synthetic b:Ltech/sud/gip/core/GameInfo;


# direct methods
.method public synthetic constructor <init>(Ll/dng0;Ltech/sud/gip/core/GameInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bng0;->a:Ll/dng0;

    iput-object p2, p0, Ll/bng0;->b:Ltech/sud/gip/core/GameInfo;

    return-void
.end method


# virtual methods
.method public final a(ZLjava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bng0;->a:Ll/dng0;

    iget-object p0, p0, Ll/bng0;->b:Ltech/sud/gip/core/GameInfo;

    invoke-virtual {v0, p0, p1, p2, p3}, Ll/dng0;->c(Ltech/sud/gip/core/GameInfo;ZLjava/lang/String;Z)V

    return-void
.end method
