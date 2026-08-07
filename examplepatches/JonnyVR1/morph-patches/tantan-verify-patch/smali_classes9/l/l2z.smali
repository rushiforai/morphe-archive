.class public final synthetic Ll/l2z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d3z;


# direct methods
.method public synthetic constructor <init>(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2z;->a:Ll/d3z;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2z;->a:Ll/d3z;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {p0, p1}, Ll/d3z;->i(Ll/d3z;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method
