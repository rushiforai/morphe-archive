.class public final synthetic Ll/a3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b3g;


# direct methods
.method public synthetic constructor <init>(Ll/b3g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a3g;->a:Ll/b3g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a3g;->a:Ll/b3g;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/b3g;->e0(Ll/b3g;Ljava/lang/Integer;)V

    return-void
.end method
