.class public final synthetic Ll/ed3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ld3;


# direct methods
.method public synthetic constructor <init>(Ll/ld3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ed3;->a:Ll/ld3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ed3;->a:Ll/ld3;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/ld3;->b(Ll/ld3;Ljava/lang/Long;)V

    return-void
.end method
