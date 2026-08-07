.class public final synthetic Ll/q540;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q540;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q540;->a:Lcom/p1/mobile/putong/data/User;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->Y0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
