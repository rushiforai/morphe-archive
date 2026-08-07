.class public final synthetic Ll/pw70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gx70;


# direct methods
.method public synthetic constructor <init>(Ll/gx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pw70;->a:Ll/gx70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pw70;->a:Ll/gx70;

    invoke-static {p0}, Ll/gx70;->Z3(Ll/gx70;)V

    return-void
.end method
