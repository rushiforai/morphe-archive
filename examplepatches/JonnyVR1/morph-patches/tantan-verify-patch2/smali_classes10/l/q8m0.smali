.class public final synthetic Ll/q8m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r8m0;

.field public final synthetic b:Ll/ado0;


# direct methods
.method public synthetic constructor <init>(Ll/r8m0;Ll/ado0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8m0;->a:Ll/r8m0;

    iput-object p2, p0, Ll/q8m0;->b:Ll/ado0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q8m0;->a:Ll/r8m0;

    iget-object p0, p0, Ll/q8m0;->b:Ll/ado0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;

    invoke-static {v0, p0, p1}, Ll/r8m0;->H(Ll/r8m0;Ll/ado0;Lcom/p1/mobile/putong/live/base/data/BLiveCallConnection;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
