.class public final synthetic Ll/yd90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yd90;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yd90;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    check-cast p1, Ll/be90;

    invoke-static {p0, p1}, Ll/zd90;->a(Lcom/p1/mobile/putong/core/data/Privilege;Ll/be90;)Z

    move-result p0

    return p0
.end method
