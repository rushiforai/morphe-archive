.class public final synthetic Ll/nd8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/sd8;


# direct methods
.method public synthetic constructor <init>(ZLl/sd8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/nd8;->a:Z

    iput-object p2, p0, Ll/nd8;->b:Ll/sd8;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nd8;->a:Z

    iget-object p0, p0, Ll/nd8;->b:Ll/sd8;

    invoke-static {v0, p0}, Ll/sd8;->f3(ZLl/sd8;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
