.class public final synthetic Ll/z2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f3x;


# direct methods
.method public synthetic constructor <init>(Ll/f3x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z2x;->a:Ll/f3x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z2x;->a:Ll/f3x;

    invoke-static {p0}, Ll/f3x;->m0(Ll/f3x;)V

    return-void
.end method
