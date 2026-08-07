.class public final synthetic Ll/c9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g9x;


# direct methods
.method public synthetic constructor <init>(Ll/g9x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9x;->a:Ll/g9x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9x;->a:Ll/g9x;

    invoke-static {p0}, Ll/g9x;->j(Ll/g9x;)V

    return-void
.end method
