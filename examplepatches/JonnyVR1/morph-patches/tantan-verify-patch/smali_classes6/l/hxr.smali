.class public final synthetic Ll/hxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d3q;


# direct methods
.method public synthetic constructor <init>(Ll/d3q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxr;->a:Ll/d3q;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxr;->a:Ll/d3q;

    check-cast p1, Ll/d3q;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->z(Ll/d3q;Ll/d3q;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
