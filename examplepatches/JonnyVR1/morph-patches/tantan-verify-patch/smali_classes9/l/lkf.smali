.class public final synthetic Ll/lkf;
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

    iput-object p1, p0, Ll/lkf;->a:Ll/mkf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lkf;->a:Ll/mkf;

    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    return-void
.end method
