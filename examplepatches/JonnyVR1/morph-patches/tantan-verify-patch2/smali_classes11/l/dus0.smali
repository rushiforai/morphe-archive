.class public final synthetic Ll/dus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bvs0;

.field public final synthetic b:Ll/avs0;


# direct methods
.method public synthetic constructor <init>(Ll/bvs0;Ll/v2s0;Ll/avs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dus0;->a:Ll/bvs0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/dus0;->b:Ll/avs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dus0;->a:Ll/bvs0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Ll/dus0;->b:Ll/avs0;

    .line 5
    .line 6
    invoke-virtual {v0, v1, p0}, Ll/bvs0;->j(Ll/v2s0;Ll/avs0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
