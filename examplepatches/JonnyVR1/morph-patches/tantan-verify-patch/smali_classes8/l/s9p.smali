.class public final synthetic Ll/s9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r9p;


# direct methods
.method public synthetic constructor <init>(Ll/r9p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s9p;->a:Ll/r9p;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s9p;->a:Ll/r9p;

    invoke-static {p0}, Ll/r9p$b;->b(Ll/r9p;)V

    return-void
.end method
