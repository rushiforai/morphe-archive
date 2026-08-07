.class public final synthetic Ll/dw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;


# direct methods
.method public synthetic constructor <init>(Ll/uw2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dw2;->a:Ll/uw2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dw2;->a:Ll/uw2;

    invoke-static {p0}, Ll/uw2;->H(Ll/uw2;)V

    return-void
.end method
