.class public final synthetic Ll/xl5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xl5;->a:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xl5;->a:Ll/bm5;

    invoke-static {p0}, Ll/bm5;->A(Ll/bm5;)V

    return-void
.end method
