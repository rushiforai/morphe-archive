.class public final synthetic Ll/ibv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kbv;

.field public final synthetic b:Ll/r0u;


# direct methods
.method public synthetic constructor <init>(Ll/kbv;Ll/r0u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibv;->a:Ll/kbv;

    iput-object p2, p0, Ll/ibv;->b:Ll/r0u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibv;->a:Ll/kbv;

    iget-object p0, p0, Ll/ibv;->b:Ll/r0u;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/kbv;->c(Ll/kbv;Ll/r0u;Ljava/lang/Integer;)V

    return-void
.end method
