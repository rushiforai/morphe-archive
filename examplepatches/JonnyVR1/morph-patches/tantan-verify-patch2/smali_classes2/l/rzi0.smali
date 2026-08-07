.class public final synthetic Ll/rzi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/szi0;

.field public final synthetic b:Ll/e3g0;


# direct methods
.method public synthetic constructor <init>(Ll/szi0;Ll/e3g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rzi0;->a:Ll/szi0;

    iput-object p2, p0, Ll/rzi0;->b:Ll/e3g0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rzi0;->a:Ll/szi0;

    iget-object p0, p0, Ll/rzi0;->b:Ll/e3g0;

    invoke-static {v0, p0}, Ll/szi0;->a(Ll/szi0;Ll/e3g0;)V

    return-void
.end method
