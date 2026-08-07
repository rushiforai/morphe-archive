.class public final synthetic Ll/uja0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cla0;


# direct methods
.method public synthetic constructor <init>(Ll/cla0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uja0;->a:Ll/cla0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uja0;->a:Ll/cla0;

    check-cast p1, Lcom/p1/mobile/putong/data/PicVerification;

    invoke-static {p0, p1}, Ll/cla0;->t1(Ll/cla0;Lcom/p1/mobile/putong/data/PicVerification;)V

    return-void
.end method
