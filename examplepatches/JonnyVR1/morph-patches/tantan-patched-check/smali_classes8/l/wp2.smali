.class public final synthetic Ll/wp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/bq2;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/bq2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wp2;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/wp2;->b:Ll/bq2;

    iput-object p3, p0, Ll/wp2;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wp2;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/wp2;->b:Ll/bq2;

    iget-object p0, p0, Ll/wp2;->c:Ljava/lang/String;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/bq2;->a1(Ljava/lang/String;Ll/bq2;Ljava/lang/String;Ll/gcg0;)V

    return-void
.end method
