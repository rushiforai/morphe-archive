.class public final synthetic Ll/j4f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l4f$b;


# direct methods
.method public synthetic constructor <init>(Ll/l4f$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4f;->a:Ll/l4f$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j4f;->a:Ll/l4f$b;

    check-cast p1, Ll/l4f$a;

    invoke-interface {p0, p1}, Ll/l4f$b;->a(Ll/l4f$a;)V

    return-void
.end method
