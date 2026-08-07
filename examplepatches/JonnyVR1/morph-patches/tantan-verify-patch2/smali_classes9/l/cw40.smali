.class public final synthetic Ll/cw40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cw40;->a:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cw40;->a:Ljava/util/HashMap;

    check-cast p1, Ll/nsv;

    invoke-static {p0, p1}, Ll/dw40;->u2(Ljava/util/HashMap;Ll/nsv;)Ll/nsv;

    move-result-object p0

    return-object p0
.end method
