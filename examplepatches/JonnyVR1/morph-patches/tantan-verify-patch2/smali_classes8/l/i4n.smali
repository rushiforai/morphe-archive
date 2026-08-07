.class public final synthetic Ll/i4n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j4n;


# direct methods
.method public synthetic constructor <init>(Ll/j4n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i4n;->a:Ll/j4n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i4n;->a:Ll/j4n;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {p0, p1}, Ll/j4n;->g0(Ll/j4n;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method
