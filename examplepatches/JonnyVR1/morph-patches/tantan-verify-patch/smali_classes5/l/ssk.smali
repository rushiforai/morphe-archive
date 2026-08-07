.class public final synthetic Ll/ssk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/UserStatus;

    invoke-static {p1}, Ll/qtk;->L(Lcom/p1/mobile/putong/data/UserStatus;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
