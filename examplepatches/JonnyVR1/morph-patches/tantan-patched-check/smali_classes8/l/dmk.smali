.class public final synthetic Ll/dmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hmk;


# direct methods
.method public synthetic constructor <init>(Ll/hmk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmk;->a:Ll/hmk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dmk;->a:Ll/hmk;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-static {p0, p1}, Ll/hmk;->t0(Ll/hmk;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method
