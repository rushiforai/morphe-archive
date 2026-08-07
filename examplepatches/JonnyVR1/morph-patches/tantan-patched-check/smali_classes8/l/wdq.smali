.class public final synthetic Ll/wdq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zdq;


# direct methods
.method public synthetic constructor <init>(Ll/zdq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdq;->a:Ll/zdq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdq;->a:Ll/zdq;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Ll/zdq;->J(Ll/zdq;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
