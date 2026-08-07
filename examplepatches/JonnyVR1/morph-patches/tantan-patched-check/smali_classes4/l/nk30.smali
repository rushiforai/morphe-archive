.class public final synthetic Ll/nk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mk30$d;


# direct methods
.method public synthetic constructor <init>(Ll/mk30$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nk30;->a:Ll/mk30$d;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk30;->a:Ll/mk30$d;

    invoke-static {p0}, Ll/mk30$d;->a(Ll/mk30$d;)V

    return-void
.end method
