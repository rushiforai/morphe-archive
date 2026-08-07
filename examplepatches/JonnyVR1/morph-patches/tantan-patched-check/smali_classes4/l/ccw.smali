.class public final synthetic Ll/ccw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fcw;


# direct methods
.method public synthetic constructor <init>(Ll/fcw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ccw;->a:Ll/fcw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccw;->a:Ll/fcw;

    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    return-void
.end method
