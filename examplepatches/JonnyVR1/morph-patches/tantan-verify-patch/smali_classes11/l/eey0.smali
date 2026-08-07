.class public final Ll/eey0;
.super Ll/hey0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hey0;"
    }
.end annotation


# instance fields
.field public final synthetic b:Ll/scy0;


# direct methods
.method public constructor <init>(Ll/scy0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/eey0;->b:Ll/scy0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/hey0;-><init>(Ll/scy0;Ll/qey0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public synthetic constructor <init>(Ll/scy0;Ll/qey0;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Ll/eey0;-><init>(Ll/scy0;)V

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 2

    .line 1
    new-instance v0, Ll/zcy0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/eey0;->b:Ll/scy0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, v1}, Ll/zcy0;-><init>(Ll/scy0;Ll/qey0;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
