.class public final synthetic Ll/t2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u2x;


# direct methods
.method public synthetic constructor <init>(Ll/u2x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2x;->a:Ll/u2x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t2x;->a:Ll/u2x;

    invoke-static {p0}, Ll/u2x;->j(Ll/u2x;)V

    return-void
.end method
