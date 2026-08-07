.class public final synthetic Ll/v2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/a3l;

.field public final synthetic b:Ll/q2l;


# direct methods
.method public synthetic constructor <init>(Ll/a3l;Ll/q2l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v2l;->a:Ll/a3l;

    iput-object p2, p0, Ll/v2l;->b:Ll/q2l;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v2l;->a:Ll/a3l;

    iget-object p0, p0, Ll/v2l;->b:Ll/q2l;

    invoke-static {v0, p0}, Ll/a3l;->k0(Ll/a3l;Ll/q2l;)V

    return-void
.end method
