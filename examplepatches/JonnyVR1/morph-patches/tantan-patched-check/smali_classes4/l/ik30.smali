.class public final synthetic Ll/ik30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mk30;


# direct methods
.method public synthetic constructor <init>(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ik30;->a:Ll/mk30;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ik30;->a:Ll/mk30;

    invoke-static {p0}, Ll/mk30;->a(Ll/mk30;)V

    return-void
.end method
