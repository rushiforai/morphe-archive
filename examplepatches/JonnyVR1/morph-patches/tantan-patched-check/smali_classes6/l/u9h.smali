.class public final synthetic Ll/u9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y9h;


# direct methods
.method public synthetic constructor <init>(Ll/y9h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9h;->a:Ll/y9h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9h;->a:Ll/y9h;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/y9h;->c(Ll/y9h;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
