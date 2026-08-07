.class public final synthetic Ll/vmr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vmr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vmr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    check-cast p1, Ll/vg60;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->S0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;Ljava/lang/Boolean;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method
