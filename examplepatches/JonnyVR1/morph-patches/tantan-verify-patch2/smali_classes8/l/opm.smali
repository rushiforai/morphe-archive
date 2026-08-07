.class public final synthetic Ll/opm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/opm;->a:Z

    iput-object p2, p0, Ll/opm;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/opm;->a:Z

    iget-object p0, p0, Ll/opm;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/upm;->e(ZLl/y20;)V

    return-void
.end method
