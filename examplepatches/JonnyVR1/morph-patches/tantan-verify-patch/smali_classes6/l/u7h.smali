.class public final synthetic Ll/u7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b8h;


# direct methods
.method public synthetic constructor <init>(Ll/b8h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u7h;->a:Ll/b8h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7h;->a:Ll/b8h;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/b8h;->I(Ll/b8h;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
