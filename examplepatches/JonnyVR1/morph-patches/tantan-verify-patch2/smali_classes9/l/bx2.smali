.class public final synthetic Ll/bx2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gx2;


# direct methods
.method public synthetic constructor <init>(Ll/gx2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bx2;->a:Ll/gx2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bx2;->a:Ll/gx2;

    invoke-static {p0}, Ll/gx2;->J3(Ll/gx2;)V

    return-void
.end method
