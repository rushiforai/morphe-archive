.class public final synthetic Ll/hkf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mkf;


# direct methods
.method public synthetic constructor <init>(Ll/mkf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hkf;->a:Ll/mkf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hkf;->a:Ll/mkf;

    invoke-static {p0}, Ll/mkf;->A(Ll/mkf;)V

    return-void
.end method
