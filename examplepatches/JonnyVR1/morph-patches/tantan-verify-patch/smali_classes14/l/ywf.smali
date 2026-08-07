.class public final synthetic Ll/ywf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zwf;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Ll/zwf;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ywf;->a:Ll/zwf;

    iput-object p2, p0, Ll/ywf;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ywf;->a:Ll/zwf;

    iget-object p0, p0, Ll/ywf;->b:Ll/l4g0;

    invoke-static {v0, p0}, Ll/zwf;->n0(Ll/zwf;Ll/l4g0;)V

    return-void
.end method
