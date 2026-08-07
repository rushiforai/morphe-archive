.class public final synthetic Ll/y1u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e2u;


# direct methods
.method public synthetic constructor <init>(Ll/e2u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y1u;->a:Ll/e2u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1u;->a:Ll/e2u;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/e2u;->D(Ll/e2u;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
