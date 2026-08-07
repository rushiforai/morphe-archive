.class public final synthetic Ll/h0f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rg50;

.field public final synthetic b:Ll/x1d0;


# direct methods
.method public synthetic constructor <init>(Ll/rg50;Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h0f0;->a:Ll/rg50;

    iput-object p2, p0, Ll/h0f0;->b:Ll/x1d0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h0f0;->a:Ll/rg50;

    iget-object p0, p0, Ll/h0f0;->b:Ll/x1d0;

    invoke-static {v0, p0}, Ll/i0f0;->a(Ll/rg50;Ll/x1d0;)V

    return-void
.end method
