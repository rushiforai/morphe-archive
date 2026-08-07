.class public final synthetic Ll/y2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b3g;


# direct methods
.method public synthetic constructor <init>(Ll/b3g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y2g;->a:Ll/b3g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y2g;->a:Ll/b3g;

    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-static {p0, p1}, Ll/b3g;->f0(Ll/b3g;Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method
