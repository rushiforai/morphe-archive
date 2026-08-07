.class public final synthetic Ll/wbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ybh0;


# direct methods
.method public synthetic constructor <init>(Ll/ybh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wbh0;->a:Ll/ybh0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wbh0;->a:Ll/ybh0;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {p0, p1}, Ll/ybh0;->U(Ll/ybh0;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
