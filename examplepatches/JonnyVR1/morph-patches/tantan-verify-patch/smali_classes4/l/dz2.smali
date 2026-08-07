.class public final synthetic Ll/dz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mz2;


# direct methods
.method public synthetic constructor <init>(Ll/mz2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dz2;->a:Ll/mz2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dz2;->a:Ll/mz2;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/mz2;->k(Ll/mz2;Ljava/lang/CharSequence;)V

    return-void
.end method
