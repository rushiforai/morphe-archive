.class public final synthetic Ll/o7j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p7j0;


# direct methods
.method public synthetic constructor <init>(Ll/p7j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7j0;->a:Ll/p7j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7j0;->a:Ll/p7j0;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/p7j0;->G(Ll/p7j0;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
