.class public final synthetic Ll/abl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/cbl0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/cbl0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abl0;->a:Ll/cbl0;

    iput-object p2, p0, Ll/abl0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/abl0;->a:Ll/cbl0;

    iget-object p0, p0, Ll/abl0;->b:Ljava/lang/String;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/cbl0;->b(Ll/cbl0;Ljava/lang/String;Ll/gcg0;)V

    return-void
.end method
