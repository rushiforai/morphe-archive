.class public final synthetic Ll/wsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zsn;


# direct methods
.method public synthetic constructor <init>(Ll/zsn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wsn;->a:Ll/zsn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wsn;->a:Ll/zsn;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeUser;

    invoke-virtual {p0, p1}, Ll/an2;->K(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method
