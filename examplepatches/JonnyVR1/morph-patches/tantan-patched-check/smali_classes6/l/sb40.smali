.class public final synthetic Ll/sb40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ub40;


# direct methods
.method public synthetic constructor <init>(Ll/ub40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sb40;->a:Ll/ub40;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sb40;->a:Ll/ub40;

    invoke-static {p0}, Ll/ub40;->c(Ll/ub40;)V

    return-void
.end method
