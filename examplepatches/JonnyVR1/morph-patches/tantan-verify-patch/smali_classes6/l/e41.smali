.class public final synthetic Ll/e41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f41;


# direct methods
.method public synthetic constructor <init>(Ll/f41;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e41;->a:Ll/f41;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e41;->a:Ll/f41;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/f41;->x(Ll/f41;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
