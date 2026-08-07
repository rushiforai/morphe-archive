.class public final synthetic Ll/nkf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rkf0;


# direct methods
.method public synthetic constructor <init>(Ll/rkf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nkf0;->a:Ll/rkf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nkf0;->a:Ll/rkf0;

    invoke-static {p0}, Ll/rkf0;->A(Ll/rkf0;)V

    return-void
.end method
