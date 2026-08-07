.class public final synthetic Ll/eir;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fir;


# direct methods
.method public synthetic constructor <init>(Ll/fir;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eir;->a:Ll/fir;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eir;->a:Ll/fir;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {p0, p1}, Ll/fir;->b(Ll/fir;Lcom/p1/mobile/putong/core/data/LikedUser;)Ll/fir$c;

    move-result-object p0

    return-object p0
.end method
