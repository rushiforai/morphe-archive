.class public final synthetic Ll/x1i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y1i0;


# direct methods
.method public synthetic constructor <init>(Ll/y1i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x1i0;->a:Ll/y1i0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1i0;->a:Ll/y1i0;

    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    return-void
.end method
