.class public final synthetic Ll/jxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lrx/c;


# direct methods
.method public synthetic constructor <init>(Lrx/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jxr;->a:Lrx/c;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxr;->a:Lrx/c;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->y(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
