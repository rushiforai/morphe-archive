.class public final synthetic Ll/bwz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwz;->a:Ll/yxz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwz;->a:Ll/yxz;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-virtual {p0, p1}, Ll/yxz;->k5(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
