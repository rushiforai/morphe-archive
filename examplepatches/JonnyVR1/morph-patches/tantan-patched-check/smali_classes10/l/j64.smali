.class public final synthetic Ll/j64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d74;


# direct methods
.method public synthetic constructor <init>(Ll/d74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j64;->a:Ll/d74;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j64;->a:Ll/d74;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/d74;->Y3(Ll/d74;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
