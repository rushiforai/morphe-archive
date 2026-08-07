.class public final synthetic Ll/rqx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uqx$a;


# direct methods
.method public synthetic constructor <init>(Ll/uqx$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rqx;->a:Ll/uqx$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rqx;->a:Ll/uqx$a;

    invoke-static {p0}, Ll/uqx$a;->m0(Ll/uqx$a;)V

    return-void
.end method
