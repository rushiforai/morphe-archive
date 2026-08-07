.class public final synthetic Ll/y03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z03;


# direct methods
.method public synthetic constructor <init>(Ll/z03;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y03;->a:Ll/z03;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y03;->a:Ll/z03;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/z03;->a(Ll/z03;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
