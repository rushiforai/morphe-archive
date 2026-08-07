.class public final synthetic Ll/l53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w53;


# direct methods
.method public synthetic constructor <init>(Ll/w53;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l53;->a:Ll/w53;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l53;->a:Ll/w53;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/w53;->h(Ll/w53;Ljava/lang/Boolean;)V

    return-void
.end method
