.class public final synthetic Ll/fai;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gai;


# direct methods
.method public synthetic constructor <init>(Ll/gai;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fai;->a:Ll/gai;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fai;->a:Ll/gai;

    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-static {p0, p1}, Ll/gai;->E(Ll/gai;Lcom/p1/mobile/putong/data/Live;)V

    return-void
.end method
