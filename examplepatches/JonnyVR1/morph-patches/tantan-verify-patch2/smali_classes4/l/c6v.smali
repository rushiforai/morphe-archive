.class public final synthetic Ll/c6v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g6v;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/g6v;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6v;->a:Ll/g6v;

    iput-object p2, p0, Ll/c6v;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c6v;->a:Ll/g6v;

    iget-object p0, p0, Ll/c6v;->b:Ljava/lang/String;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/g6v;->b(Ll/g6v;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method
