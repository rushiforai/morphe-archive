.class public final synthetic Ll/v5a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/g6a0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5a0;->a:Ll/g6a0;

    iput-object p2, p0, Ll/v5a0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/v5a0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v5a0;->a:Ll/g6a0;

    iget-object v1, p0, Ll/v5a0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/v5a0;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1, p2}, Ll/g6a0;->b1(Ll/g6a0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
