.class public final synthetic Ll/rpu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rpu0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ll/fks0;

    .line 2
    .line 3
    new-instance v0, Ll/tpu0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rpu0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/tpu0;-><init>(Ljava/lang/String;Ll/fks0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
