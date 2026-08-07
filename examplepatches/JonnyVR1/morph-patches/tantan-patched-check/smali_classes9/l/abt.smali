.class public final synthetic Ll/abt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ebt;


# direct methods
.method public synthetic constructor <init>(Ll/ebt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abt;->a:Ll/ebt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abt;->a:Ll/ebt;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/ebt;->e(Ll/ebt;Ljava/lang/Boolean;)V

    return-void
.end method
