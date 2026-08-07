.class public final synthetic Ll/cq90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dq90;


# direct methods
.method public synthetic constructor <init>(Ll/dq90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cq90;->a:Ll/dq90;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cq90;->a:Ll/dq90;

    invoke-static {p0}, Ll/dq90;->n(Ll/dq90;)V

    return-void
.end method
