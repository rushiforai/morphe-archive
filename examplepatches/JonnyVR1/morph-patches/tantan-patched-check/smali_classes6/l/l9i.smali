.class public final synthetic Ll/l9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o9i;


# direct methods
.method public synthetic constructor <init>(Ll/o9i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l9i;->a:Ll/o9i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l9i;->a:Ll/o9i;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/o9i;->b(Ll/o9i;Ljava/lang/Boolean;)V

    return-void
.end method
