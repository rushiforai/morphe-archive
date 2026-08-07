.class public final synthetic Ll/bh5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jh5;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bh5;->a:Ll/jh5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh5;->a:Ll/jh5;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/jh5;->x(Ll/jh5;Ljava/lang/CharSequence;)V

    return-void
.end method
